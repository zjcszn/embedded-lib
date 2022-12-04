#include "lw_button.h"

/******************************** macro definition ********************************/

#define TICKS_INTERVAL          ( 10U)        // ticks interval
#define TICKS_FILTER            (  2U)        // ticks of button filter
#define TICKS_PRESS_REPEAT      ( 20U)        // ticks of repeat press
#define TICKS_LONG_PRESS        (100U)        // ticks of long press
#define TICKS_LONG_PRESS_HOLD   (  5U)        // ticks of long press hold

#define ACT_LEVEL_L             (  0U)        // low  level when button actived
#define ACT_LEVEL_H             (  1U)        // high level when button actived

/***************************** event fifo configure *******************************/

#define EVENT_FIFO_SIZE         (16U)
#define EVENT_FIFO_MASK         (EVENT_FIFO_SIZE - 1)


static struct {
  ButtonEvent_T     buf[EVENT_FIFO_SIZE];     // buffer
  volatile uint8_t  r;                        // pointer of read
  volatile uint8_t  w;                        // pointer of write
} event_fifo = {0};

static inline uint8_t fifo_used(void) {
  return (event_fifo.w - event_fifo.r);
}

static inline int is_fifo_empty(void) {
  return (event_fifo.w == event_fifo.r);
}

static inline int is_fifo_full(void) {
  return (fifo_used() == EVENT_FIFO_SIZE);
}

/****************************** hardware configure ******************************/

static HButton_T hbtn_list[HBUTTON_COUNT] = {
  // [hbtn id]   = {filter ticks， action level}
  [HBUTTON_KEY0] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY1] = {0, ACT_LEVEL_L},
  [HBUTTON_KEY2] = {0, ACT_LEVEL_L},
  [HBUTTON_WKUP] = {0, ACT_LEVEL_H},
};

typedef uint32_t hbtn_status_t;   // hbtn count <= sizeof(hbtn_status_t) * 8
static volatile  hbtn_status_t hbtn_status = 0;

#define HBTN_MASK(i)        (1U << (i))
#define HBTN_MASK_ALL       (~((~((hbtn_status_t)0ULL)) << HBUTTON_COUNT))
#define HBTN_STAT_GET(i)    ((hbtn_status >> (i)) & 1U)


static uint8_t (*read_hbtn_gpio)(uint8_t hbtn_id) = NULL;

/**
 * @brief check hbtn status
 * 
 * @param hbtn_id hbtn id
 * @return int status changed on 0 | status unchanged on 1
 */
static inline int check_hbtn_status(uint8_t hbtn_id) {
  return (HBTN_STAT_GET(hbtn_id) != (read_hbtn_gpio(hbtn_id) == hbtn_list[hbtn_id].act_level));
}

/****************************** software configure ******************************/

// button list
static Button_T button_list[BUTTON_COUNT] = {
  // [button id]  = {button id， button type， initval of state， hbtn 1， hbtn 2， initval of ticks}
  [BUTTON_KEY0]   = {BUTTON_KEY0,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY0, HBUTTON_NULL, 0},
  [BUTTON_KEY1]   = {BUTTON_KEY1,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY1, HBUTTON_NULL, 0},
  [BUTTON_KEY2]   = {BUTTON_KEY2,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_KEY2, HBUTTON_NULL, 0},
  [BUTTON_WKUP]   = {BUTTON_WKUP,   BUTTON_TYPE_SINGLE, STATE_IDLE, HBUTTON_WKUP, HBUTTON_NULL, 0},

  [BUTTON_COMBO1] = {BUTTON_COMBO1, BUTTON_TYPE_COMBO,  STATE_IDLE, HBUTTON_WKUP, HBUTTON_KEY0, 0},
  [BUTTON_COMBO2] = {BUTTON_COMBO2, BUTTON_TYPE_COMBO,  STATE_IDLE, HBUTTON_WKUP, HBUTTON_KEY2, 0},
};

/************************ static function declaration ***************************/

static void hbtn_status_update(void);
static int  button_action_get(Button_T *btn);
static void button_fsm_update(Button_T *btn);
static int  button_event_write(uint8_t btn_id, uint8_t btn_event);

/************************** function implementatio ******************************/

/**
 * @brief init function
 * 
 * @param cb pointer of callback function
 */
void button_init (uint8_t(*cb)(uint8_t hbtn_id)) {
  read_hbtn_gpio = cb;
}

/**
 * @brief poll function
 * 
 */
