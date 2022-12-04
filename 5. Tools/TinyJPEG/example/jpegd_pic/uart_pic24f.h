#ifndef _COMMFUNC
#define _COMMFUNC

void uart_init (unsigned long bps);
int uart_test (void);
void uart_putc (unsigned char d);
unsigned char uart_getc (void);

#define __kbhit()	uart_test()
#define __getch()	uart_getc()

#endif

