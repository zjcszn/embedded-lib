#include "multi_menu.h"
#include <string.h>

/**************************** Macro Definition ***************************/

#define MENU_DISP_MAX_ITEMS       (2U)      // max number of display items
#define MENU_TREE_DEPTH           (3U)      // max level  of menu tree

/**************************** Private Variable ***************************/

static MenuList   menu_list;                // pointer of menu list
static uint32_t   menu_nums;                // number  of menu item

static volatile MenuConfig menu_config;     // config  of menu display
static volatile uint32_t   refresh_flag;    // menu ui refresh flag

static void (*menu_ui_handler)(MenuConfig *config) = NULL;

/*************************** Menu Config Stack ***************************/

#define MENU_CFG_STACK_SIZE       (MENU_TREE_DEPTH - 1)

static struct {
  MenuConfig stack[MENU_CFG_STACK_SIZE];
  __IO uint8_t sp;
} menu_cfg_stack = {0};

/*************************** Menu Message Queue **************************/

#define MENU_MSG_FIFO_SIZE        (4U)
#define MENU_MSG_FIFO_MASK        (MENU_MSG_FIFO_SIZE - 1)

static struct {
  uint8_t msg_buf[MENU_MSG_FIFO_SIZE];
  __IO uint8_t r;
  __IO uint8_t w;
}menu_msg_fifo = {0};

static inline void fifo_reset(void) {
  menu_msg_fifo.r = menu_msg_fifo.w = 0;
}

static inline uint8_t fifo_used(void) {
  return (menu_msg_fifo.w - menu_msg_fifo.r);
}

static inline int is_fifo_empty(void) {
  return (menu_msg_fifo.w == menu_msg_fifo.r);
}

static inline int is_fifo_full(void) {
  return (fifo_used() == MENU_MSG_FIFO_SIZE);
}

/********************* Private Function Declaration **********************/


static void menu_display_init(MenuNode *_cur_page, uint32_t _item_num);
static void menu_msg_handler(void);
static int  menu_msg_dequeue(uint8_t *_menu_msg);
static int  menu_config_push(void);
static int  menu_config_pop(void);
static MenuNode *find_menu_node(uint32_t target_id);

/************************* Function Definition ***************************/



/**
 * @brief init menu tree
 * 
 * @param menu_list  pointer of menu list  
 * @param menu_nums  number of menu item
 */
void menu_init(MenuList _menu_list, uint32_t _menu_nums, void (*ui_callback)(MenuConfig *)) {
  if (_menu_list == NULL || ui_callback == NULL) return;
  menu_list = _menu_list;
  menu_nums = _menu_nums;
  MenuNode *target;
  for (int i = 0; i < _menu_nums; i++) {
    target = &menu_list[i];
    target->child  = find_menu_node((target->id << 4U) + 1);
    if (target->id) {
      target->left   = find_menu_node(target->id - 1);
      target->right  = find_menu_node(target->id + 1);
    }
    else {
      target->left = target->right = NULL;
    }
  }
  menu_ui_handler = ui_callback;
  menu_display_init(&menu_list[0], MENU_DISP_MAX_ITEMS);
}

/**
 * @brief menu loop function
 * 
 */
void menu_loop(void) {
  menu_msg_handler();
  if (refresh_flag != MENU_REFRESH_NO) {
    menu_ui_handler(&menu_config);
    refresh_flag = MENU_REFRESH_NO;
  }
}

/**
 * @brief init menu display
 * 
 * @param _cur_page current menu page
 * @param _item_num max number of menu item in the display list
 */
static void menu_display_init(MenuNode *_cur_page, uint32_t _item_num) {
  menu_config.item_num = _item_num; 
  menu_config.cur_page = _cur_page;
  menu_config.cur_item = _cur_page->child;
  menu_config.head = menu_config.cur_item;
  menu_config.tail = menu_config.cur_item;
  for (int i = 1; i < _item_num; i++) {
    if (menu_config.tail->right) {
      menu_config.tail = menu_config.tail->right;
    }
    else break;
  }
  refresh_flag = MENU_REFRESH_FULL;
}

/**
 * @brief Handling of message operations
 * 
 */
static void menu_msg_handler(void) {
  int msg;
  if (!menu_msg_dequeue(&msg)) return;

  switch (msg) {

    case MENU_MSG_UP:
      if (menu_config.cur_item->left != NULL) {
        refresh_flag = MENU_REFRESH_FULL;
        if (menu_config.cur_item == menu_config.head) {
          menu_config.head = menu_config.head->left;
          menu_config.tail = menu_config.tail->left;
        }
        menu_config.cur_item = menu_config.cur_item->left;
      }
      break;

    case MENU_MSG_DOWN:
      if (menu_config.cur_item->right != NULL) {
        refresh_flag = MENU_REFRESH_FULL;
        if (menu_config.cur_item == menu_config.tail) {
          menu_config.head = menu_config.head->right;
          menu_config.tail = menu_config.tail->right;
        }
        menu_config.cur_item = menu_config.cur_item->right;
      }
      break;

    case MENU_MSG_ENTER:
      if (menu_config.cur_item->child == NULL) {
        if (menu_config.cur_item->op != NULL) {
          menu_config.cur_item->op(NULL);
        }
      }
      else {
        menu_config_push();
        menu_display_init(menu_config.cur_item, MENU_DISP_MAX_ITEMS);
      }
      break;

    case MENU_MSG_ESC:
      refresh_flag = MENU_REFRESH_FULL;
      menu_config_pop();
      break;
  }
}


/**
 * @brief read message from queue
 * 
 * @param _menu_msg pointer of read buffer 
 * @return int success on 1 | failed on 0
 */
static int menu_msg_dequeue(uint8_t *_menu_msg) {
  if (is_fifo_empty()) return 0;
  *_menu_msg = menu_msg_fifo.msg_buf[menu_msg_fifo.r & MENU_MSG_FIFO_MASK];
  menu_msg_fifo.r++;
  return 1;
}

/**
 * @brief send message to queue
 * 
 * @param _menu_msg menu message
 * @return int success on 1 | failed on 0
 */
int menu_msg_enqueue(uint8_t _menu_msg) {
  if (is_fifo_full()) return 0;
  menu_msg_fifo.msg_buf[menu_msg_fifo.w & MENU_MSG_FIFO_MASK] = _menu_msg;
  menu_msg_fifo.w++;
  return 1;
}


/**
 * @brief push menu display config into stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_config_push(void) {
  if (menu_cfg_stack.sp >= MENU_CFG_STACK_SIZE) return 0;
  memcpy(&menu_cfg_stack.stack[menu_cfg_stack.sp++], &menu_config, sizeof(MenuConfig));
  return 1;
}

/**
 * @brief pop menu display config from stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_config_pop(void) {
  if (!menu_cfg_stack.sp) return 0;
  memcpy(&menu_config, &menu_cfg_stack.stack[--menu_cfg_stack.sp], sizeof(MenuConfig));
  return 1;
}


/**
 * @brief find menu node
 * 
 * @param target_id target menu id
 * @return MenuNode *pointer of menu node
 */
static MenuNode *find_menu_node(uint32_t target_id) {
  for(int i = 1; i < menu_nums; i++) {
    if (menu_list[i].id == target_id) return &menu_list[i];
  }
  return NULL;
}