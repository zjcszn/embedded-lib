#include "multi_menu.h"
#include <string.h>

#define MENU_SHOW_ITEM_NUM        (4U)  // 菜单窗口显示的条项数量
#define MENU_DEPTH                (3U)  // 菜单层级 
#define MENU_STACK_SIZE           (MENU_DEPTH - 1) // multi menu 堆栈大小

// 按键事件获取函数
static int (*menu_keyevent)(void) = NULL;
// 菜单窗口全局配置信息
static MenuShowConf menu_show_conf;
static uint8_t  menu_show_refresh;
static struct {
  MenuShowConf stack[MENU_STACK_SIZE];
  uint8_t sp;
} menu_stack = {0};

static MenuPage menu_list[] = {
  /* 菜单ID, 菜单名, 子菜单指针, 左菜单指针, 右菜单指针, 功能函数指针} */
  {0x00, "Main Menu", NULL, NULL, NULL, NULL},
  {0x01, "Menu 1",    NULL, NULL, NULL, NULL},
  {0x11, "Menu 1_1",  NULL, NULL, NULL, NULL},
  {0x12, "Menu 1_2",  NULL, NULL, NULL, NULL},
  {0x02, "Menu 2",    NULL, NULL, NULL, NULL},
  {0x03, "Menu 3",    NULL, NULL, NULL, NULL},
  {0x04, "Menu 4",    NULL, NULL, NULL, NULL},

};

/********************* 私有函数声明 **********************/

static void menu_show_conf_push(void);
static void menu_show_conf_pop(void);
static int  menu_process(void);
static void menu_show_conf_init(MenuPage *cur_page);
static void menu_show(void);


/*********************** 函数定义 ************************/


void menu_keyevent_register(int (*callback)(void)) {
  menu_keyevent = callback;
}

static int menu_process(void) {
  int key = menu_keyevent();
  switch (key) {
    case MENU_KEY_UP:
      if (menu_show_conf.cur_item->l_sibling != NULL) {
        if (menu_show_conf.cur_item == menu_show_conf.head_item) {
          menu_show_conf.head_item == menu_show_conf.head_item->l_sibling;
          menu_show_conf.tail_item == menu_show_conf.tail_item->l_sibling;
        }
        menu_show_conf.cur_item = menu_show_conf.cur_item->l_sibling;
      }
      break;

    case MENU_KEY_DOWN:
      if (menu_show_conf.cur_item->r_sibling != NULL) {
        if (menu_show_conf.cur_item == menu_show_conf.tail_item) {
          menu_show_conf.head_item == menu_show_conf.head_item->r_sibling;
          menu_show_conf.tail_item == menu_show_conf.tail_item->r_sibling;
        }
        menu_show_conf.cur_item = menu_show_conf.cur_item->r_sibling;
      }
      break;

    case MENU_KEY_ENTER:
      if (menu_show_conf.cur_item->child != NULL) {
        menu_show_conf.cur_item->cb(NULL);
      }
      else {
        menu_show_conf_push();
        menu_show_conf_init(menu_show_conf.cur_item);
      }
      break;

    case MENU_KEY_ESC:
      menu_show_conf_pop();
      /*
      if cur_page.id = 0
      add code to exit menu loop
      */
      break;

    default:
      break;
  }

  return key;
}

static void menu_show_conf_init(MenuPage *dst_page) {
  menu_show_conf.cur_page  = dst_page;
  menu_show_conf.cur_item  = dst_page->child;
  menu_show_conf.head_item = menu_show_conf.cur_item;
  menu_show_conf.tail_item = menu_show_conf.cur_item;
  for (int i = 1; i < MENU_SHOW_ITEM_NUM; i++) {
    if (menu_show_conf.tail_item->r_sibling) {
      menu_show_conf.tail_item =  menu_show_conf.tail_item->r_sibling;
    }
    else break;
  }
}

void menu_init(MenuPage *menu_page_arr, menu_t num) {
  MenuPage *target;
  for (int i = 0; i < num; i++) {
    target = &menu_page_arr[i];    
    target->child  = page_id_to_pointer((target->id << 4U) + 1);
    target->l_sibling  = target->id ? page_id_to_pointer(target->id - 1) : NULL;
    target->r_sibling  = target->id ? page_id_to_pointer(target->id + 1) : NULL;
  }
}

MenuPage *pageid_to_pointer(menu_t id, MenuPage *page_list, menu_t page_num) {
  for (int i = 0; i < page_num; i++) {
    if (page_list[i].id == id) {
      return &page_list[i];
    }  
  }
  return NULL;
}

void menu_loop(void) {
  
  if (menu_process() != 0) {
    menu_show();
  }

}

static void menu_show(void) {
  /*

  if (flag_global_refresh)
    执行全局刷新流程

  else
    更新改变的条项

  */
}


static int menu_show_conf_push(void) {
  if (menu_stack.sp >= MENU_STACK_SIZE) return -1;
  memcpy(&menu_stack.stack[menu_stack.sp++], &menu_show_conf, sizeof(MenuShowConf));
  return 0;
}

static int menu_show_conf_pop(void) {
  if (!menu_stack.sp) return -1;
  memcpy(&menu_show_conf, &menu_stack.stack[--menu_stack.sp], sizeof(MenuShowConf));
  return 0;
}