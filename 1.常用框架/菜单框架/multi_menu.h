#ifndef __MULTI_MENU_H__
#define __MULTI_MENU_H__

/* 二叉树结构菜单框架 */

#include <stdint.h>

// Menu无符号整型
typedef uint32_t menu_t;
// MenuPage结构体类型
typedef struct _menu_page MenuPage;
// MenuShowConf结构体类型
typedef struct _menu_show_conf  MenuShowConf;
// Menu回调函数
typedef int (*MenuCallback)(void *);

enum ENUM_MENU_KEY {
  MENU_KEY_UP = 1,  // 上移按键
  MENU_KEY_DOWN,    // 下移按键
  MENU_KEY_ENTER,   // 进入按键
  MENU_KEY_ESC,     // 退出按键
  /* 用户自定义 */
};


struct _menu_page {
  menu_t id;              // Page ID
  const char *name;       // Page 名称
  MenuPage   *child;      // 子项指针
  MenuPage   *left;       // 左兄弟指针
  MenuPage   *right;      // 右兄弟指针   
  MenuCallback callback;  // MenuPage回调函数
};

struct _menu_show_conf {
  MenuPage *cur_page;     // 当前菜单页
  MenuPage *cur_item;     // 当前选中子项
  MenuPage *head_item;    // 首显示项
  MenuPage *tail_item;    // 尾显示项
};


#endif