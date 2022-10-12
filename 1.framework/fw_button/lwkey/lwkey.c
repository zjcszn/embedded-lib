#include "lwkey.h"

#include <string.h>

#define TICKS_INTERVAL          ( 10U)  // ticks周期：10ms
#define TICKS_FILTER            (  2U)  // 按键消抖ticks，20ms
#define TICKS_PRESS_REPEAT      ( 20U)  // 按键连击ticks，200ms
#define TICKS_LONG_PRESS        (100U)  // 按键长按ticks，1000ms
#define TICKS_LONG_PRESS_HOLD   (  5U)  // 长按事件推送间隔，50ms

#define  LOW_LEVEL              (  0U)
#define HIGH_LEVEL              (  1U)

// 按键FSM状态
#define STATE_IDLE              (  0U)  // 按键空闲状态
#define STATE_PRESS_DOWN        (  1U)  // 按键按下状态

/****************************** FIFO设置 ******************************/

#define KEY_FIFO_SIZE     (16U)
#define KEY_FIFO_MASK     (15U)

typedef struct {
  KEY_EVENT_T buf[KEY_FIFO_SIZE];       // FIFO buffer
  uint8_t     r;                        // 读指针
  uint8_t     w;                        // 写指针
} KEY_FIFO_T;

static KEY_FIFO_T key_fifo = {0};

#define IS_FIFO_EMPTY()       (key_fifo.r == key_fifo.w)
#define IS_FIFO_FULL()        (KEY_FIFO_SIZE == (key_fifo.w - key_fifo.r))

/****************************** HardKey配置 ******************************/

static HKEY_T hkey_list[HKEY_COUNT] = {
  [HKEY_KEY0] = {HKEY_KEY0, 0,  LOW_LEVEL},
  [HKEY_KEY1] = {HKEY_KEY1, 0,  LOW_LEVEL},
  [HKEY_KEY2] = {HKEY_KEY2, 0,  LOW_LEVEL},
  [HKEY_WKUP] = {HKEY_WKUP, 0, HIGH_LEVEL},
};

static uint32_t hkey_status = 0;
// 获取gpio
static uint8_t (*read_hkey_gpio)(uint8_t hkey_id) = NULL;

#define HKEY_MASK(i)       (1U << i)
#define GET_HKEY_STAT(i)   ((hkey_status >> i) & 1U)
#define IS_HKEY_PRESSED(i) (read_hkey_gpio(i) == hkey_list[i].act_level)

/****************************** SoftKey配置 ******************************/

static SKEY_T skey_list[SKEY_COUNT] = {
  [SKEY_KEY0]   = {SKEY_KEY0,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY0, 0},
  [SKEY_KEY1]   = {SKEY_KEY1,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY1, 0},
  [SKEY_KEY2]   = {SKEY_KEY2,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY2, 0},
  [SKEY_WKUP]   = {SKEY_WKUP,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_WKUP, 0},
  [SKEY_COMBO1] = {SKEY_COMBO1, SKEY_TYPE_COMBO,  SKEY_STATE_IDLE, HKEY_WKUP, HKEY_KEY0},
  [SKEY_COMBO2] = {SKEY_COMBO2, SKEY_TYPE_COMBO,  SKEY_STATE_IDLE, HKEY_WKUP, HKEY_KEY2},
};

static uint32_t skey_status = 0;

#define SKEY_MASK(id) (1U << id)


/**
 * @brief 扫描按键状态，经消抖处理后更新至key_status
 * 
 * @param key_id 
 */
void update_hkey_status(void) {
  for (int i = 0; i < HKEY_COUNT; i++) {
    if (IS_HKEY_PRESSED(i) != GET_HKEY_STAT(i)) {
      if (++hkey_list[i].filter_cnt >= TICKS_FILTER) {
        hkey_status = hkey_status ^ (1U << i);
        hkey_list[i].filter_cnt = 0;
      }      
    }
    else {
      hkey_list[i].filter_cnt = 0;
    }
  }
}

/**
 * @brief 获取软按键状态
 * 
 * @param id 
 * @return uint8_t 0表示按键释放，1表示按键按下，2表示按键被打断
 */
uint8_t get_skey_status(uint8_t id) {
  if (skey_list[id].type == SKEY_TYPE_SINGLE) {
    if (hkey_status & ~(1U << skey_list[id].hkey_1)) {
      return SKEY_NONE_KEY;
    }
    else {
      return GET_HKEY_STAT(skey_list[id].hkey_1);
    }
  }
  else {
    if (hkey_status & ~(1U << skey_list[id].hkey_1 | 1U << skey_list[id].hkey_2)) {
      return SKEY_NONE_KEY;
    }
    else {
      if (GET_HKEY_STAT(skey_list[id].hkey_1)) {
        return GET_HKEY_STAT(skey_list[id].hkey_2);
      }
      else {
        return SKEY_NONE_KEY;
      }
    }
  }
}

/**
 * @brief 
 * 
 * @param skey_id 
 */
void skey_process(uint8_t skey_id) {
  uint8_t skey_stat = get_skey_status(skey_id);
  switch (skey_list[skey_id].state) {
    case SKEY_STATE_IDLE:
      if (skey_stat == SKEY_PRESS_DN) {
        put_key_event(skey_id, EVENT_PRESS_DOWN);
        skey_list[skey_id].state = SKEY_STATE_PRESS;
      }
      break;

    case SKEY_STATE_PRESS:
      if (skey_stat == SKEY_PRESS_DN) {
        put_key_event(skey_id, EVENT_LONG_PRESS);
      }
      else {
        if (skey_stat == SKEY_PRESS_UP) {
          put_key_event(skey_id, EVENT_PRESS_UP);
        }
        skey_list[skey_id].state = SKEY_STATE_IDLE;
      }
  }
}

int put_key_event(uint8_t key_id, uint8_t key_event) {
  if (IS_FIFO_FULL) return -1;
  uint8_t wr = key_fifo.w & KEY_FIFO_MASK;
  key_fifo.buf[wr].key_id    = key_id;
  key_fifo.buf[wr].key_event = key_event;
  key_fifo.w++;
  return 0;
}

int get_key_event(KEY_EVENT_T *buf) {
  if (IS_FIFO_EMPTY) return -1;
  memcpy(buf, &key_fifo.buf[key_fifo.r & KEY_FIFO_MASK], sizeof(KEY_EVENT_T));
  key_fifo.r++;
  return 0;
}
