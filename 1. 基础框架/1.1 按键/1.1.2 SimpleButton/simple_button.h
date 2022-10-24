#ifndef __LWKEY_H__
#define __LWKEY_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/****************** Hard Key ******************/
// HardKey ID枚举
enum ENUM_HardKeyID {
  HKEY_KEY0 = 0,
  HKEY_KEY1,
  HKEY_KEY2,
  HKEY_WKUP,
  HKEY_COUNT,
};

// HardKey结构体
typedef struct {
  uint8_t hkey_id     : 4;   // 按键ID [0~15]
  uint8_t filter_cnt  : 3;   // 消抖计数器 [0~7]
  uint8_t act_level   : 1;   // 按键按下时的电平 [0~1]
}HKEY_T;

/****************** Soft Key ******************/
// SoftKey ID枚举
enum ENUM_SoftKeyID {
  SKEY_KEY0 = 0,
  SKEY_KEY1,
  SKEY_KEY2,
  SKEY_WKUP,
  SKEY_COMBO1,
  SKEY_COMBO2,
  SKEY_COUNT,
};

// SoftKey结构体
typedef struct {
  uint8_t skey_id   : 5;   // 按键ID [0~31]
  uint8_t type      : 1;   // 按键类型 [0~1]
  uint8_t state     : 2;   // 按键状态 [0~3]
  uint8_t hkey_1    : 4;   // 硬按键1
  uint8_t hkey_2    : 4;   // 硬按键2
  uint8_t ticks;
}SKEY_T;

// SoftKey类型枚举
enum ENUM_SoftKeyType {
  SKEY_TYPE_SINGLE = 0,
  SKEY_TYPE_COMBO,
};

// SoftKey触发事件枚举
enum ENUM_SoftKeyStatus {
  SKEY_PRESS_UP = 0,
  SKEY_PRESS_DN = 1,
  SKEY_NONE_KEY = 2,
};

/******************* 事件 *******************/
// 事件枚举
enum ENUM_KeyEvent {
  NONE_EVENT = 0,
  EVENT_PRESS_DOWN,
  EVENT_PRESS_UP,
  EVENT_LONG_PRESS,
};

// 事件结构体
typedef struct {
  uint8_t key_id    : 5;
  uint8_t key_event : 3;
}KEY_EVENT_T;


void key_scan(void);
int get_key_event(KEY_EVENT_T *buf);


#ifdef __cplusplus
}
#endif

#endif