#ifndef __MULTI_MENU_H__
#define __MULTI_MENU_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/*************************** Macro Definition ***************************/

#ifndef __IO
#define __IO volatile
#endif

#ifndef NULL
#define NULL ((void*)0U)
#endif

/*************************** Type Declaration ***************************/

typedef struct menu_node    MenuNode;
typedef struct menu_node   *MenuList;
typedef struct menu_config  MenuConfig;
typedef void (*MenuUI_Handler)(MenuConfig *);
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

/********************* Extern Function Declaration **********************/

void menu_init(MenuList _menu_list, uint32_t _menu_nums, MenuUI_Handler *ui_callback);
extern void menu_loop(void);
extern int  menu_msg_enqueue(uint8_t _menu_msg);


#ifdef __cplusplus
}
#endif

#endif