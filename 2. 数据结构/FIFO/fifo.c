/**
 * @File:    fifo.c
 * @Author:  zjcszn
 * @Date:    2022-09-25
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-25  zjcszn       First add
 * 
*/

#include "fifo.h"
#include <stdlib.h>
#include <string.h>
#include <errno.h>

/****************************************** 宏定义 ******************************************/

#define ROUND_UP 1    // 向上调整为2的N次幂
#define ROUND_DN 0    // 向下调整为2的N次幂

#ifdef min
#undef min
#endif

#if (USE_FIFO_ASSERT == 1)
  #define assert_fifo(expr) ((expr) ? (void)0 : assert_fifo_failed((uint8_t *)__FILE__, __LINE__))
  #define assert_fifo_failed(file, line) \
          do {  \
            printf("assert failed: file %s on line %d\r\n", file, line); \
          } while(0)
#else
  #define assert_fifo(expr) ((void)0UL)
#endif

/*************************************** 私有函数声明 ****************************************/

static inline int check_fifo_size(fifo_t size);
static fifo_t round_fifo_size(fifo_t size, int mode);
static inline fifo_t min(fifo_t x, fifo_t y);

/***************************************** 函数定义 *****************************************/

/**
 * @brief 检查fifo缓冲区大小是否是2的N次幂
 * 
 * @param size 缓冲区大小
 * @return 返回1：不是2的N次幂 ; 返回0：是2的N次幂 
 */
static inline int check_fifo_size(fifo_t size) {
  return (size & (size - 1));
}

/**
 * @brief 调整fifo缓冲区大小，使其满足2的N次幂
 * 
 * @param size 原缓冲区大小
 * @param mode 模式：ROUND_UP | ROUND_DN
 * @return fifo_t 调整后的缓冲区大小 
 */
static fifo_t round_fifo_size(fifo_t size, int mode) {
  assert_fifo(mode == ROUND_UP || mode == ROUND_DN);
  if (!size) return ((fifo_t)1UL);

  fifo_t  position = 0;
  while (size != 0) {
    position ++;
    size = size >> 1UL;    
  }
  position = mode ? position : position - 1;
  // 如果溢出，返回可表示的最大的2的N次幂 
  if (position >= (sizeof(fifo_t) << 3UL)) {
    position = position - 1;
  }
  return ((fifo_t)1UL << position);
}

/**
 * @brief fifo静态初始化：将一个缓冲区初始化为fifo队列
 * 
 * @param fifo  FIFO指针 
 * @param buffer_addr 缓冲区地址
 * @param buffer_size 缓冲区大小
 * @return int 0表示初始化成功
 */
int fifo_init(FIFO_TypeDef *fifo, uint8_t *buffer_addr, fifo_t buffer_size) {
  assert_fifo(fifo);
  if (check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_DN);
  }
  if (buffer_size < 2) return -EINVAL;

  fifo->buf  = buffer_addr;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;

  fifo_reset(fifo);
  return 0;
}

/**
 * @brief fifo动态初始化：申请一个空间初始化为fifo队列
 * 
 * @param fifo FIFO指针
 * @param buffer_size 缓冲区大小
 * @return int 0表示初始化成功
 */
int fifo_alloc(FIFO_TypeDef *fifo, fifo_t buffer_size) {
  assert_fifo(fifo);
  if (check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_UP);
  }
  if (buffer_size < 2) return EINVAL;

  fifo->buf = (uint8_t *)malloc(sizeof(uint8_t) * buffer_size);
  if (fifo->buf == NULL) return ENOMEM;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;
  
  fifo_reset(fifo);
  return 0;
}

/**
 * @brief fifo入队函数：将len个字节数据入队
 * 
 * @param fifo FIFO指针
 * @param src 源数据地址
 * @param len 待写入的数据长度
 * @return fifo_t 实际写入的数据长度
 */
fifo_t fifo_write(FIFO_TypeDef *fifo, const uint8_t *src, fifo_t len) {
  assert_fifo(fifo);
  if (fifo_is_full(fifo)) return 0;

  fifo_t  l;
  len = min(len, fifo->size - fifo->in + fifo->out);
  l = min(len, fifo->size - (fifo->in & fifo->mask));

  memcpy(fifo->buf + (fifo->in & fifo->mask), src, l);
  memcpy(fifo->buf, src + l, len - l);

  barrier_fifo();
  fifo->in += len;
  return len;
}

/**
 * @brief fifo出队函数：将len个字节数据出队
 * 
 * @param fifo FIFO指针
 * @param dst 目的地址
 * @param len 待读取的数据长度
 * @return fifo_t 实际读取的数据长度
 */
fifo_t fifo_read(FIFO_TypeDef *fifo, uint8_t *dst, fifo_t len) {
  assert_fifo(fifo);
  if (fifo_is_empty(fifo)) return 0;

  fifo_t  l;
  len = min(len, fifo->in - fifo->out);
  l = min(len, fifo->size - (fifo->out & fifo->mask));

  memcpy(dst, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(dst + l, fifo->buf, len - l);

  barrier_fifo();
  fifo->out += len;
  return len;
}

/**
 * @brief fifo出队函数：将len个字节数据出队，但不会更新out指针
 * 
 * @param fifo FIFO指针
 * @param dst 目的地址
 * @param len 待读取的数据长度
 * @return fifo_t 实际读取的数据长度
 */
fifo_t fifo_read_peek(FIFO_TypeDef *fifo, uint8_t *dst, fifo_t  len) {
  assert_fifo(fifo);
  if (fifo_is_empty(fifo)) return 0;

  fifo_t  l;
  len = min(len, fifo->in - fifo->out);
  l = min(len, fifo->size - (fifo->out & fifo->mask));

  memcpy(dst, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(dst + l, fifo->buf, len - l);

  return len;
}

/**
 * @brief fifo入队函数：将1个字节数据入队
 * 
 * @param fifo FIFO指针
 * @param c 待写入的字节数据
 * @return fifo_t 实际写入的数据长度
 */
fifo_t fifo_write_byte(FIFO_TypeDef *fifo, uint8_t c) {
  assert_fifo(fifo);
  if (fifo_is_full(fifo)) return 0;

  fifo->buf[fifo->in & fifo->mask] = c;
  
  barrier_fifo();
  fifo->in++;
  return 1;
}

/**
 * @brief fifo出队函数：将1个字节数据出队
 * 
 * @param fifo  FIFO指针 
 * @param dst 目的地址
 * @return fifo_t 实际读取的字节数
 */
fifo_t fifo_read_byte(FIFO_TypeDef *fifo, uint8_t *dst) {
  assert_fifo(fifo);
  if (fifo_is_empty(fifo)) return 0;

  *dst = fifo->buf[fifo->out & fifo->mask];
  
  barrier_fifo();
  fifo->out++;
  return 1;
}

/**
 * @brief fifo出队函数：将1个字节数据出队，但不会更新out指针
 * 
 * @param fifo FIFO指针
 * @param dst 目的地址
 * @return fifo_t 实际读取的字节数
 */
fifo_t fifo_read_byte_peek(FIFO_TypeDef *fifo, uint8_t *dst) {
  assert_fifo(fifo);
  if (fifo_is_empty(fifo)) return 0;

  *dst = fifo->buf[fifo->out & fifo->mask];
  
  return 1;
}

static inline fifo_t min(fifo_t x, fifo_t y) {
  return (x < y ? x : y);
}


