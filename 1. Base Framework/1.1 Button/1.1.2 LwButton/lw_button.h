#ifndef __LW_BUTTON_H__
#define __LW_BUTTON_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/*********************** hardware layer ***********************/

enum ENUM_HButtonID {
  HBUTTON_KEY0,             
  HBUTTON_KEY1,             
  HBUTTON_KEY2,             
  HBUTTON_WKUP,             
  HBUTTON_COUNT,            
  HBUTTON_NULL,             
};


typedef struct {
  uint8_t filter_cnt;       // filter counter
  uint8_t act_level;        // action level
}HButton_T;

/*********************** software layer ***********************/


enum ENUM_ButtonID {
  BUTTON_KEY0,              
  BUTTON_KEY1,              
  BUTTON_KEY2,              
  BUTTON_WKUP,              
  BUTTON_COMBO1,            
  BUTTON_COMBO2,            
  BUTTON_COUNT,             
};


enum ENUM_ButtonAction {
  BUTTON_ACTION_UP   = 0,   // press up
  BUTTON_ACTION_DOWN = 1,   // press down
  BUTTON_ACTION_BRK  = 2,   // press break
};


enum ENUM_ButtonType {
  BUTTON_TYPE_SINGLE,       
  BUTTON_TYPE_COMBO,        
};


enum ENUM_ButtonFsmState {
  STATE_IDLE,               
  STATE_PRESS_DOWN,         
  STATE_PRESS_BRK,          
  STATE_PRESS_LONG,         
};


typedef struct {
  uint8_t id;               
  uint8_t type;
  uint8_t state;            
  uint8_t hbtn_1; 
  uint8_t hbtn_2; 
  uint8_t ticks;            
}Button_T;



/************************ button event ************************/

enum ENUM_ButtonEvent {
  EVENT_NULL,               
  EVENT_PRESS_DOWN,         
  EVENT_PRESS_UP,           
  EVENT_LONG_PRESS_START,   
  EVENT_LONG_PRESS_HOLD,    
  EVENT_LONG_PRESS_UP,      
};


typedef struct {
  uint8_t button_id;        
  uint8_t button_event;     
}ButtonEvent_T;

/******************* function declaration *********************/

void button_init (uint8_t(*cb)(uint8_t hbtn_id));
void button_poll(void);
int  button_event_read(ButtonEvent_T *buf);

#ifdef __cplusplus
}
#endif

#endif