#include "multi_menu.h"
#include <string.h>

#define MULTI_MENU_SHOW_ITEM      (4U)
#define MULTI_MENU_STACK_SIZE     (5U)  // 

static int (*multi_menu_keyevent)(void) = NULL;
static MenuShowConf menu_show_conf;
static struct {
  MenuShowConf stack[MULTI_MENU_STACK_SIZE];
  uint8_t sp;
} multi_menu_stack = {0};

static void menu_show_conf_push(void) {
  assert(multi_menu_stack.sp < MULTI_MENU_STACK_SIZE);
  memcpy(&multi_menu_stack.stack[multi_menu_stack.sp++], &menu_show_conf, sizeof(MenuShowConf));
}

static void menu_show_conf_pop(MenuShowConf *dst) {
  if (multi_menu_stack.sp == 0) return;
  memcpy(&menu_show_conf, &multi_menu_stack.stack[--multi_menu_stack.sp], sizeof(MenuShowConf));
}


int menu_process(void) {

  int key = multi_menu_keyevent();
  switch (key) {
    case MENU_KEY_UP:
      if (menu_show_conf.cur_item->brother_l != NULL) {
        menu_show_conf.cur_item = menu_show_conf.cur_item->brother_l;
        if (menu_show_conf.cur_item == menu_show_conf.head_item->brother_l) {

        }
      }

  }

  /*
  获取按键事件
  KEY_UP
  -->
  if (cur_item->brother_l != NULL) {
    cur_item = cur_item->brother_l;
    if (cur_item = display_start->brother_l) {
      窗口左移
    }
  }
  KEY_DN
  -->
  if (cur_item->brother_r != NULL) {
    cur_item = cur_item->brother_r;
    if (cur_item = display_end->brother_r) {
      窗口右移
    }
  }
  KEY_STB
  -->
  if (cur_page->child != NULL) {
    置callback标志
    call page_callback;
  }
  else{
    将menu_display 配置压栈
    cur_page = cur_page->child;
    初始化 显示窗口
  }
  KEY_ESC
  -->
  if (cur_page == 0) {
    退出菜单
  }
  else{
    出栈；
    cur_page = cur_page->parent;
    init
  }
  */
}

void menu_init(void) {
  // 初始化菜单树
  /*

  for (MenuPage 数组遍历) {
    Page.parent = Page.id >> 4 除0x10 
    Page.child  = Page.id << 4 + 1 乘0x10 + 1
    Page.brother_l = page.id - 1
    Page.brother_r = page.id + 1
  }

  */


}

MenuPage *pageid_to_pointer(menu_t id) {
  /*
  遍历数组，发现id后return 结构体地址
  */
}

void menu_loop(void) {
  /*

  if (callback_flag == 1) {
    menu
  }


  if (menu_process() != 0) {
    menu_show();
  }

  */
}

void menu_show(void) {
  /*

  if (flag_global_refresh)
    执行全局刷新流程

  else
    更新改变的条项

  */
}