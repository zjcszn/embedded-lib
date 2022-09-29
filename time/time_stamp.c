#include "time_stamp.h"


#define UTC_BASE_YEAR   (1970UL)
#define MONTH_PER_YEAR  (12UL)
#define DAY_PER_YEAR    (365UL)
#define SEC_PER_DAY     (86400UL)
#define SEC_PER_HOUR    (3600UL)
#define SEC_PER_MIN     (60UL)

const uint8_t g_day_per_mon[MONTH_PER_YEAR] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

static inline int is_leap_year(uint16_t year) {
  return (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0));
}

int time_to_utc(utc_time *utc, time_stamp _time) {
  utc->tm_year;
}