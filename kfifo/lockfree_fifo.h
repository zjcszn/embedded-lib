/**
 * @File:    lockfree_fifo.h
 * @Author:  zjcszn
 * @Date:    2022-09-25
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-25  zjcszn       First add
 * 
*/

#ifndef __LOCK_FREE_FIFO_H__
#define __LOCK_FREE_FIFO_H__

#include <stdint.h>


//#define USE_LOCKFREE_FIFO_BARRIER // use memory barrier
//#define USE_LOCKFREE_FIFO_ASSERT  // use assert

#ifndef __IO
#define __IO volatile
#endif

#if defined (USE_LOCKFREE_FIFO_BARRIER) && defined (__CORTEX_M)
  #include "cmsis_compiler.h"
  #define barrier_fifo() __DSB()  // ARM data synchronization barrier
#else
  #define barrier_fifo() ((void)0U)
#endif

typedef uint32_t fifo_t;

typedef struct _lockfree_fifo {
  uint8_t *buf;   // fifo ring buffer address
  fifo_t  size;   // fifo ring buffer size
  fifo_t  mask;   // mask for read/write pointer
  __IO fifo_t  in;     // pointer of write
  __IO fifo_t  out;    // pointer of read
}lockfree_fifo;

static inline void lockfree_fifo_reset(lockfree_fifo *fifo) {
  fifo->in = fifo->out = 0;
}

static inline int lockfree_fifo_is_empty(lockfree_fifo *fifo) {
  barrier_fifo();
  return (fifo->in == fifo->out);
}

static inline fifo_t lockfree_fifo_len(lockfree_fifo *fifo) {
  barrier_fifo();
  return (fifo->in - fifo->out);
}

static inline int lockfree_fifo_is_full(lockfree_fifo *fifo) {
  barrier_fifo();
  return (fifo->size == (fifo->in - fifo->out));
}

#ifdef __cplusplus
extern "C" {
#endif

int lockfree_fifo_init(lockfree_fifo *fifo, const uint8_t *buffer_addr, fifo_t buffer_size);
int lockfree_fifo_alloc(lockfree_fifo *fifo, fifo_t buffer_size);
fifo_t lockfree_fifo_put(lockfree_fifo *fifo, const uint8_t *buffer, fifo_t len);
fifo_t lockfree_fifo_get(lockfree_fifo *fifo, uint8_t *buffer, fifo_t len);
fifo_t lockfree_fifo_putc(lockfree_fifo *fifo, uint8_t c);
fifo_t lockfree_fifo_getc(lockfree_fifo *fifo, uint8_t *c);

#ifdef __cplusplus
}
#endif

#endif