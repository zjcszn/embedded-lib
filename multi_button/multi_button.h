/**
 * @File:    multi_button.h
 * @Author:  zjcszn
 * @Date:    2022-09-30
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-30  zjcszn       First add
 * 
 * 
 * 参考：https://github.com/0x1abin/MultiButton
 * 
*/

#ifndef __MULTI_BUTTON_H__
#define __MULTI_BUTTON_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

#define USE_BUTTON_EVENT_FIFO   // 使用FIFO推送按键事件

#define LONGPRESS_ENABLE    (1U)  // 允许触发长按事件
#define LONGPRESS_DISABLE   (0U)  // 禁止触发长按事件

#define REPEAT_MAX    (1U)  // 最大重复点击次数 0:单击 1:双击 2：三击...

#define ACT_LEVEL_L   (0U)  // 按钮动作电平：低电平
#define ACT_LEVEL_H   (1U)  // 按钮动作电平：高电平

// NULL宏定义
#ifndef NULL
    #ifdef __cplusplus
        #define NULL 0
    #else
        #define NULL ((void *)0)
    #endif
#endif

// multi_button 按键ID枚举列表
enum ENUM_ButtonID {
  BUTTON_KEY1 = 0,
  BUTTON_KEY2,
  BUTTON_KEY3,
  BUTTON_KEY4,
/* 添加自定义按钮 */
  
  NUM_OF_BUTTON,
};

// multi_button 按键事件枚举列表
enum ENUM_ButtonEvent {
  EVENT_NULL = 0,           // 空事件
  EVENT_PRESS_DN,           // 按键按下事件
  EVENT_PRESS_UP,           // 按键抬起事件
  EVENT_REPEAT_CLICK,       // 重复点击事件
  EVENT_SINGLE_CLICK,       // 单击事件
  EVENT_DOUBLE_CLICK,       // 双击事件
  EVENT_LONG_PRESS_START,   // 长按开始事件
  EVENT_LONG_PRESS_HOLD,    // 长按保持事件
  EVENT_LONG_PRESS_UP,      // 长按抬起事件
  NUM_OF_EVENT,
};

// multi_button 事件结构体
typedef struct _button_event{
  uint8_t button_id;        // 按键ID
  uint8_t button_event;     // 按键事件
} ButtonEvent;

typedef void (*ButtonCallback)(const void*);

// multi_button 按键结构体
typedef struct _button {
  uint8_t   id;             // 按键ID
  uint8_t   ticks_cnt;      // 嘀嗒计数器 [0~255]
  uint8_t   filter_cnt : 3; // 消抖计数器 [0~7]
  uint8_t   repeat_cnt : 2; // 连击计数器 [0~3]
  uint8_t   repeat_max : 2; // 最大连击次数 [0~3]
  uint8_t   long_press : 1; // 长按功能允许位
  uint8_t   cur_level : 1;  // 按键输入电平 [0~1]
  uint8_t   act_level : 1;  // 按键动作电平 [0~1]
  uint8_t   event : 4;      // 按键事件 [0~15]
  uint8_t   state : 2;      // 按键状态 [0~3]
  ButtonCallback  callback; // 按键回调函数
  struct _button  *next;    // NEXT指针
} Button;

// multi_button 按键初始化结构体
typedef struct _button_init_list {
  /* 初始化字段 */
  uint8_t init_button_id;   // 按键ID
  uint8_t init_repeat_max;  // 最大连击次数
  uint8_t init_long_press;  // 长按功能允许位
  uint8_t init_act_level;   // 按键动作电平
  ButtonCallback init_cb;   // 按键回调函数指针
  /* 按键结构体 */
  Button  button;
} ButtonInitList;

// 按键回调函数注册
static inline void button_callback_register(Button *button, ButtonCallback cb) {
  button->callback = cb;
}
// 按键回调函数反注册
static inline void button_callback_unregister(Button *button) {
  button->callback = NULL;
}

void read_button_gpio_register(uint8_t(*callback)(uint8_t button_id));
void button_list_init(ButtonInitList *init_list, uint8_t button_num);
int  button_add(Button *button);
int  button_del(Button *button);
void button_ticks(void);

#ifdef USE_BUTTON_EVENT_FIFO
// 按键事件FIFO读取函数
int  button_event_read(ButtonEvent *event_buf);
// 按键事件打印函数
void button_event_print(void);
#endif

#ifdef __cplusplus
}
#endif

#endif
