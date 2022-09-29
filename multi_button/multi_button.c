#include "multi_button.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>


#define TICKS_INTERVAL        ( 10U)  // ticks周期：10ms
#define TICKS_FILTER          (  2U)  // 按键消抖ticks，消抖时间 = ticks * ticks周期
#define TICKS_REPEAT_CLICK    ( 30U)  // 按键连击ticks，同上
#define TICKS_LONG_PRESS      (100U)  // 按键长按ticks，同上

//  multi_button 状态机状态
#define  STATE_IDLE         0   // 按键空闲状态 
#define  STATE_PRESS_DOWN   1   // 按键按下状态
#define  STATE_CLICK        2   // 按键单击状态
#define  STATE_LONG_PRESS   3   // 按键长按状态

/******************** 按键事件FIFO配置 ********************/
#ifdef USE_BUTTON_EVENT_FIFO

#define EVENT_FIFO_SIZE  (16U)   // SIZE 必须是2的N次幂
#define EVENT_FIFO_MASK  (15U)   // MASK = SIZE - 1 

static ButtonEvent events_buffer[EVENT_FIFO_SIZE];
static struct {
  ButtonEvent *buffer;
  uint8_t     in;
  uint8_t     out;
}events_fifo = {
  .buffer = events_buffer,
  .in     = 0,
  .out    = 0,
};

static int events_fifo_put(Button *button);
static int events_fifo_get(ButtonEvent *button_event);

#endif

/*********************** 按键配置 ***********************/
// 按键链表头
static Button *button_list = NULL;
// 获取按键输入电平的函数指针
static uint8_t(*read_button_gpio)(uint8_t button_id) = NULL;
// 按键初始化列表 用户自定义
static ButtonInitList button_init_list[NUM_OF_BUTTON] = {
  /* {按键ID, 最大连击次数，长按事件允许位，按键动作电平, 按键回调函数指针, 按键结构体} */
  {BUTTON_KEY1, REPEAT_MAX, LONGPRESS_ENABLE, ACT_LEVEL_L, NULL, {0}},  
  {BUTTON_KEY2, REPEAT_MAX, LONGPRESS_ENABLE, ACT_LEVEL_L, NULL, {0}},
  {BUTTON_KEY3, REPEAT_MAX, LONGPRESS_ENABLE, ACT_LEVEL_L, NULL, {0}},
  {BUTTON_KEY4, REPEAT_MAX, LONGPRESS_ENABLE, ACT_LEVEL_L, NULL, {0}},
};
// 字符串数组：按键名称
static char* str_button_name[NUM_OF_BUTTON] = {
  "KEY 1",
  "KEY 2",
  "KEY 3",
  "KEY 4",
};
// 字符串数组：事件名称
static char* str_button_event[NUM_OF_EVENT] = {
  "None Press",
  "Press Down",
  "Press Up",
  "Repeat Click",
  "Single Click",
  "Double Click",
  "Long Press Start",
  "Long Press Hold",
  "Long Press Up",
};

// 按键事件触发及回调函数调用的辅助宏
#define SET_EVENT_AND_CALL_CB(evt) \
        do {  \
          button->event = (uint8_t)evt; \
          button_event_callback(button); \
        } while (0)


/********************* 静态函数声明 **********************/

static void button_init(Button *button, uint8_t button_id, uint8_t repeat_max,
                        uint8_t long_press, uint8_t act_level, ButtonCallback cb);
static void button_event_callback(Button *button);
static void button_state_update(Button *button);
static int events_fifo_get(ButtonEvent *button_event);
static int events_fifo_get(ButtonEvent *button_event);
static inline void read_button_gpio_check(void);

/*********************** 函数定义 ***********************/

void read_button_gpio_register(uint8_t(*callback)(uint8_t button_id)) {
  read_button_gpio = callback;
}

void button_list_init(ButtonInitList *init_list, uint8_t button_num) {
  assert(init_list);
  ButtonInitList *target;
  for (int i = 0; i < button_num; i++) {
    target = &init_list[i];
    button_init(&target->button, target->init_button_id, target->init_repeat_max, 
                target->init_long_press, target->init_act_level, target->init_cb);
    target->button.next = button_list;
    button_list = &target->button;
  }
}

int button_add(Button *button)
{
	Button* target = button_list;
	while(target) {
		if (target == button) return -1;	// 按键已存在
		target = target->next;
	}
	button->next = button_list;
	button_list  = button;
	return 0;
}

int button_del(Button *button) {
  if (!button_list || !button) return -1;
  if (button_list == button) {
    button_list = button_list->next;
    return 0;
  }

  Button *pre_node = button_list;
  while (pre_node != NULL && pre_node->next != button) {
    pre_node = pre_node->next;
  }

  if (pre_node == NULL) return -1;
  else {
    pre_node->next = button->next;
  }
  return 0;
}

#ifdef USE_BUTTON_EVENT_FIFO
/**
 * @brief 按键事件读取函数
 * 
 * @param event_buf 
 * @return int 
 */
int button_event_read(ButtonEvent *event_buf) {
  return events_fifo_get(event_buf);
}

/**
 * @brief 按键事件打印函数
 * 
 */
