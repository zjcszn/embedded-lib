#ifndef __SIMPLE_KEY_H__
#define __SIMPLE_KEY_H__

#include <stdint.h>

/****************** 硬按键 ******************/
// 硬按键ID枚举
enum ENUM_HardKeyID {
  HKEY_KEY0,
  HKEY_KEY1,
  HKEY_KEY2,
  HKEY_WKUP,
  HKEY_COUNT,
  HKEY_NULL,
};

// 硬按键结构体
typedef struct {
  uint8_t hkey_id     : 4;   // 按键ID [0~15]
  uint8_t filter_cnt  : 3;   // 消抖计数器 [0~7]
  uint8_t act_level   : 1;   // 按键按下时的电平 [0~1]
}HKEY_T;

/****************** 软按键 ******************/
// 软按键类型枚举
enum ENUM_SoftKeyType {
  SKEY_TYPE_SINGLE = 0,
  SKEY_TYPE_COMBO,
};

// 软按键状态
enum ENUM_SoftKeyState {
  SKEY_STATE_IDLE = 0,
  SKEY_STATE_PRESS_DOWN,
  SKEY_STATE_CLICK,
  SKEY_STATE_LONG_PRESS,
};

// 
enum ENUM_SoftKeyPressStatus {
  SKEY_PRESS_UP = 0,
  SKEY_PRESS_DN = 1,
  SKEY_NONE_KEY = 2,
};

// 软按键ID枚举
enum ENUM_SoftKeyID {
  SKEY_KEY0,
  SKEY_KEY1,
  SKEY_KEY2,
  SKEY_WKUP,
  SKEY_COMBO1,
  SKEY_COMBO2,
  SKEY_COUNT,
};
// 软按键结构体
typedef struct {
  uint8_t skey_id   : 5;   // 按键ID [0~31]
  uint8_t type      : 1;   // 按键类型 [0~1]
  uint8_t state     : 2;   // 按键状态 [0~3]
  uint8_t hkey_1    : 4;   // 硬按键1
  uint8_t hkey_2    : 4;   // 硬按键2
  uint8_t ticks;

}SKEY_T;

/******************* 事件 *******************/
enum ENUM_KeyEvent {
  PRESS_NULL = 0,
  PRESS_DN,
  PRESS_UP,
  SINGLE_CLICK,
  DOUBLE_CLICK,
  LONG_PRESS_START,
  LONG_PRESS_HOLD,
};



#endif