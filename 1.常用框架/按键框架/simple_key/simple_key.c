#include "simple_key.h"

#define TICKS_INTERVAL    (10U)  // ticks周期：10ms
#define TICKS_FILTER      ( 2U)  // 按键消抖采样次数

#define ACT_LEVEL_L       ( 0U)  // 低电平动作
#define ACT_LEVEL_H       ( 1U)  // 高电平动作

/*************** 按键状态相关变量及辅助宏 ********************/

// 按键状态全局标志
static union {
  struct {
    uint8_t stat;     // 按键状态标志位，0表示按键释放，1表示按键按下
    uint8_t event;    // 按键单击事件标志位，0表示未触发单击事件，1表示触发单击事件
  } cond;
  uint16_t raw;
} key_stat = {0};


#define CHECK_KEY_PRESS(i)    (key_stat.cond.stat  & (1U << i))
#define CHECK_KEY_CLICK(i)    (key_stat.cond.event & (1U << i))

// 按键按下
#define KEY_PRESS(i) \
        do {  \
        key_stat.cond.stat |=  1U << i;  \
        } while (0)

// 按键释放  
#define KEY_RELEASE(i) \
        do {  \
        key_stat.cond.stat &= ~1U << i;  \
        } while (0)

// 单击事件
#define KEY_CLICK(i) \
        do {  \
        key_stat.cond.event |=  1U << i;  \
        } while (0)

// 清除事件
#define KEY_CLR_EVENT() \
        do {  \
        key_stat.cond.event = 0x00;  \
        } while (0)

// 获取按键输入信号的函数
static uint8_t(*read_key_gpio)(uint8_t key_id) = NULL;
// 读取旧的按键状态
#define KEY_OLD_STAT(i)   (!!CHECK_KEY_PRESS(i))
// 读取按键输入，0表示按键释放，1表示按键按下
#define READ_KEY(i)   (read_key_gpio(i) == key_list[i].act_level)


// 按键列表
static Key key_list[KEY_COUNT] = {
  [KEY_MOD] = {0, ACT_LEVEL_L},
  [KEY_NUM] = {0, ACT_LEVEL_L},
  [KEY_STB] = {0, ACT_LEVEL_L},
  [KEY_PRS] = {0, ACT_LEVEL_L},
};

/*********************** 函数定义 ***********************/

// 注册按键IO信号读取函数
void read_key_gpio_register(uint8_t(*callback)(uint8_t key_id)) {
  read_key_gpio = callback;
}

// 按键扫描函数
void key_scan(void) {
  uint8_t key_new_stat;

  for (int i = 0; i < KEY_COUNT; i++) {
    key_new_stat = READ_KEY(i);               // 获取按键状态
    if (key_new_stat != KEY_OLD_STAT(i)) {    // 比较新旧状态，如有改变则进入消抖程序
      if (++key_list[i].filter_cnt > TICKS_FILTER) {
        if (key_new_stat){
          KEY_PRESS(i);
        }
        else {
          KEY_RELEASE(i);
          KEY_CLICK(i);
        }
        key_list[i].filter_cnt = 0;
      }
    }
    else {
      key_list[i].filter_cnt = 0;
    }
  }
}

// 按键读取函数
uint16_t read_key(void) {
  uint16_t ret;
  ret = key_stat.raw;
  KEY_CLR_EVENT();
  return ret;
}