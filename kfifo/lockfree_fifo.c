/**
 * @File:    lockfree_fifo.c
 * @Author:  zjcszn
 * @Date:    2022-09-25
 * 
 * Change logs:
 * Date        Author       Notes
 * 2022-09-25  zjcszn       First add
 * 
*/

#include "lockfree_fifo.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define min(x,y) ((x) < (y) ? (x) : (y))

#define ROUND_UP 1    /* flag: round up to the power of 2 */
#define ROUND_DN 0    /* flag: round dn to the power of 2 */

#ifdef USE_LOCKFREE_FIFO_ASSERT
  #define assert_fifo(expr) ((expr) ? (void)0 : assert_fifo_failed((uint8_t *)__FILE__, __LINE__))
  #define assert_fifo_failed(file, line) \
          do {  \
            printf("assert failed: file %s on line %d\r\n", file, line); \
          } while(0)
#else
  #define assert_fifo(expr) ((void)0UL)
#endif

/**
 * @brief check size of fifo buffer
 * 
 * @param size buffer size
 * @return int return 1：is power of 2 ; return 0：is not power of 2 
 */
static inline int check_fifo_size(fifo_t size) {
  return (size != 0 && ((size & (size - 1)) == 0));
}

static fifo_t round_fifo_size(fifo_t size, int mode) {
  assert_fifo(mode == ROUND_UP || mode == ROUND_DN);
  if (!size) return 1UL;

  fifo_t position = 0;
  while (size != 0) {
    position ++;
    size = size >> 1UL;    
  }
  position = mode ? position : position - 1; 
  return ((fifo_t)1UL << position);
}

int lockfree_fifo_init(lockfree_fifo *fifo, const uint8_t *buffer_addr, fifo_t buffer_size) {
  assert_fifo(fifo);
  if (!check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_DN);
  }
  if (buffer_size < 2) return EINVAL;

  fifo->buf = buffer_addr;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;

  lockfree_fifo_reset(fifo);
  return 0;
}

int lockfree_fifo_alloc(lockfree_fifo *fifo, fifo_t buffer_size) {
  assert_fifo(fifo);
  if (!check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, ROUND_UP);
  }
  if (buffer_size < 2) return EINVAL;

  fifo->buf = (uint8_t *)malloc(sizeof(uint8_t) * buffer_size);
  if (fifo->buf == NULL) return ENOMEM;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;
  
  lockfree_fifo_reset(fifo);
  return 0;
}

fifo_t lockfree_fifo_put(lockfree_fifo *fifo, const uint8_t *buffer, fifo_t len) {
  assert_fifo(fifo);
  if (lockfree_fifo_is_full(fifo)) return 0;

  fifo_t l;
  len = min(len, fifo->size - fifo->in + fifo->out);
  l = min(len, fifo->size - (fifo->in & fifo->mask));

  memcpy(fifo->buf + (fifo->in & fifo->mask), buffer, l);
  memcpy(fifo->buf, buffer + l, len - l);

  barrier_fifo();
  fifo->in += len;
  return len;
}

fifo_t lockfree_fifo_get(lockfree_fifo *fifo, uint8_t *buffer, fifo_t len) {
  assert_fifo(fifo);
  if (lockfree_fifo_is_empty(fifo)) return 0;

  fifo_t l;
  len = min(len, fifo->in - fifo->out);
  l = min(len, fifo->size - (fifo->out & fifo->mask));

  memcpy(buffer, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(buffer + l, fifo->buf, len - l);

  barrier_fifo();
  fifo->out += len;
  return len;
}

fifo_t lockfree_fifo_putc(lockfree_fifo *fifo, uint8_t c) {
  assert_fifo(fifo);
  if (lockfree_fifo_is_full(fifo)) return 0;

  fifo->buf[fifo->in & fifo->mask] = c;
  
  barrier_fifo();
  fifo->in++;
  return 1;
}

fifo_t lockfree_fifo_getc(lockfree_fifo *fifo, uint8_t *c) {
  assert_fifo(fifo);
  if (lockfree_fifo_is_empty(fifo)) return 0;

  *c = fifo->buf[fifo->out & fifo->mask];
  
  barrier_fifo();
  fifo->out++;
  return 1;
}



