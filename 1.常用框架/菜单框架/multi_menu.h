#ifndef __MULTI_MENU_H__
#define __MULTI_MENU_H__

#include <stdint.h>


typedef uint32_t menu_t;
typedef struct _menu_item MenuPage;
typedef struct _menu_item MenuItem;
typedef struct _menu_show_conf  MenuShowConf;
typedef int (*MenuCallback)(void *);

enum ENUM_MENU_KEY {
  MENU_KEY_UP = 1,  // 上移按键
  MENU_KEY_DOWN,    // 下移按键
  MENU_KEY_ENTER,   // 进入按键
  MENU_KEY_ESC,     // 退出按键
  /* 用户自定义 */
};


struct _menu_item {
  menu_t id;              // Page ID
  const char *name;       // Page 名称
  MenuItem   *child;      // 子菜单项
  MenuItem   *l_sibling;  // 左兄弟菜单项
  MenuItem   *r_sibling;  // 右兄弟菜单项   
  MenuCallback cb;        // 回调函数
};

struct _menu_show_conf {
  MenuPage *cur_page;     // 当前菜单页
  MenuPage *cur_item;     // 当前选中子项
  MenuPage *head_item;    
  MenuPage *tail_item;    
};

void menu_init(MenuPage *page_list, menu_t page_num);

#endif