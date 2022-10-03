#include "multi_menu.h"
#include <string.h>

#define MENU_WINDOW_ITEM_NUM      (4U)  // 菜单窗口显示的条项数量
#define MENU_TREE_DEPTH           (3U)  // 菜单树层级 
#define MENU_STACK_SIZE           (MENU_TREE_DEPTH - 1) // 菜单窗口配置信息的堆栈大小

#define CHILD_ID(id)  (((id) << 4U) + 1)

// 菜单按键事件获取函数
static int (*menu_keyevent)(void) = NULL;
// 菜单显示窗口 配置信息
static MenuShowConf menu_show_conf;
static struct {
  MenuShowConf stack[MENU_STACK_SIZE];
  uint8_t sp;
} menu_stack = {0};

static MenuPage menu_list[] = {
  /* Page ID, Page Name, Child, Left, Right, Callback} */
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
static int menu_process(void);
static void menu_show_conf_init(MenuPage *cur_page);


/*********************** 函数定义 ************************/


void menu_keyevent_register(int (*callback)(void)) {
  menu_keyevent = callback;
}

static int menu_process(void) {

  int key = menu_keyevent();
  switch (key) {
    case MENU_KEY_UP:
      if (menu_show_conf.cur_item->left != NULL) {
        if (menu_show_conf.cur_item == menu_show_conf.head_item) {
          menu_show_conf.head_item == menu_show_conf.head_item->left;
          menu_show_conf.tail_item == menu_show_conf.tail_item->left;
        }
        menu_show_conf.cur_item = menu_show_conf.cur_item->left;
      }
      break;

    case MENU_KEY_DOWN:
      if (menu_show_conf.cur_item->right != NULL) {
        if (menu_show_conf.cur_item == menu_show_conf.tail_item) {
          menu_show_conf.head_item == menu_show_conf.head_item->right;
          menu_show_conf.tail_item == menu_show_conf.tail_item->right;
        }
        menu_show_conf.cur_item = menu_show_conf.cur_item->right;
      }
      break;

    case MENU_KEY_ENTER:
      if (menu_show_conf.cur_item->child == NULL) {
        menu_show_conf.cur_item->callback(NULL);
      }
      else {
        menu_show_conf_push();
        menu_show_conf_init(menu_show_conf.cur_item);
      }
      break;

    case MENU_KEY_ESC:
      menu_show_conf_pop();
      break;

    default:
      break;
  }

}

static void menu_show_conf_init(MenuPage *cur_page) {
  menu_show_conf.cur_page  = cur_page;
  menu_show_conf.cur_item  = cur_page->child;
  menu_show_conf.head_item = menu_show_conf.cur_item;
  menu_show_conf.tail_item = menu_show_conf.cur_item;
  for (int i = 1; i < MENU_WINDOW_ITEM_NUM; i++) {
    if (menu_show_conf.tail_item->right != NULL) {
      menu_show_conf.tail_item =  menu_show_conf.tail_item->right;
    }
    else {
      break;
    }
  }
}

void menu_tree_init(MenuPage *page_list, menu_t page_num) {
  MenuPage *target;
  for (int i = 0; i < page_num; i++) {
    target = &page_list[i];    
    target->child  = page_id_to_pointer((target->id << 4U) + 1);
    target->left   = target->id ? page_id_to_pointer(target->id - 1) : NULL;
    target->right  = target->id ? page_id_to_pointer(target->id + 1) : NULL;
  }
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


static void menu_show_conf_push(void) {
  if (menu_stack.sp >= MENU_STACK_SIZE) return;
  memcpy(&menu_stack.stack[menu_stack.sp++], &menu_show_conf, sizeof(MenuShowConf));
}

static void menu_show_conf_pop(void) {
  if (!menu_stack.sp) return;
  memcpy(&menu_show_conf, &menu_stack.stack[--menu_stack.sp], sizeof(MenuShowConf));
}