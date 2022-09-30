/**
 * @File:    kfifo.h
 * @Author:  zjcszn
 * @Date:    2022-09-25
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-25  zjcszn       First add
 * 
*/

#ifndef __KFIFO_H__
#define __KFIFO_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>


//#define USE_KFIFO_BARRIER // 使用内存屏障
//#define USE_KFIFO_ASSERT  // 使用assert宏

#ifndef __IO
#define __IO volatile
#endif

#ifdef USE_KFIFO_BARRIER
  #if defined (__CORTEX_M)
    #include "cmsis_compiler.h"
    #define barrier_fifo() __DSB()  // ARM数据同步屏障
  #elif defined (__GNUC__)
    #define barrier_fifo __sync_synchronize()
  #else
    #define barrier_fifo() ((void)0U)
  #endif
#else
  #define barrier_fifo() ((void)0U)
#endif

typedef uint32_t kfifo_t;

typedef struct _kfifo{
        uint8_t   *buf;   // 环形缓冲区地址
        kfifo_t   size;   // 缓冲区大小
        kfifo_t   mask;   // 下标掩码
  __IO  kfifo_t   in;     // 写指针
  __IO  kfifo_t   out;    // 读指针
}KFIFO;

// 重置kfifo
static inline void kfifo_reset(KFIFO *fifo) {
  fifo->in = fifo->out = 0;
}

// 判断kfifo缓冲区是否为空
static inline int kfifo_is_empty(KFIFO *fifo) {
  barrier_fifo();
  return (fifo->in == fifo->out);
}

// kfifo缓冲区中已写入的字节长度
static inline kfifo_t kfifo_len(KFIFO *fifo) {
  barrier_fifo();
  return (fifo->in - fifo->out);
}

// 判断kfifo缓冲区是否已满
static inline int kfifo_is_full(KFIFO *fifo) {
  barrier_fifo();
  return (fifo->size == (fifo->in - fifo->out));
}

int     kfifo_init(KFIFO *fifo, const uint8_t *buffer_addr, kfifo_t buffer_size);
int     kfifo_alloc(KFIFO *fifo, kfifo_t buffer_size);
kfifo_t kfifo_put(KFIFO *fifo, const uint8_t *src_buf, kfifo_t len);
kfifo_t kfifo_get(KFIFO *fifo, uint8_t *dst_buf, kfifo_t len);
kfifo_t kfifo_putc(KFIFO *fifo, uint8_t c);
kfifo_t kfifo_getc(KFIFO *fifo, uint8_t *c);

#ifdef __cplusplus
}
#endif

#endif