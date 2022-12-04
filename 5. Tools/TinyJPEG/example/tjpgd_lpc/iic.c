/*------------------------------------------------------------------------/
/  LPC1100 I2C master control module
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

#include "iic.h"
#include <string.h>


#define PCLK_I2C	36000000	/* PCLK freqency supplied to I2C module [Hz] */
#define I2C0_RATE	400000		/* Bus freqency [Hz] */


static
volatile I2CCTRL *Ctrl0;	/* Current I2C control structure */



/*------------------------*/
/* Initialize I2C Module  */
/*------------------------*/

void i2c0_init (void)
{
	int n, m;


	IOCON_PIO0_4 = 0x00;	/* Detach I2C module from I/O pad */
	IOCON_PIO0_5 = 0x00;

	/* Bus Reset: Put I2C slaves to idle state */
	GPIO0DIR |= (1<<4);
	GPIO0DIR &= ~(1<<5);
	for (n = 0; n < 10; n++) {
		GPIO0DATA |= (1<<4);	/* SCL=H */
		for (m = 0; m < 100; m++) GPIO0DATA;
		GPIO0DATA &= ~(1<<4);	/* SCL=L*/
		for (m = 0; m < 100; m++) GPIO0DATA;
		if (!(GPIO0DATA & (1<<5))) n = 0;	/* Check if SDA is high for 10 clock time */
	}

	__enable_ahbclk(PCI2C);	/* Enable I2C module */
	PRESETCTRL &= ~(1<<1);	/* Reset I2C module */
	PRESETCTRL |=  (1<<1);
	I2C0CONCLR = 0x6C;		/* Deactivate I2C */

	/* Set master bus speed */
	I2C0SCLH = PCLK_I2C / I2C0_RATE / 2;
	I2C0SCLL = PCLK_I2C / I2C0_RATE / 2;

	__enable_irqn(I2C_IRQn);

	IOCON_PIO0_4 = 0x01;	/* Attach I2C module to I/O pad */
	IOCON_PIO0_5 = 0x01;
}



/*--------------------------*/
/* Start an I2C Transaction */
/*--------------------------*/

int i2c0_start (
	volatile I2CCTRL *ctrl	/* Pointer to the initialized I2C control structure */
)
{
	if (Ctrl0) return 0;	/* Reject if an I2C transaction is in progress */

	Ctrl0 = ctrl;			/* Register the I2C control strucrure as current transaction */
	ctrl->stat = I2C_BUSY;	/* An I2C transaction is in progress */
	I2C0CONSET = 0x60;		/* Set I2EN+STA to generate start condition */

	return 1;
}



/*--------------------------*/
/* Abort I2C Transaction    */
/*--------------------------*/

void i2c0_abort (void)
{
	I2C0CONCLR = 0x6C;	/* Deactivate I2C */
	Ctrl0 = 0;			/* Discard I2C control structure */
}



/*-------------------------*/
/* I2C0 Background Process */
/*-------------------------*/

