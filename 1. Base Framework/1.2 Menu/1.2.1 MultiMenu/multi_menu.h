#ifndef __MULTI_MENU_H__
#define __MULTI_MENU_H__

#include <stdint.h>

struct menu_node;
struct menu_disp;
typedef struct menu_node  MenuNode;
typedef struct menu_node *Position;
typedef struct menu_node *MenuList;
typedef struct menu_disp  MenuConfig;

typedef void (*Callback)(void *);

enum ENUM_RefreshFlag {
  REFRESH_NO,
  REFRESH_PART,
  REFRESH_ALL,
};


enum ENUM_MenuKey {
  MENU_KEY_NULL,
  MENU_KEY_UP,  
  MENU_KEY_DOWN,    
  MENU_KEY_ENTER,   
  MENU_KEY_QUIT,     
};

struct menu_node{
  uint32_t    id;        // menu id
  const char *text;      // menu name
  Callback    op;        // operate function
  Position    child;
  Position    left;
  Position    right;
};

struct menu_disp{
  Position cur_menu;     // current menu page
  Position cur_item;     // current menu item
  Position head;         // display item head
  Position tail;         // display item tail
};

void menu_init(MenuList menu_list, uint32_t num);
void menu_loop(void);
void bsp_menu_task(void * args);
#endif