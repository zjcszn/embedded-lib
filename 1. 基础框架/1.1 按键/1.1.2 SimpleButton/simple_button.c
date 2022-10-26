#include "simple_button.h"

#include <string.h>

/******************************** 宏定义 ********************************/

// Ticks宏定义
#define TICKS_INTERVAL          ( 10U)    // 嘀嗒周期：10ms
#define TICKS_FILTER            (  2U)    // 消抖采样次数
#define TICKS_PRESS_REPEAT      ( 20U)    // 嘀嗒计数器阈值：重复按下
#define TICKS_LONG_PRESS        (100U)    // 嘀嗒计数器阈值：长按触发
#define TICKS_LONG_PRESS_HOLD   (  5U)    // 嘀嗒计数器阈值：长按事件推送间隔

// 动作电平宏定义
#define ACT_LEVEL_L             (  0U)    // 按键动作电平：低电平
#define ACT_LEVEL_H             (  1U)    // 按键动作电平：高电平

/******************************* FIFO设置 *******************************/

// FIFO缓冲区大小
#define EVENT_FIFO_SIZE         (16U)
#define EVENT_FIFO_MASK         (EVENT_FIFO_SIZE - 1)

static struct {
  ButtonEvent_T buf[EVENT_FIFO_SIZE];     // FIFO buffer
  uint8_t       r;                        // 读指针
  uint8_t       w;                        // 写指针
} event_fifo = {0};

#define IS_FIFO_EMPTY()         (event_fifo.r == event_fifo.w)
#define IS_FIFO_FULL()          (EVENT_FIFO_SIZE == (event_fifo.w - event_fifo.r))

/****************************** 硬件按键配置 ******************************/

// 硬件按键列表
static HButton_T hbtn_list[HBUTTON_COUNT] = {
  // [硬件按键编号] = {消抖计数器初值， 动作电平}
  [HBUTTON_KEY0] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY1] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY2] = {0, ACT_LEVEL_L},
  [HBUTTON_WKUP] = {0, ACT_LEVEL_H},
};

// 硬件按键状态表
static uint32_t hbtn_status = 0;

// 获取硬件按键IO输入的回调函数
static uint8_t (*read_hbtn_gpio)(uint8_t hbtn_id) = NULL;

// 获取当前的硬件按键状态
#define GET_HBTN_STAT(i)  ((hbtn_status >> i) & 1U)

// 检查硬件按键状态，返回0：状态未改变  返回1：状态改变
static inline int check_hbt_stat(uint8_t hbtn_id) {
  return (GET_HBTN_STAT(hbtn_id) != (read_hbtn_gpio(hbtn_id) == hbtn_list[hbtn_id].act_level));
}

/***************************** 自定义按键配置 *****************************/

// 自定义按键列表
static Button_T button_list[BUTTON_COUNT] = {
  // [自定义按键编号] = {自定义按键编号， 按键类型， FSM初始状态， 组合键1， 组合键2， 计数器初值}
  [BUTTON_KEY0]   = {BUTTON_KEY0,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY0, HBUTTON_NULL, 0},
  [BUTTON_KEY1]   = {BUTTON_KEY1,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY1, HBUTTON_NULL, 0},
  [BUTTON_KEY2]   = {BUTTON_KEY2,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY2, HBUTTON_NULL, 0},
  [BUTTON_WKUP]   = {BUTTON_WKUP,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_WKUP, HBUTTON_NULL, 0},

  [BUTTON_COMBO1] = {BUTTON_COMBO1, BUTTON_TYPE_COMBO,  STATE_IDLE, HBUTTON_WKUP, HBUTTON_KEY0, 0},
  [BUTTON_COMBO2] = {BUTTON_COMBO2, BUTTON_TYPE_COMBO,  STATE_IDLE, HBUTTON_WKUP, HBUTTON_KEY2, 0},
};


/****************************** 私有函数声明 ******************************/


static void hbtn_status_update(void);
static uint8_t get_button_action(Button_T *btn);


/******************************** 函数定义 ********************************/

