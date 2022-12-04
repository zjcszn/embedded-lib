#ifndef _UART0_DEF
#define _UART0_DEF
#include "LPC1100.h"

#define _UART_SIDECHAN	1


void uart0_init (void);
int uart0_test (void);
void uart0_putc (uint8_t);
uint8_t uart0_getc (void);

#define __kbhit()	uart0_test()
#define __getch()	uart0_getc()


#if _UART_SIDECHAN
extern volatile uint8_t UartCmd;
#endif
#endif

