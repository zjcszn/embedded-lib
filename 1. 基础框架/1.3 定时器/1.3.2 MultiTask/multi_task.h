#ifndef __MULTI_TASK_H__
#define __MULTI_TASK_H__

#include <stdint.h>

#ifdef __cplusplus  
extern "C" {  
#endif


typedef struct _task {
  uint8_t  task_id;
  uint8_t  delay; 
  uint8_t  period;
  uint8_t  flag;
}Task_T;



#ifdef __cplusplus  
}  
#endif

#endif