#include "custom_button.h"

/******************************** 宏定义 ********************************/

#define TICKS_INTERVAL          ( 10U)        // 嘀嗒周期：10ms
#define TICKS_FILTER            (  2U)        // 消抖采样次数
#define TICKS_PRESS_REPEAT      ( 20U)        // 嘀嗒计数器阈值： 200ms(重复按下)
#define TICKS_LONG_PRESS        (100U)        // 嘀嗒计数器阈值：1000ms(长按触发)
#define TICKS_LONG_PRESS_HOLD   (  5U)        // 嘀嗒计数器阈值：  50ms(长按事件推送间隔)

#define ACT_LEVEL_L             (  0U)        // 按键动作电平：低电平
#define ACT_LEVEL_H             (  1U)        // 按键动作电平：高电平

/******************************* FIFO设置 *******************************/

#define EVENT_FIFO_SIZE         (16U)
#define EVENT_FIFO_MASK         (EVENT_FIFO_SIZE - 1)

// 事件fifo
static struct {
  ButtonEvent_T     buf[EVENT_FIFO_SIZE];     // fifo缓冲区
  volatile uint8_t  r;                        // 读指针
  volatile uint8_t  w;                        // 写指针
} event_fifo = {0};

static inline uint8_t event_fifo_used(void) {
  return (event_fifo.w - event_fifo.r);
}

static inline int is_fifo_empty(void) {
  return (event_fifo.w == event_fifo.r);
}

static inline int is_fifo_full(void) {
  return (event_fifo_used() == EVENT_FIFO_SIZE);
}

/****************************** 硬件按键配置 ******************************/

// 硬件按键列表
static HButton_T hbtn_list[HBUTTON_COUNT] = {
  // [硬件按键编号] = {消抖计数器初值， 动作电平}
  [HBUTTON_KEY0] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY1] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY2] = {0, ACT_LEVEL_L},
  [HBUTTON_WKUP] = {0, ACT_LEVEL_H},
};

typedef uint32_t hbtn_status_t;   // 硬件按键数量必须小于hbtn_status_t位数
static volatile  hbtn_status_t hbtn_status = 0;

#define HBTN_MASK(i)      (1U << (i))
#define GET_HBTN_STAT(i)  ((hbtn_status >> (i)) & 1U)
#define HBTN_STATUS_MASK  ((~((hbtn_status_t)0U)) >> ((sizeof(hbtn_status_t) << 3) - HBUTTON_COUNT))

static uint8_t   (*read_hbtn_gpio)(uint8_t hbtn_id) = NULL;
static inline int check_hbtn_status(uint8_t hbtn_id) {
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
static int  get_button_action(Button_T *btn);
static void button_fsm_update(Button_T *btn);
static int  put_button_event(uint8_t btn_id, uint8_t btn_event);

/******************************** 函数定义 ********************************/

/**
 * @brief 注册硬件按键GPIO读取函数
 * 
 * @param cb 回调函数
 */
void read_hbtn_gpio_regesiter (uint8_t(*cb)(uint8_t hbtn_id)) {
  read_hbtn_gpio = cb;
}

/**
 * @brief 按键扫描函数，定时器或主循环中执行
 * 
 */
void button_scan(void) {
  hbtn_status_update();
  for (int i = 0; i < BUTTON_COUNT; i++) {
    button_fsm_update(&button_list[i]);
  }
}

/**
 * @brief 硬件按键状态扫描函数，经消抖处理后更新至hbt_status
 * 
 * @param 
 */
static void hbtn_status_update(void) {
  for (int i = 0; i < HBUTTON_COUNT; i++) {
    if (check_hbtn_status(i)) {
      if (++(hbtn_list[i].filter_cnt) >= TICKS_FILTER) {
        // 按键状态翻转
        hbtn_status ^= HBTN_MASK(i);
        hbtn_list[i].filter_cnt = 0;
      }      
    }
    else {
      hbtn_list[i].filter_cnt = 0;
    }
  }
  // 非有效按键位置0
  hbtn_status &= HBTN_STATUS_MASK;
}

/**
 * @brief 获取自定义按键的动作状态
 * 
 * @param  
 * @return int 0表示按键释放，1表示按键按下，2表示按键被打断
 */
static int get_button_action(Button_T *btn) {
  // 单键：只有指定的按键可以动作，其他按键的动作会打断当前按键
  if (btn->type == BUTTON_TYPE_SINGLE) {
    if (hbtn_status & ~(HBTN_MASK(btn->hbtn_1))) {
      return BUTTON_ACTION_BRK;
    }
    else {
      return GET_HBTN_STAT(btn->hbtn_1);
    }
  }
  // 组合键：严格的先后顺序，必须先按下一个按键，才能触发组合按键
  else {
    if (hbtn_status & ~(HBTN_MASK(btn->hbtn_1) | HBTN_MASK(btn->hbtn_2))) {
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

/**
 * @brief 自定义按键 状态机处理程序，更新按键状态并推送按键事件
 * 
 * @param btn 按键结构体
 */
void button_fsm_update(Button_T *btn) {
  int btn_action = get_button_action(btn);
  switch (btn->state) {
    case STATE_IDLE:
      if (btn_action == BUTTON_ACTION_DOWN) {
        put_button_event(btn->id, EVENT_PRESS_DOWN);
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
					put_button_event(btn->id, EVENT_LONG_PRESS_START);
          btn->ticks = 0;
          btn->state = STATE_PRESS_LONG;
				}
      }
      else {
        put_button_event(btn->id, EVENT_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_LONG:
    	if (btn_action == BUTTON_ACTION_BRK) {
				btn->state = STATE_PRESS_BRK;
			}
      else if (btn_action == BUTTON_ACTION_DOWN)
      {
        if (++btn->ticks >= TICKS_LONG_PRESS_HOLD) {
          put_button_event(btn->id, EVENT_LONG_PRESS_HOLD);
          btn->ticks = 0;
        }
      }
      else {
        put_button_event(btn->id, EVENT_LONG_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_BRK:
      if (btn_action == BUTTON_ACTION_UP) {
        btn->state = STATE_IDLE;
      }
      break;
    
    default:
      btn->state = STATE_IDLE;
      break;
  }
}

int put_button_event(uint8_t btn_id, uint8_t btn_event) {
  if (is_fifo_full()) return 0;
  ButtonEvent_T *target = &event_fifo.buf[event_fifo.w & EVENT_FIFO_MASK];
  target->button_id    = btn_id;
  target->button_event = btn_event;
  event_fifo.w++;
  return 1;
}

int get_button_event(ButtonEvent_T *buf) {
  if (is_fifo_empty()) return 0;
  ButtonEvent_T *target = &event_fifo.buf[event_fifo.r & EVENT_FIFO_MASK];
  buf->button_id    = target->button_id;
  buf->button_event = target->button_event;
  event_fifo.r++;
  return 1;
}
