#ifndef __SOFT_I2C_H__
#define __SOFT_I2C_H__


/*********************************************** 头文件 **********************************************/

#include <stdint.h>
#include "stm32f407xx.h"
#include "stm32f4xx_ll_gpio.h"
#include "stm32f4xx_ll_bus.h"
#include "dwt_delay.h"

/*********************************************** 宏定义 **********************************************/

#define SOFT_I2C_USE_ASSERT   1         // 开启 Assert
#define SOFT_I2C_USE_LOG      1         // 开启 Log

#define SOFT_I2C_DELAY(us)    dwt_delay_us(us)

#define SOFT_I2C_OK           0         // I2C 返回正确
#define SOFT_I2C_ERR_NACK     1         // I2C 数据无响应
#define SOFT_I2C_ERR_ADDR     2         // I2C 地址无响应

typedef struct {
  GPIO_TypeDef *port;
  uint32_t      pin;
} soft_i2c_pin_t;

typedef struct {
  soft_i2c_pin_t scl;
  soft_i2c_pin_t sda;
  uint16_t       freq;
  uint16_t       period;
}soft_i2c_dev_t;

/********************************************** 函数声明 **********************************************/

// 模拟I2C外部接口

void    soft_i2c_init(soft_i2c_dev_t *i2c_dev);
int     soft_i2c_master_write(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, const uint8_t *src, uint16_t length);
int     soft_i2c_master_read(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, uint8_t *dst, uint16_t length);

#endif