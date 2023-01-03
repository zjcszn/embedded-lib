#include "bsp_i2c_sw.h"

/********************************************* 私有宏定义 **********************************************/

#if SOFT_I2C_USE_ASSERT
#include "assert.h"
#define   SOFT_I2C_ASSERT(exp)      assert(exp)
#else     
#define   SOFT_I2C_ASSERT(exp)      ((void)0U)
#endif

#if SOFT_I2C_USE_LOG
#include "stdio.h"
#define   SOFT_I2C_LOG(...)         printf(__VA_ARGS__)
#else     
#define   SOFT_I2C_LOG(...)         ((void)0U)
#endif


/******************************************** 私有内联函数 *********************************************/

static inline void I2C_SCL_H(soft_i2c_dev_t *i2c_dev) {
  LL_GPIO_SetOutputPin(i2c_dev->scl.port, i2c_dev->scl.pin);
}

static inline void I2C_SCL_L(soft_i2c_dev_t *i2c_dev) {
  LL_GPIO_ResetOutputPin(i2c_dev->scl.port, i2c_dev->scl.pin);
}

static inline void I2C_SDA_H(soft_i2c_dev_t *i2c_dev) {
  LL_GPIO_SetOutputPin(i2c_dev->sda.port, i2c_dev->sda.pin);
}

static inline void I2C_SDA_L(soft_i2c_dev_t *i2c_dev) {
  LL_GPIO_ResetOutputPin(i2c_dev->sda.port, i2c_dev->sda.pin);
}

static inline uint32_t I2C_SDA_READ(soft_i2c_dev_t *i2c_dev) {
  return LL_GPIO_IsInputPinSet(i2c_dev->sda.port, i2c_dev->sda.pin);
}

static inline void I2C_DELAY(soft_i2c_dev_t *i2c_dev) {
  SOFT_I2C_DELAY(i2c_dev->period);
}

/********************************************** 函数声明 **********************************************/

static void    soft_i2c_gpio_clk_enable(GPIO_TypeDef *gpio_x);
static void    soft_i2c_master_start(soft_i2c_dev_t *i2c_dev);
static void    soft_i2c_master_stop(soft_i2c_dev_t *i2c_dev);
static int     soft_i2c_master_send_byte(soft_i2c_dev_t *i2c_dev, uint8_t byte);
static int     soft_i2c_master_wait_ack(soft_i2c_dev_t *i2c_dev);
static void    soft_i2c_master_send_ack(soft_i2c_dev_t *i2c_dev);
static void    soft_i2c_master_send_nack(soft_i2c_dev_t *i2c_dev);
static uint8_t soft_i2c_master_recv_byte(soft_i2c_dev_t *i2c_dev);

/********************************************** 函数定义 **********************************************/

/**
 * @brief 使能I2C GPIO时钟
 * 
 * @param gpio_x GPIO端口号
 */
static void soft_i2c_gpio_clk_enable(GPIO_TypeDef *gpio_x) {
  if (gpio_x == GPIOA) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
  else if (gpio_x == GPIOB) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
  else if (gpio_x == GPIOC) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
  else if (gpio_x == GPIOD) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOD);
  else if (gpio_x == GPIOE) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOE);
  else if (gpio_x == GPIOF) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOF);
  else if (gpio_x == GPIOG) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOG);
  else if (gpio_x == GPIOH) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOH);
  else if (gpio_x == GPIOI) LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOI);
}

/**
 * @brief 初始化 I2C实例
 * 
 */
void soft_i2c_init(soft_i2c_dev_t *i2c_dev, uint16_t i2c_freq) {
  SOFT_I2C_ASSERT(i2c_dev);
  SOFT_I2C_ASSERT(i2c_dev->scl.port && i2c_dev->sda.port);

  uint8_t period  =  500U / i2c_freq;
  i2c_dev->period = period ? period : 1;                        // 计算I2C时钟延迟周期

  soft_i2c_gpio_clk_enable(i2c_dev->scl.port);                  // 使能SCL GPIO 时钟
  soft_i2c_gpio_clk_enable(i2c_dev->sda.port);                  // 使能SDA GPIO 时钟

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;                   // GPIO模式：输出模式
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_OPENDRAIN;        // GPIO输出模式：开漏输出
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;                       // GPIO上下拉：无
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;         // GPIO速率：VERY HIGH
  GPIO_InitStruct.Pin = i2c_dev->scl.pin;                       // I2C SCL PIN
  LL_GPIO_Init(i2c_dev->scl.port, &GPIO_InitStruct);            // I2C SCL PIN初始化
  GPIO_InitStruct.Pin = i2c_dev->sda.pin;                       // I2C SDA PIN
  LL_GPIO_Init(i2c_dev->sda.port, &GPIO_InitStruct);            // I2C SDA PIN初始化

  I2C_SDA_H(i2c_dev);
  I2C_SCL_H(i2c_dev);

  SOFT_I2C_LOG("Soft I2C Freq Set: %u Khz\r\n", 500 / i2c_dev->period);
  SOFT_I2C_LOG("Soft I2C Initialize Success\r\n");

}

