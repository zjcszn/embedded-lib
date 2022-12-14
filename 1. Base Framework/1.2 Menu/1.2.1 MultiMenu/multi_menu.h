#ifndef __MULTI_MENU_H__
#define __MULTI_MENU_H__

#include <stdint.h>

struct menu_node;
struct menu_disp;
typedef struct menu_node    MenuNode;
typedef struct menu_node   *MenuList;
typedef struct menu_config  MenuConfig;

typedef void (*MenuFunc)(void *);

enum ENUM_MenuRefresh {
  MENU_REFRESH_NO,
  MENU_REFRESH_PART,
  MENU_REFRESH_FULL,
};


enum ENUM_MenuMessage {
  MENU_MSG_NULL,
  MENU_MSG_UP,  
  MENU_MSG_DOWN,    
  MENU_MSG_ENTER,   
  MENU_MSG_ESC,     
};

struct menu_node{
  uint32_t  id;        // menu id
  uint8_t  *text;      // menu text
  MenuFunc  op;        // operate function
  MenuNode *child;     // child item
  MenuNode *left;      // left  item
  MenuNode *right;     // right item
};

struct menu_config{
  MenuNode *cur_page;  // current page
  MenuNode *cur_item;  // current selected item
  MenuNode *head;      // head of display list
  MenuNode *tail;      // tail of display list
  uint32_t  item_num;  // max number of item in the display list       
};

void menu_init(MenuList menu_list, uint32_t num);
void menu_loop(void);
void bsp_menu_task(void * args);
#endif