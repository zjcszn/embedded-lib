/*------------------------------------------------------------------------/
/  LPC1100 UART0 control module
/-------------------------------------------------------------------------/
/
/  Copyright (C) 2011, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/-------------------------------------------------------------------------*/

#include "uart.h"


#define UART_BPS 	230400		/* Bit rate */
#define BUFF_SIZE	128			/* Length of Receive/Transmission FIFO */
#define	SYSCLK		36000000	/* sysclk frequency */
#define PCLK		18000000	/* PCLK frequency for the UART module */
#define	DIVADD		5			/* See below */
#define	MULVAL		8
/* PCLK     6/12M 8/16M 9/18M 10/20M 12/24M 12.5/25M 15/30M  */
/* DIVADD     1     1     5      1      1       1       5    */
/* MULVAL    12    12     8     12     12       8       8    */
/* Error[%]  0.15  0.15  0.16   0.15   0.15    0.47    0.16  */

#define	DLVAL		((uint32_t)((double)PCLK / UART_BPS / 16 / (1 + (double)DIVADD / MULVAL)))

static volatile struct {
	uint16_t	ri, wi, ct, act;
	uint8_t		buff[BUFF_SIZE];
} TxBuff, RxBuff;

#if _UART_SIDECHAN
volatile uint8_t UartCmd;
#endif


void UART_IRQHandler (void)
{
	uint8_t iir, d;
	int i, cnt;


	for (;;) {
		iir = U0IIR;			/* Get interrupt ID */
		if (iir & 1) break;		/* Exit if there is no interrupt */
		switch (iir & 7) {
		case 4:			/* Rx FIFO is filled to trigger level or timeout occured */
			i = RxBuff.wi;
			cnt = RxBuff.ct;
			while (U0LSR & 0x01) {		/* Get all data in the Rx FIFO */
				d = U0RBR;
				if (cnt < BUFF_SIZE) {	/* Store data if Rx buffer is not full */
					RxBuff.buff[i++] = d;
					i %= BUFF_SIZE;
					cnt++;
				}
			}
			RxBuff.wi = i;
			RxBuff.ct = cnt;
			break;

		case 2:			/* Tx FIFO gets empty */
			cnt = TxBuff.ct;
			if (cnt) {		/* There is one or more byte to send */
				i = TxBuff.ri;
				for (d = 16; d && cnt; d--, cnt--) {	/* Fill Tx FIFO */
					U0THR = TxBuff.buff[i++];
					i %= BUFF_SIZE;
				}
				TxBuff.ri = i;
				TxBuff.ct = cnt;
			} else {
				TxBuff.act = 0; /* When no data to send, next putc() must trigger Tx sequense */
			}
			break;

		default:		/* Data error or break detected */
			U0LSR;
			U0RBR;
			break;
		}
	}
}



int uart0_test (void)
{
#if _UART_SIDECHAN
	if (UartCmd) return 1;
#endif
	return RxBuff.ct;
}



uint8_t uart0_getc (void)
{
	uint8_t d;
	int i;


	/* Wait while Rx buffer is empty */
	do {
#if _UART_SIDECHAN
		d = UartCmd;
		if (d) {
			UartCmd = 0;
			return d;
		}
#endif
	} while (!RxBuff.ct);

	i = RxBuff.ri;			/* Get a byte from Rx buffer */
	d = RxBuff.buff[i++];
	RxBuff.ri = i % BUFF_SIZE;
	__disable_irq();
	RxBuff.ct--;
	__enable_irq();

	return d;
}



void uart0_putc (
	uint8_t d	/* Data byte to be sent */
)
{
	int i;

	/* Wait for Tx buffer ready */
	while (TxBuff.ct >= BUFF_SIZE) ;

	__disable_irq();
	if (TxBuff.act) {
		i = TxBuff.wi;		/* Put a byte into Tx byffer */
		TxBuff.buff[i++] = d;
		TxBuff.wi = i % BUFF_SIZE;
		TxBuff.ct++;
	} else {
		TxBuff.act = 1;		/* Trigger Tx sequense */
		U0THR = d;
	}
	__enable_irq();
}



void uart0_init (void)
{
	__disable_irq();

	/* Enable UART0 module and set PCLK divider */
	__enable_ahbclk(PCUART);
	UARTCLKDIV = SYSCLK / PCLK;

	/* Initialize UART0 */
	U0LCR = 0x83;			/* Select BRG regs */
	U0DLM = DLVAL / 256;	/* Set BRG dividers */
	U0DLL = DLVAL % 256;
	U0FDR = (MULVAL << 4) | DIVADD;
	U0LCR = 0x03;			/* Set serial format N81 and deselect BRG regs */
	U0FCR = 0x87;			/* Enable FIFO */
	U0TER = 0x80;			/* Enable Tansmission */

	/* Attach UART0 to I/O pad */
	IOCON_PIO1_6 = 0xD1;	/* PIO1_6 - RXD */
	IOCON_PIO1_7 = 0xD1;	/* PIO1_7 - TXD */
	GPIO1DIR |= _BV(7);		/* PIO1_7 - output */

	/* Clear Tx/Rx buffers */
	TxBuff.ri = 0; TxBuff.wi = 0; TxBuff.ct = 0; TxBuff.act = 0;
	RxBuff.ri = 0; RxBuff.wi = 0; RxBuff.ct = 0;

	/* Enable Tx/Rx/Error interrupts */
	U0IER = 0x07;
	__set_irqn_priority(UART_IRQn, 255);
	__enable_irqn(UART_IRQn);
	__enable_irq();
}