/**
 * @brief 模拟I2C主机发送函数（轮询方式）
 * 
 * @param slave_addr 从机地址
 * @param src 待发送的源数据地址
 * @param length 待发送的数据长度
 * @return int 
 */
int soft_i2c_master_write(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, const uint8_t *src, uint16_t length) {
  soft_i2c_master_start(i2c_dev);
  if (soft_i2c_master_send_byte(i2c_dev, slave_addr << 1)) {
    SOFT_I2C_LOG("Soft I2C ERROR -> WR Addr NACK: 0x%02X\r\n", slave_addr);
    return SOFT_I2C_ERR_ADDR;
  }
  for (int i = 0; i < length; i++) {
    if (soft_i2c_master_send_byte(i2c_dev, *src++)) {
      SOFT_I2C_LOG("Soft I2C ERROR -> Data NACK\r\n");
      return SOFT_I2C_ERR_NACK;
    }
  }
  soft_i2c_master_stop(i2c_dev);
  return SOFT_I2C_OK;
}

/**
 * @brief 模拟I2C主机发送函数（轮询方式）
 * 
 * @param slave_addr 从机地址
 * @param src 待发送的源数据地址
 * @param length 待发送的数据长度
 * @return int 
 */
int soft_i2c_master_mem_write(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, uint8_t *mem_addr, 
                                uint16_t mem_addr_len, const uint8_t *src, uint16_t data_len) {

  soft_i2c_master_start(i2c_dev);
  if (soft_i2c_master_send_byte(i2c_dev, slave_addr << 1)) {
    SOFT_I2C_LOG("Soft I2C ERROR -> WR Addr NACK: 0x%02X\r\n", slave_addr);
    return SOFT_I2C_ERR_ADDR;
  }
  for (int i = 0; i < mem_addr_len; i++) {
    if (soft_i2c_master_send_byte(i2c_dev, *mem_addr++)) {
      SOFT_I2C_LOG("Soft I2C ERROR -> Data NACK\r\n");
      return SOFT_I2C_ERR_NACK;
    }
  }
  for (int i = 0; i < data_len; i++) {
    if (soft_i2c_master_send_byte(i2c_dev, *src++)) {
      SOFT_I2C_LOG("Soft I2C ERROR -> Data NACK\r\n");
      return SOFT_I2C_ERR_NACK;
    }
  }
  soft_i2c_master_stop(i2c_dev);
  return SOFT_I2C_OK;
}


/**
 * @brief 模拟I2C主机读取函数（轮询方式）
 * 
 * @param slave_addr 从机地址
 * @param dst 目标缓冲区地址
 * @param length 待读取的数据长度
 * @return int 
 */
int soft_i2c_master_read(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, uint8_t *dst, uint16_t length) {
  soft_i2c_master_start(i2c_dev);
  if (soft_i2c_master_send_byte(i2c_dev, (slave_addr << 1) | 0x01)) {
    SOFT_I2C_LOG("Soft I2C ERROR -> RD Addr NACK: 0x%02X\r\n", slave_addr);
    return SOFT_I2C_ERR_ADDR;
  }
  for (int i = 0; i < length - 1; i++) {
    *dst++ = soft_i2c_master_recv_byte(i2c_dev);
    soft_i2c_master_send_ack(i2c_dev);
  }
  *dst = soft_i2c_master_recv_byte(i2c_dev);
  soft_i2c_master_send_nack(i2c_dev);
  soft_i2c_master_stop(i2c_dev);
  return SOFT_I2C_OK;
}

/**
 * @brief 模拟I2C主机读取函数（轮询方式）
 * 
 * @param slave_addr 从机地址
 * @param dst 目标缓冲区地址
 * @param length 待读取的数据长度
 * @return int 
 */
