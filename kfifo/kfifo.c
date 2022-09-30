/**
 * @File:    kfifo.c
 * @Author:  zjcszn
 * @Date:    2022-09-25
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-25  zjcszn       First add
 * 
*/

#include "kfifo.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define min(x,y) ((x) < (y) ? (x) : (y))

#define ROUND_UP 1    // 向上调整为2的N次幂
#define ROUND_DN 0    // 向下调整为2的N次幂

#ifdef USE_KFIFO_ASSERT
  #define assert_fifo(expr) ((expr) ? (void)0 : assert_fifo_failed((uint8_t *)__FILE__, __LINE__))
  #define assert_fifo_failed(file, line) \
          do {  \
            printf("assert failed: file %s on line %d\r\n", file, line); \
          } while(0)
#else
  #define assert_fifo(expr) ((void)0UL)
#endif

/**
 * @brief 检查kfifo缓冲区大小是否是2的N次幂
 * 
 * @param size 缓冲区大小
 * @return 返回1：是2的N次幂 ; 返回0：不是2的N次幂 
 */
static inline int check_fifo_size(kfifo_t size) {
  return (size != 0 && ((size & (size - 1)) == 0));
}

static kfifo_t round_fifo_size(kfifo_t size, int mode) {
  assert_fifo(mode == ROUND_UP || mode == ROUND_DN);
  if (!size) return 1UL;

  kfifo_t position = 0;
  while (size != 0) {
    position ++;
    size = size >> 1UL;    
  }
  position = mode ? position : position - 1; 
  return ((kfifo_t)1UL << position);
}

int kfifo_init(KFIFO *fifo, const uint8_t *buffer_addr, kfifo_t buffer_size) {
  assert_fifo(fifo);
  if (!check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_DN);
  }
  if (buffer_size < 2) return EINVAL;

  fifo->buf = buffer_addr;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;

  kfifo_reset(fifo);
  return 0;
}

int kfifo_alloc(KFIFO *fifo, kfifo_t buffer_size) {
  assert_fifo(fifo);
  if (!check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_UP);
  }
  if (buffer_size < 2) return EINVAL;

  fifo->buf = (uint8_t *)malloc(sizeof(uint8_t) * buffer_size);
  if (fifo->buf == NULL) return ENOMEM;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;
  
  kfifo_reset(fifo);
  return 0;
}

kfifo_t kfifo_put(KFIFO *fifo, const uint8_t *src_buf, kfifo_t len) {
  assert_fifo(fifo);
  if (kfifo_is_full(fifo)) return 0;

  kfifo_t l;
  len = min(len, fifo->size - fifo->in + fifo->out);
  l = min(len, fifo->size - (fifo->in & fifo->mask));

  memcpy(fifo->buf + (fifo->in & fifo->mask), src_buf, l);
  memcpy(fifo->buf, src_buf + l, len - l);

  barrier_fifo();
  fifo->in += len;
  return len;
}

kfifo_t kfifo_get(KFIFO *fifo, uint8_t *dst_buf, kfifo_t len) {
  assert_fifo(fifo);
  if (kfifo_is_empty(fifo)) return 0;

  kfifo_t l;
  len = min(len, fifo->in - fifo->out);
  l = min(len, fifo->size - (fifo->out & fifo->mask));

  memcpy(dst_buf, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(dst_buf + l, fifo->buf, len - l);

  barrier_fifo();
  fifo->out += len;
  return len;
}

kfifo_t kfifo_putc(KFIFO *fifo, uint8_t c) {
  assert_fifo(fifo);
  if (kfifo_is_full(fifo)) return 0;

  fifo->buf[fifo->in & fifo->mask] = c;
  
  barrier_fifo();
  fifo->in++;
  return 1;
}

kfifo_t kfifo_getc(KFIFO *fifo, uint8_t *c) {
  assert_fifo(fifo);
  if (kfifo_is_empty(fifo)) return 0;

  *c = fifo->buf[fifo->out & fifo->mask];
  
  barrier_fifo();
  fifo->out++;
  return 1;
}



