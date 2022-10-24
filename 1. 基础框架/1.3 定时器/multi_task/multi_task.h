#ifndef __MULTI_TASK_H__
#define __MULTI_TASK_H__

#include <stdint.h>

typedef uint32_t task_t;

typedef struct task {
  void (*p_task)(void);
  task_t  ticks_cnt;
  task_t  ticks_init;
  task_t  state;
}


#endif