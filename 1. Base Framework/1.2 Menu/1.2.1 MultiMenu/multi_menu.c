#include "multi_menu.h"
#include <string.h>
#include "stdio.h"

#define MENU_DISP_MAX_ITEMS       (2U)    // max num of display items
#define MENU_DEPTH                (3U)    // menu level 
#define MENU_STACK_SIZE           (MENU_DEPTH - 1) // menu stack size





static MenuList   menu_list;              // pointer of menu list
static uint32_t   menu_nums;             // nums of menu item

static volatile MenuConfig menu_config;  // info of menu display
static volatile uint32_t   refresh_flag;   


// menu stack
static struct {
  MenuConfig stack[MENU_STACK_SIZE];
  volatile uint8_t sp;
} menu_stack = {0};

// read key
static uint8_t (*menu_readkey)(void);

// menu display
static void    (*menu_display)(MenuConfig *);


/********************* Private Function Declaration **********************/

static void menu_display_init(MenuNode *cur_page);
static void menu_key_handler(void);
static void menu_ui_handler(void);
static int  menu_config_push(void);
static int  menu_config_pop(void);

/************************* Function Definition ***************************/



/**
 * @brief init menu tree
 * 
 * @param menu_list  pointer of menu list  
 * @param menu_nums  number of menu item
 */
void menu_init(MenuList _menu_list, uint32_t _menu_nums) {
  if (_menu_list == NULL) return;
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
  menu_display_init(&menu_list[0], MENU_DISP_MAX_ITEMS);
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
  int msg =  menu_msg_dequeue();
  if (msg == MENU_MSG_NULL) return;

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

void menu_loop(void) {
  menu_msg_handler();
  if (refresh_flag != MENU_REFRESH_NO) {
    menu_ui_handler();
    refresh_flag = MENU_REFRESH_NO;
  }
}

static void menu_ui_handler(void) {
    
}


static int menu_msg_dequeue(void) {

}

static int menu_msg_enqueue(void) {

}


/**
 * @brief push menu display config into stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_config_push(void) {
  if (menu_stack.sp >= MENU_STACK_SIZE) return 0;
  memcpy(&menu_stack.stack[menu_stack.sp++], &menu_display, sizeof(MenuConfig));
  return 1;
}

/**
 * @brief pop menu display config from stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_config_pop(void) {
  if (!menu_stack.sp) return 0;
  memcpy(&menu_display, &menu_stack.stack[--menu_stack.sp], sizeof(MenuConfig));
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