void button_poll(void) {
  hbtn_status_update();
  for (int i = 0; i < BUTTON_COUNT; i++) {
    button_fsm_update(&button_list[i]);
  }
}

/**
 * @brief update hardware layer button status
 * 
 * @param 
 */
static void hbtn_status_update(void) {
  for (int i = 0; i < HBUTTON_COUNT; i++) {
    if (check_hbtn_status(i)) {
      if (++(hbtn_list[i].filter_cnt) >= TICKS_FILTER) {
        // reverse hbutton status
        hbtn_status ^= HBTN_MASK(i);
        hbtn_list[i].filter_cnt = 0;
      }      
    }
    else {
      hbtn_list[i].filter_cnt = 0;
    }
  }
  // mask unused bits
  hbtn_status &= HBTN_MASK_ALL;
}

/**
 * @brief get button action
 * 
 * @param  
 * @return int press up on 0 | press down on 1 | press break on 2
 */
static int button_action_get(Button_T *btn) {
  // single button: if other button press down, will break target button action
  if (btn->type == BUTTON_TYPE_SINGLE) {
    if (hbtn_status & ~(HBTN_MASK(btn->hbtn_1))) {
      return BUTTON_ACTION_BRK;
    }
    else {
      return HBTN_STAT_GET(btn->hbtn_1);
    }
  }
  // combo button: only when hbtn 1 press down, can trigger combo button action
  else {
    if (hbtn_status & ~(HBTN_MASK(btn->hbtn_1) | HBTN_MASK(btn->hbtn_2))) {
      return BUTTON_ACTION_BRK;
    }
    else {
      if (HBTN_STAT_GET(btn->hbtn_1)) {
        return HBTN_STAT_GET(btn->hbtn_2);
      }
      else {
        return BUTTON_ACTION_BRK;
      }
    }
  }
}

/**
 * @brief update state of button fsm
 * 
 * @param btn pointer of button
 */
void button_fsm_update(Button_T *btn) {
  int btn_action = button_action_get(btn);
  switch (btn->state) {
    case STATE_IDLE:
      if (btn_action == BUTTON_ACTION_DOWN) {
        button_event_write(btn->id, EVENT_PRESS_DOWN);
        btn->ticks = 0;
        btn->state = STATE_PRESS_DOWN;
      }
      break;

    case STATE_PRESS_DOWN:
      if (btn_action == BUTTON_ACTION_BRK) {
				btn->state = STATE_PRESS_BRK;
      }
      else if (btn_action == BUTTON_ACTION_DOWN) {
				if (++btn->ticks >= TICKS_LONG_PRESS) {
					button_event_write(btn->id, EVENT_LONG_PRESS_START);
          btn->ticks = 0;
          btn->state = STATE_PRESS_LONG;
				}
      }
      else {
        button_event_write(btn->id, EVENT_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_LONG:
    	if (btn_action == BUTTON_ACTION_BRK) {
				btn->state = STATE_PRESS_BRK;
			}
      else if (btn_action == BUTTON_ACTION_DOWN)
      {
        if (++btn->ticks >= TICKS_LONG_PRESS_HOLD) {
          button_event_write(btn->id, EVENT_LONG_PRESS_HOLD);
          btn->ticks = 0;
        }
      }
      else {
        button_event_write(btn->id, EVENT_LONG_PRESS_UP);
        btn->state = STATE_IDLE;
      }
      break;

    case STATE_PRESS_BRK:
      if (btn_action == BUTTON_ACTION_UP) {
        btn->state = STATE_IDLE;
      }
      break;
    
    default:
      btn->state = STATE_IDLE;
      break;
  }
}

/**
 * @brief write button event to fifo buffer
 *  
 * @param btn_id  button id
 * @param btn_event button event
 * @return int success on 1 | failed on 0
 */
int button_event_write(uint8_t btn_id, uint8_t btn_event) {
  if (is_fifo_full()) return 0;
  ButtonEvent_T *target = &event_fifo.buf[event_fifo.w & EVENT_FIFO_MASK];
  target->button_id    = btn_id;
  target->button_event = btn_event;
  event_fifo.w++;
  return 1;
}

/**
 * @brief read button event from fifo buffer
 * 
 * @param buf pointer of recv buffer
 * @return int success on 1 | failed on 0
 */
int button_event_read(ButtonEvent_T *buf) {
  if (is_fifo_empty()) return 0;
  ButtonEvent_T *target = &event_fifo.buf[event_fifo.r & EVENT_FIFO_MASK];
  buf->button_id    = target->button_id;
  buf->button_event = target->button_event;
  event_fifo.r++;
  return 1;
}