void I2C_IRQHandler (void)
{
	volatile I2CCTRL *i2c;
	uint8_t res = 0;
	uint16_t rct, n;


	i2c = Ctrl0;
	if (!i2c) {	/* Spurious Interrupt */
		I2C0CONCLR = 0x6C;	/* Disable I2C */
		return;
	}

	switch ((I2C0STAT >> 3) & 0x1F) {
	case 0x01:	/* START condition has been generated */
		I2C0DAT = (i2c->sla << 1);	/* Transmit an SLA+W */
		I2C0CONCLR = 0x28;			/* Clear SI */
		break;

	case 0x03:	/* SLA+W has been transmitted, ACK received */
		I2C0DAT = i2c->cmd[0];	/* Transmit 1st command byte */
		i2c->icmd = 1;
		i2c->ncmd--;
		I2C0CONCLR = 0x28;		/* Clear STA+SI */
		break;

	case 0x04:	/* SLA+W has been transmitted, ACK not received */
		rct = i2c->retry;
		if (rct) {
			I2C0CONSET = 0x30;	/* Generate STOP + START condition */
			i2c->retry = rct - 1;
		} else {
			I2C0CONSET = 0x10;	/* Generate STOP condition */
			res = I2C_TIMEOUT;	/* Retry count over */
		}
		I2C0CONCLR = 0x08;	/* Clear SI */
		break;

	case 0x05:	/* DATA has been transmitted, ACK received */
		n = i2c->ncmd;
		if (n) {	/* There is any command byte to be transmitted */
			i2c->ncmd = --n;
			I2C0DAT = i2c->cmd[i2c->icmd++];	/* Set a command byte to be sent */
		} else {	/* All command byte have been transmitted */
			n = i2c->ndata;
			if (i2c->dir == I2C_WRITE) {
				if (n) {	/* There is any data to write */
					i2c->ndata = --n;
					I2C0DAT = *i2c->data++;	/* Set a data byte to be sent */
				} else {	/* No data to write */
					I2C0CONSET = 0x10;		/* Generate STOP condition */
					res = I2C_SUCCEEDED;	/* Succeeded */
				}
			} else {
				if (n) {	/* There is any data to read */
					I2C0CONSET = 0x20;		/* Generate REPEATED START condition */
				} else {	/* No data to receive */
					I2C0CONSET = 0x10;		/* Generate STOP condition */
					res = I2C_SUCCEEDED;	/* Succeeded */
				}
			}
		}
		I2C0CONCLR = 0x08;		/* Clear SI */
		break;

	case 0x06:	/* DATA has been transmitted, ACK not received */
		I2C0CONSET = 0x10;	/* Generate STOP condition */
		I2C0CONCLR = 0x08;	/* Clear SI */
		res = I2C_ABORTED;	/* Aborted by slave */
		break;

	case 0x02:	/* REPEATED START condition has been generated */
		I2C0DAT = (i2c->sla << 1) | 1;	/* Transmit SLA+R */
		I2C0CONCLR = 0x28;	/* Clear STA+SI */
		break;

	case 0x08:	/* SLA+R has been transmitted, ACK received */
		if (i2c->ndata >= 2) {	/* Two or more bytes to receive */
			I2C0CONSET = 0x04;	/* Set AA */
			I2C0CONCLR = 0x08;	/* Clear SI */
		} else {				/* One byte to receive */
			I2C0CONCLR = 0x0C;	/* Clear SI+AA */
		}
		break;

	case 0x09:	/* SLA+R has been transmitted, ACK not received */
		I2C0CONSET = 0x10;	/* Generate STOP condition */
		I2C0CONCLR = 0x08;	/* Clear SI */
		res = I2C_ABORTED;	/* Aborted by slave */
		break;

	case 0x0A:	/* Data has been received, ACK sent */
		*i2c->data++ = I2C0DAT;	/* Get received DATA */
		n = i2c->ndata - 1;
		if (n >= 2) {	/* Two or more bytes left */
			I2C0CONSET = 0x04;	/* Set AA */
			I2C0CONCLR = 0x08;	/* Clear SI */
		} else {		/* Next is last byte */
			I2C0CONCLR = 0x0C;	/* Clear SI+AA */
		}
		i2c->ndata = n;
		break;

	case 0x0B:	/* DATA has been received, ACK not sent */
		*i2c->data = I2C0DAT;
		I2C0CONSET = 0x10;		/* Generate STOP condition */
		I2C0CONCLR = 0x08;		/* Clear SI */
		res = I2C_SUCCEEDED;	/* Succeeded */
		break;

	case 0x00:	/* Bus error */
	case 0x07:	/* Arbitration lost */
	default:	/* Unknown status */
		I2C0CONCLR = 0x6C;	/* Disable I2C */
		res = I2C_ERROR;	/* Unknown error */

	}

	if (res) {	/* End of I2C transaction? */
		Ctrl0 = 0;			/* Release I2C control structure */
		i2c->stat = res;	/* Set result */
		if (i2c->eotfunc) i2c->eotfunc(res);	/* Notify EOT if call-back function is specified */
	}
}

