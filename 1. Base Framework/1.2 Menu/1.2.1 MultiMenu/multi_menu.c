#include "multi_menu.h"
#include <string.h>
#include "stdio.h"

#define MENU_MAX_ITEMS            (2U)    // max num of display items
#define MENU_DEPTH                (3U)    // menu level 
#define MENU_STACK_SIZE           (MENU_DEPTH - 1) // menu stack size





static MenuList   menu_list;              // pointer of menu list
static uint32_t   menu_count;             // nums of menu item

static volatile MenuConfig menu_display;  // info of menu display
static volatile uint32_t   refresh_flag;   


// menu stack
static struct {
  MenuConfig stack[MENU_STACK_SIZE];
  volatile uint8_t sp;
} menu_stack = {0};

// read key
static uint8_t (*menu_readkey)(void);

// 
static void (*menu_ui_callback)(void);


/********************* private function declaration **********************/

static int  menu_display_push(void);
static int  menu_display_pop(void);
static void menu_display_init(Position cur_page);
static void menu_show(void);
static void menu_display_init(Position cur_menu);

/*********************** function  ************************/



/**
 * @brief init menu tree
 * 
 * @param list       menu list  
 * @param items_num  items num
 * @param readkey_cb pointer of 'menu_readkey' callback function
 */
void menu_init(MenuList list, uint32_t items_num, uint8_t(*readkey_cb)(void)) {
  if (list == NULL || readkey_cb == NULL) return;
  menu_list  = list;
  menu_count = items_num;
  Position target;
  for (int i = 0; i < items_num; i++) {
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
  menu_readkey = readkey_cb;
  menu_display_init(&menu_list[0]);
}

/**
 * @brief init menu display
 * 
 * @param cur_menu current menu page
 */
static void menu_display_init(Position cur_menu) {
  menu_display.cur_menu  = cur_menu;
  menu_display.cur_item  = cur_menu->child;
  menu_display.head = menu_display.cur_item;
  menu_display.tail = menu_display.cur_item;
  for (int i = 1; i < MENU_MAX_ITEMS; i++) {
    if (menu_display.tail->right) {
      menu_display.tail = menu_display.tail->right;
    }
    else break;
  }
  refresh_flag = REFRESH_ALL;
}

/**
 * @brief Handling of key operations
 * 
 * @return int key value
 */
static void menu_process(void) {
  int key_val = menu_readkey();

  if (key_val == MENU_KEY_NULL) {
    refresh_flag = REFRESH_NO;
    return;
  }
  else if (key_val == MENU_KEY_UP) {
    if (menu_display.cur_item->left != NULL) {
      if (menu_display.cur_item == menu_display.head) {
        refresh_flag = REFRESH_ALL;
        menu_display.head = menu_display.head->left;
        menu_display.tail = menu_display.tail->left;
      }
      menu_display.cur_item = menu_display.cur_item->left;
    }
  }
  else if (key_val == MENU_KEY_DOWN) {
    if (menu_display.cur_item->right != NULL) {
      if (menu_display.cur_item == menu_display.tail) {
        refresh_flag = REFRESH_ALL;
        menu_display.head = menu_display.head->right;
        menu_display.tail = menu_display.tail->right;
      }
      menu_display.cur_item = menu_display.cur_item->right;
    }
  }
  else if (key_val == MENU_KEY_ENTER) {
    if (menu_display.cur_item->child == NULL) {
      if (menu_display.cur_item->op != NULL) {
        menu_display.cur_item->op(NULL);
      }
    }
    else {
      menu_display_push();
      menu_display_init(menu_display.cur_item);
    }
  } 
  else if (key_val == MENU_KEY_QUIT) {
    menu_display_pop();
    refresh_flag = REFRESH_ALL;
  }
}

void menu_loop(void) {
  if (refresh_flag != REFRESH_NO) {
    menu_ui_callback();
  }

}


/**
 * @brief push menu display config into stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_display_push(void) {
  if (menu_stack.sp >= MENU_STACK_SIZE) return 0;
  memcpy(&menu_stack.stack[menu_stack.sp++], &menu_display, sizeof(MenuConfig));
  return 1;
}

/**
 * @brief pop menu display config from stack
 * 
 * @return int success on 1 | failed on 0
 */
static int menu_display_pop(void) {
  if (!menu_stack.sp) return 0;
  memcpy(&menu_display, &menu_stack.stack[--menu_stack.sp], sizeof(MenuConfig));
  return 1;
}


/**
 * @brief find menu node
 * 
 * @param target_id target menu id
 * @return Position pointer of menu node
 */
static Position find_menu_node(uint32_t target_id) {
  for(int i = 1; i < menu_count; i++) {
    if (menu_list[i].id == target_id) return &menu_list[i];
  }
  return NULL;
}