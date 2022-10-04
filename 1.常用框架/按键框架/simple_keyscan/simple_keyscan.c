#include "simple_keyscan.h"


#ifndef NULL
#define ((void*)0)
#endif

static uint8_t(*read_key_gpio)(uint8_t key) = NULL;
static uint8_t key_status;

static void key_read(void) {
  uint8_t raw_data = 0;
}