void hal_button_gpio_regesiter (uint8_t(*hal_func)(uint8_t hbtn_id)) {
  read_hbtn_gpio = hal_func;
}

/**
 * @brief 扫描按键状态，经消抖处理后更新至hbt_status
 * 
 * @param 
 */
static void hbtn_status_update(void) {
  for (int i = 0; i < HBUTTON_COUNT; i++) {
    if (check_hbt_stat(i)) {
      if (++(hbtn_list[i].filter_cnt) >= TICKS_FILTER) {
        hbtn_status = hbtn_status ^ (1U << i);
        hbtn_list[i].filter_cnt = 0;
      }      
    }
    else {
      hbtn_list[i].filter_cnt = 0;
    }
  }
}

/**
 * @brief 获取自定义按键的动作状态
 * 
 * @param  
 * @return uint8_t 0表示按键释放，1表示按键按下，2表示按键被打断
 */
static uint8_t get_button_action(Button_T *btn) {
  if (btn->type == BUTTON_TYPE_SINGLE) {
    if (hbtn_status & ~(1U << btn->hbtn_1)) {
      return BUTTON_ACTION_BRK;
    }
    else {
      return GET_HBTN_STAT(btn->hbtn_1);
    }
  }
  else {
    if (hbtn_status & ~((1U << btn->hbtn_1) | (1U << btn->hbtn_2))) {
      return BUTTON_ACTION_BRK;
    }
    else {
      if (GET_HBTN_STAT(btn->hbtn_1)) {
        return GET_HBTN_STAT(btn->hbtn_2);
      }
      else {
        return BUTTON_ACTION_BRK;
      }
    }
  }
}


void button_fsm_update(Button_T *btn) {
  uint8_t btn_action = get_button_action(btn);
  switch (btn->state) {
    case STATE_IDLE:
      if (btn_action == BUTTON_ACTION_DOWN) {
        put_key_event(btn->id, EVENT_PRESS_DOWN);
        btn->ticks = 0;
        btn->state = STATE_PRESS_DOWN;
      }
      break;

    case STATE_PRESS_DOWN:
      if (btn_action == BUTTON_ACTION_BRK) {
				btn->state = STATE_PRESS_BRK;
      }
      else if (btn_action == BUTTON_ACTION_DOWN) {
				if (++btn->ticks >= TICKS_LONG_PRESS) {
					put_key_event(btn->id, EVENT_LONG_PRESS_START);
          btn->ticks = 0;
          btn->state = STATE_PRESS_LONG;
				}
      }
      else {
        put_key_event(btn->id, EVENT_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_LONG:
    	if (btn_action == BUTTON_ACTION_BRK) {
				btn->state = STATE_PRESS_BRK;
			}
      else if (btn_action == BUTTON_ACTION_DOWN)
      {
        if (++btn->ticks == TICKS_LONG_PRESS_HOLD) {
          put_key_event(btn->id, EVENT_LONG_PRESS_HOLD);
          btn->ticks = 0;
        }
      }
      else {
        put_key_event(btn->id, EVENT_LONG_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_BRK:
      if (btn_action == BUTTON_ACTION_UP) {
        btn->state = STATE_IDLE;
      }
      break;
  }
}

void button_scan(void) {
  hbtn_status_update();
  for (int i = 0; i < BUTTON_COUNT; i++) {
    button_fsm_update(&button_list[i]);
  }
}

int put_key_event(uint8_t btn_id, uint8_t btn_event) {
  if (IS_FIFO_FULL()) return -1;
  uint8_t wr = event_fifo.w & EVENT_FIFO_MASK;
  event_fifo.buf[wr].button_id    = btn_id;
  event_fifo.buf[wr].button_event = btn_event;
  event_fifo.w++;
  return 0;
}

int get_key_event(ButtonEvent_T *buf) {
  if (IS_FIFO_EMPTY()) return -1;
  memcpy(buf, &event_fifo.buf[event_fifo.r & EVENT_FIFO_MASK], sizeof(ButtonEvent_T));
  event_fifo.r++;
  return 0;
}