void button_event_print(void) {

  ButtonEvent event_buf;
  while (events_fifo_get(&event_buf)) {
    printf("%s:%s\r\n", str_button_name[event_buf.button_id], str_button_event[event_buf.button_event]);
  }
}
#endif

/**
 * @brief 按键定时扫描函数
 * 
 */
void button_ticks(void) {
  Button *target = button_list;
  while (target != NULL) {
		button_state_update(target);
    target = target->next;
	}
}

/**
 * @brief multi button事件回调函数
 * 
 * @param button 
 */
static void button_event_callback(Button *button) {
#ifdef USE_BUTTON_EVENT_FIFO
  events_fifo_put(button);
#endif
  if (button->callback) {
    button->callback(button);
  }
}

/**
 * @brief read_button_gpio函数有效性检查
 * 
 */
static inline void read_button_gpio_check(void) {
  if (read_button_gpio == NULL) {
    printf("Read Button GPIO Function Not Register\r\n");
    while (1);
  }
}

/**
 * @brief 按键结构体初始化函数
 * 
 * @param button 
 * @param button_id 
 * @param repeat_max
 * @param long_press
 * @param act_level 
 * @param cb 
 */
static void button_init(Button *button, uint8_t button_id, uint8_t repeat_max,
                        uint8_t long_press, uint8_t act_level, ButtonCallback cb) {
  read_button_gpio_check();
  memset(button, 0x00, sizeof(Button));
  button->id = button_id;
  button->repeat_max = repeat_max;
  button->long_press = long_press;
  button->cur_level  = read_button_gpio(button_id);
  button->act_level  = act_level;
  button->callback   = cb;
}

/**
 * @brief 按键状态更新函数
 * 
 * @param button 
 */
static void button_state_update(Button *button) {
  assert(button);

  uint8_t read_gpio_level = read_button_gpio(button->id);
  if (button->state > 0) button->ticks_cnt++;

  // 按键消抖处理程序
	if (read_gpio_level != button->cur_level) { 
		if (++button->filter_cnt > TICKS_FILTER) {
			button->filter_cnt = 0;
			button->cur_level = read_gpio_level;
		}
	} 
  else {
		button->filter_cnt = 0;
	}

  // 按键状态机
  switch (button->state) {
    case STATE_IDLE:
      if (button->cur_level == button->act_level) {
        button->ticks_cnt = 0;
        button->repeat_cnt = 0;
        SET_EVENT_AND_CALL_CB(EVENT_PRESS_DN);
        button->state = (uint8_t)STATE_PRESS_DOWN;
      }
      else {
        button->event = (uint8_t)EVENT_NULL;
      }
      break;
    
    case STATE_PRESS_DOWN:
      if (!button->long_press || button->ticks_cnt < TICKS_LONG_PRESS) {
        if (button->cur_level != button->act_level) {
          button->ticks_cnt = 0;
          SET_EVENT_AND_CALL_CB(EVENT_PRESS_UP);
          button->state = (uint8_t)STATE_CLICK;
        }
      }
      else {
        SET_EVENT_AND_CALL_CB(EVENT_LONG_PRESS_START);
        button->state = (uint8_t)STATE_LONG_PRESS;
      }
      break;

    case STATE_CLICK:
      if (button->repeat_cnt == button->repeat_max || button->ticks_cnt >= TICKS_REPEAT_CLICK) {
        SET_EVENT_AND_CALL_CB(EVENT_SINGLE_CLICK + button->repeat_cnt);
        button->state = (uint8_t)STATE_IDLE;
      }
      else if (button->cur_level == button->act_level) {
        button->ticks_cnt = 0;
        button->repeat_cnt++;
        SET_EVENT_AND_CALL_CB(EVENT_REPEAT_CLICK);
        SET_EVENT_AND_CALL_CB(EVENT_PRESS_DN);
        button->state = (uint8_t)STATE_PRESS_DOWN;
      }
      break;

    case STATE_LONG_PRESS:
      if (button->cur_level == button->act_level) {
        SET_EVENT_AND_CALL_CB(EVENT_LONG_PRESS_HOLD);
      }
      else {
        SET_EVENT_AND_CALL_CB(EVENT_LONG_PRESS_UP);
        button->state = (uint8_t)STATE_IDLE;
      }
      break;

    default:
      button->state = (uint8_t)STATE_IDLE;
      break;
  }
}

#ifdef USE_BUTTON_EVENT_FIFO
static int events_fifo_put(Button *button) {
  if (EVENT_FIFO_SIZE == events_fifo.in - events_fifo.out) return 0;
  ButtonEvent event_tmp = {
    .button_id = button->id,
    .button_event = button->event,    
  };

  memcpy(events_fifo.buffer + (events_fifo.in & EVENT_FIFO_MASK), &event_tmp, sizeof(ButtonEvent));
  events_fifo.in++;
  return 1;
}

static int events_fifo_get(ButtonEvent *button_event) {
  if (events_fifo.in == events_fifo.out) return 0;
  memcpy(button_event, events_fifo.buffer + (events_fifo.out & EVENT_FIFO_MASK), sizeof(ButtonEvent));
  events_fifo.out++;
  return 1;
}
#endif
