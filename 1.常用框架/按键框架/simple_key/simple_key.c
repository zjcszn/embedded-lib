#include "simple_key.h"



#define TICKS_INTERVAL          ( 10U)  // ticks周期：10ms
#define TICKS_FILTER            (  2U)  // 按键消抖ticks，20ms
#define TICKS_PRESS_REPEAT      ( 20U)  // 按键连击ticks，200ms
#define TICKS_LONG_PRESS        (100U)  // 按键长按ticks，1000ms
#define TICKS_LONG_PRESS_HOLD   (  5U)  // 长按事件推送间隔，50ms

#define KEY_FIFO_SIZE     (8U)
#define KEY_FIFO_MASK     (7U)

#define HIGH_LEVEL        (1U)
#define  LOW_LEVEL        (0U)

typedef struct {
  uint8_t buf[KEY_FIFO_SIZE];
  uint8_t read;
  uint8_t write;
} KEY_FIFO_T;

/****************************** 硬按键配置 ******************************/

static HKEY_T hkey_list[HKEY_COUNT] = {
  [HKEY_KEY0] = {HKEY_KEY0, 0,  LOW_LEVEL},
  [HKEY_KEY1] = {HKEY_KEY1, 0,  LOW_LEVEL},
  [HKEY_KEY2] = {HKEY_KEY2, 0,  LOW_LEVEL},
  [HKEY_WKUP] = {HKEY_WKUP, 0, HIGH_LEVEL},
};

static uint32_t hkey_status = 0;
static uint8_t (*read_hkey_gpio)(uint8_t hkey_id) = NULL;

#define HKEY_MASK(i)       (1U << i)
#define GET_HKEY_STAT(i)   ((hkey_status >> i) & 1U)
#define IS_HKEY_PRESSED(i) (read_hkey_gpio(i) == hkey_list[i].act_level)

/****************************** 软按键配置 ******************************/

static SKEY_T skey_list[SKEY_COUNT] = {
  [SKEY_KEY0]   = {SKEY_KEY0,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY0, HKEY_NULL},
  [SKEY_KEY1]   = {SKEY_KEY1,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY1, HKEY_NULL},
  [SKEY_KEY2]   = {SKEY_KEY2,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_KEY2, HKEY_NULL},
  [SKEY_WKUP]   = {SKEY_WKUP,   SKEY_TYPE_SINGLE, SKEY_STATE_IDLE, HKEY_WKUP, HKEY_NULL},
  [SKEY_COMBO1] = {SKEY_COMBO1, SKEY_TYPE_COMBO,  SKEY_STATE_IDLE, HKEY_WKUP, HKEY_KEY0},
  [SKEY_COMBO2] = {SKEY_COMBO2, SKEY_TYPE_COMBO,  SKEY_STATE_IDLE, HKEY_WKUP, HKEY_KEY2},
};

static uint32_t skey_status = 0;

#define SKEY_MASK(id) (1U <<)


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
  if (id < HKEY_COUNT) {
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

void skey_process(uint8_t skey_id) {

  switch (skey_list[skey_id].state) {
    case SKEY_STATE_IDLE:
      if (get_skey_status(skey_id) == SKEY_PRESS_DN) {
        // push event : press dn
        skey_list[skey_id].state = SKEY_STATE_PRESS_DOWN;
      }
      break;

    case SKEY_STATE_PRESS_DOWN:
      if (get_skey_status(skey_id) == SKEY_NONE_KEY) {
        skey_list[skey_id].state = SKEY_STATE_IDLE;
      }
      else {
        if (skey_list[skey_id].ticks < TICKS_LONG_PRESS);
      }
  }

}
