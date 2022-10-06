#ifndef __SIMPLE_KEY_H__
#define __SIMPLE_KEY_H__

#include <stdint.h>



// 按键ID枚举
enum ENUM_KeyID {
  KEY_MOD = 0,
  KEY_NUM,
  KEY_STB,
  KEY_PRS,
 
  KEY_COUNT,
};

// 按键结构体
typedef struct _key {
  uint8_t filter_cnt;   // 消抖计数器
  uint8_t act_level;    // 按键按下时的电平
}Key;


void read_key_gpio_register(uint8_t(*callback)(uint8_t key_id));
void key_scan(void);
uint16_t read_key(void);


#endif