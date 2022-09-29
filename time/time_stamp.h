#ifndef __TIME_STAMP_H__
#define __TIME_STAMP_H__

#include <stdint.h>

typedef uint64_t time_stamp;

typedef struct _utc_time {
  uint32_t tm_sec;
  uint32_t tm_min;
  uint32_t tm_hour;
  uint32_t tm_mday;
  uint32_t tm_mon;
  uint32_t tm_year;
  uint32_t tm_wday;
  uint32_t tm_yday;  

} utc_time;


#endif