#ifndef __SIMPLE_BUTTON_H__
#define __SIMPLE_BUTTON_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/****************** Hardware Button******************/

// 硬件按键编号
enum ENUM_HButtonID {
  HBUTTON_KEY0,
  HBUTTON_KEY1,
  HBUTTON_KEY2,
  HBUTTON_WKUP,
  HBUTTON_COUNT,  // 硬件按键数量
  HBUTTON_NULL,
};

typedef struct {
  uint8_t filter_cnt;   // 消抖计数器
  uint8_t act_level;    // 动作电平
}HButton_T;

/****************** Custom Button ******************/
// 用户自定义按键编号
enum ENUM_ButtonID {
  BUTTON_KEY0,
  BUTTON_KEY1,
  BUTTON_KEY2,
  BUTTON_WKUP,
  BUTTON_COMBO1,
  BUTTON_COMBO2,
  BUTTON_COUNT,   // 自定义按键数量
};

// 用户自定义按键动作状态
enum ENUM_ButtonAction {
  BUTTON_ACTION_UP   = 0,   // 按键处于释放状态
  BUTTON_ACTION_DOWN = 1,   // 按键处于按下状态
  BUTTON_ACTION_BRK  = 2,   // 按键被打断
};

enum ENUM_ButtonType {
  BUTTON_TYPE_SINGLE,       // 单键类型
  BUTTON_TYPE_COMBO,        // 组合类型
};

typedef struct {
  uint8_t id;               // 按键ID
  uint8_t type;             // 按键类型
  uint8_t state;            // FSM状态
  uint8_t ticks;            // 计数器
  uint8_t hbtn_1;           // 组合键1
  uint8_t hbtn_2;           // 组合键2
}Button_T;



/******************* 事件 *******************/

enum ENUM_ButtonEvent {
  EVENT_NULL,               // 空事件
  EVENT_PRESS_DOWN,         // 按键按下事件
  EVENT_PRESS_UP,           // 按键抬起事件
  EVENT_LONG_PRESS_START,   // 按键长按开始事件
  EVENT_LONG_PRESS_HOLD,    // 按键长按保持事件
  EVENT_LONG_PRESS_UP,      // 按键长按抬起事件
};

typedef struct {
  uint8_t button_id;        // 按键ID
  uint8_t button_event;     // 按键事件
}ButtonEvent_T;


#ifdef __cplusplus
}
#endif

#endif