int soft_i2c_master_mem_read(soft_i2c_dev_t *i2c_dev, uint8_t slave_addr, uint8_t *mem_addr, 
                              uint16_t mem_addr_len, uint8_t *dst, uint16_t data_len) {

  soft_i2c_master_start(i2c_dev);
  if (soft_i2c_master_send_byte(i2c_dev, slave_addr << 1)) {
    SOFT_I2C_LOG("Soft I2C ERROR -> WR Addr NACK: 0x%02X\r\n", slave_addr);
    return SOFT_I2C_ERR_ADDR;
  }
  for (int i = 0; i < mem_addr_len; i++) {
    if (soft_i2c_master_send_byte(i2c_dev, *mem_addr++)) {
      SOFT_I2C_LOG("Soft I2C ERROR -> Data NACK\r\n");
      return SOFT_I2C_ERR_NACK;
    }
  }
  soft_i2c_master_start(i2c_dev);
  if (soft_i2c_master_send_byte(i2c_dev, (slave_addr << 1) | 0x01)) {
    SOFT_I2C_LOG("Soft I2C ERROR -> RD Addr NACK: 0x%02X\r\n", slave_addr);
    return SOFT_I2C_ERR_ADDR;
  }
  for (int i = 0; i < data_len - 1; i++) {
    *dst++ = soft_i2c_master_recv_byte(i2c_dev);
    soft_i2c_master_send_ack(i2c_dev);
  }
  *dst = soft_i2c_master_recv_byte(i2c_dev);
  soft_i2c_master_send_nack(i2c_dev);
  soft_i2c_master_stop(i2c_dev);
  return SOFT_I2C_OK;
}

/**
 * @brief 发送起始信号
 * @param i2c_dev I2C实例
 */
static void soft_i2c_master_start(soft_i2c_dev_t *i2c_dev) {
  I2C_SCL_L(i2c_dev);
  I2C_SDA_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SDA_L(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_L(i2c_dev);
}

/**
 * @brief 发送停止信号
 * @param i2c_dev I2C实例
 */
static void soft_i2c_master_stop(soft_i2c_dev_t *i2c_dev) {
  I2C_SCL_L(i2c_dev);
  I2C_SDA_L(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SDA_H(i2c_dev);
}

/**
 * @brief 主机发送字节数据
 * @param i2c_dev I2C实例
 * @param byte 
 * @return int 
 */
static int soft_i2c_master_send_byte(soft_i2c_dev_t *i2c_dev, uint8_t byte) {
  for (int i = 0; i < 8; i++) {
    I2C_SCL_L(i2c_dev);
    byte & 0x80 ? I2C_SDA_H(i2c_dev) : I2C_SDA_L(i2c_dev);
    I2C_DELAY(i2c_dev);
    I2C_SCL_H(i2c_dev);
    I2C_DELAY(i2c_dev);
    byte <<= 1U;
  }
  if (soft_i2c_master_wait_ack(i2c_dev)) {
    soft_i2c_master_stop(i2c_dev);
    return SOFT_I2C_ERR_NACK;
  }
  return SOFT_I2C_OK;
}

/**
 * @brief 主机等待ACK信号
 * @param i2c_dev I2C实例
 * @return int 
 */
static int soft_i2c_master_wait_ack(soft_i2c_dev_t *i2c_dev) {
  int ack;
  I2C_SCL_L(i2c_dev);
  I2C_SDA_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  return I2C_SDA_READ(i2c_dev);
  //I2C_SCL_L(i2c_dev);
  //return ack;
}

/**
 * @brief 主机发送ACK信号
 * @param i2c_dev I2C实例
 */
static void soft_i2c_master_send_ack(soft_i2c_dev_t *i2c_dev) {
  I2C_SCL_L(i2c_dev);
  I2C_SDA_L(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_L(i2c_dev);
  I2C_SDA_H(i2c_dev);
}

/**
 * @brief 主机发送NACK信号
 * @param i2c_dev I2C实例
 */
static void soft_i2c_master_send_nack(soft_i2c_dev_t *i2c_dev) {
  I2C_SCL_L(i2c_dev);
  I2C_SDA_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_H(i2c_dev);
  I2C_DELAY(i2c_dev);
  I2C_SCL_L(i2c_dev);
  I2C_SDA_H(i2c_dev);
}

/**
 * @brief 主机接收字节数据
 * @param i2c_dev I2C实例
 * @return uint8_t 
 */
static uint8_t soft_i2c_master_recv_byte(soft_i2c_dev_t *i2c_dev) {
  uint8_t recv_tmp;
  for (int i = 0; i < 8; i++) {
    I2C_SCL_L(i2c_dev);
    I2C_DELAY(i2c_dev);
    I2C_SCL_H(i2c_dev);
    I2C_DELAY(i2c_dev);
    recv_tmp = (recv_tmp << 1) | I2C_SDA_READ(i2c_dev);
  }
  return recv_tmp;
}

