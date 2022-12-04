/*------------------------------------------------------------------------/
/  MMCv3/SDv1/SDv2 control module for MARY boards     (C)ChaN, 2012
/-------------------------------------------------------------------------/
/
/  Copyright (C) 2012, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/-------------------------------------------------------------------------*/

#include "LPC1100.h"
#include "diskio.h"

#define BOARD_TYPE		2	/* 1:MARY-XB, 2:MARY/104-SR */


/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

/* Port Controls  (Platform dependent) */

#if BOARD_TYPE == 1		/* MARY-XB */
#define CS_LOW()	{ GPIO0MASKED[1<<2] = (0<<2); }	/* uSD CS = L */
#define	CS_HIGH()	{ GPIO0MASKED[1<<2] = (1<<2); }	/* uSD CS = H */
#elif BOARD_TYPE == 2	/* MARY/104-SR */
#define CS_LOW()	{ while (SSP0SR & _BV(2)) SSP0DR; SSP0CR0 = 0x0007; GPIO3MASKED[1<<4] = (0<<4); }	/* Flush FIFO, Set 8-bit mode, uSD CS = L */
#define	CS_HIGH()	{ GPIO3MASKED[1<<4] = (1<<4); }	/* uSD CS = H */
#endif


/* Definitions for MMC/SDC command */
#define CMD0	(0)			/* GO_IDLE_STATE */
#define CMD1	(1)			/* SEND_OP_COND (MMC) */
#define	ACMD41	(0x80+41)	/* SEND_OP_COND (SDC) */
#define CMD8	(8)			/* SEND_IF_COND */
#define CMD9	(9)			/* SEND_CSD */
#define CMD10	(10)		/* SEND_CID */
#define CMD12	(12)		/* STOP_TRANSMISSION */
#define ACMD13	(0x80+13)	/* SD_STATUS (SDC) */
#define CMD16	(16)		/* SET_BLOCKLEN */
#define CMD17	(17)		/* READ_SINGLE_BLOCK */
#define CMD18	(18)		/* READ_MULTIPLE_BLOCK */
#define CMD23	(23)		/* SET_BLOCK_COUNT (MMC) */
#define	ACMD23	(0x80+23)	/* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24	(24)		/* WRITE_BLOCK */
#define CMD25	(25)		/* WRITE_MULTIPLE_BLOCK */
#define CMD55	(55)		/* APP_CMD */
#define CMD58	(58)		/* READ_OCR */


static
DSTATUS Stat = STA_NOINIT;	/* Disk status */

static
BYTE CardType;			/* Card type flags */


/*-----------------------------------------------------------------------*/
/* Power Control  (Platform dependent)                                   */
/*-----------------------------------------------------------------------*/


static
void power_on (void)
{
#if BOARD_TYPE == 1
	GPIO0DIR |= _BV(2);		/* CS# (P0_2) = output */
#elif BOARD_TYPE == 2
	GPIO3DIR |= _BV(4);		/* CS# (P3_4) = output */
#endif
	CS_HIGH();

	/* Initialize SPI0 module and attach it to the I/O pad */
	__enable_ahbclk(PCSSP0);
	PRESETCTRL &= ~_BV(0);	/* Set SSP0 reset */
	PRESETCTRL |= _BV(0);	/* Release SSP0 reset */
	SSP0CLKDIV = 1;			/* PCLK = sysclk */
	SSP0CPSR = 0x02;		/* fc=PCLK/2 */
	SSP0CR0 = 0x0007;		/* Mode-0, 8-bit */
	SSP0CR1 = 0x02;			/* Enable SPI */
	IOCON_SCK_LOC = 0x02;	/* SCK0 location = PIO0_6 */
	IOCON_PIO0_6 = 0x02;	/* SCK0 */
	IOCON_PIO0_9 = 0x01;	/* MOSI0 */
	IOCON_PIO0_8 = 0x11;	/* MISO0/pull-up */
}



/*-----------------------------------------------------------------------*/
/* Transmit/Receive a byte to MMC via SPI  (Platform dependent)          */
/*-----------------------------------------------------------------------*/

static
BYTE xchg_spi (BYTE d)
{
	SSP0DR = d;		/* Start an SPI transaction */
	while (!(SSP0SR & _BV(2))) ;	/* Wait for the end of transaction */
	return SSP0DR;	/* Return received byte */
}


/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (void)	/* 1:OK, 0:Timeout */
{
	BYTE d;
	long tmr = 200000;

	do
		d = xchg_spi(0xFF);
	while (d != 0xFF && --tmr);	/* Wait for card goes ready or timeout */

	return d == 0xFF ? 1 : 0;
}



/*-----------------------------------------------------------------------*/
/* Deselect the card and release SPI bus                                 */
/*-----------------------------------------------------------------------*/

static
void deselect (void)
{
	CS_HIGH();
	xchg_spi(0xFF);	/* Dummy clock (force DO hi-z for multiple slave SPI) */
}



/*-----------------------------------------------------------------------*/
/* Select the card and wait for ready                                    */
/*-----------------------------------------------------------------------*/

static
int select (void)	/* 1:Successful, 0:Timeout */
{
	CS_LOW();
	xchg_spi(0xFF);	/* Dummy clock (force DO enabled) */

	if (wait_ready()) return 1;	/* OK */
	deselect();
	return 0;	/* Timeout */
}



/*-----------------------------------------------------------------------*/
/* Receive a data packet from MMC (Platform dependent)                   */
/*-----------------------------------------------------------------------*/

static
int rcvr_datablock (
	BYTE *buff,			/* Data buffer to store received data block */
	UINT btr			/* Block size (16, 64 or 512) */
)
{
	BYTE token;
	WORD w;
	long tmr = 200000;
	int n;


	do {							/* Wait for data packet in timeout of 200ms */
		token = xchg_spi(0xFF);
	} while ((token == 0xFF) && --tmr);
	if(token != 0xFE) return 0;		/* If not valid data token, retutn with error */

	SSP0CR0 = 0x000F;				/* Select 16-bit mode */

	for (n = 0; n < 8; n++)			/* Push 8 frames into pipeline  */
		SSP0DR = 0xFFFF;
	btr -= 16;
	while (btr) {					/* Receive the data block into buffer */
		while (!(SSP0SR & _BV(2))) ;
		w = SSP0DR; SSP0DR = 0xFFFF;
		*buff++ = w >> 8; *buff++ = w;
		while (!(SSP0SR & _BV(2))) ;
		w = SSP0DR; SSP0DR = 0xFFFF;
		*buff++ = w >> 8; *buff++ = w;
		btr -= 4;
	}
	for (n = 0; n < 8; n++) {		/* Pop remaining frames from pipeline */
		while (!(SSP0SR & _BV(2))) ;
		w = SSP0DR;
		*buff++ = w >> 8; *buff++ = w;
	}
	SSP0DR = 0xFFFF;				/* Discard CRC */
	while (!(SSP0SR & _BV(2))) ;
	SSP0DR;

	SSP0CR0 = 0x0007;				/* Select 8-bit mode */

	return 1;						/* Return with success */
}



/*-----------------------------------------------------------------------*/
/* Send a data packet to MMC (Platform dependent)                        */
/*-----------------------------------------------------------------------*/

static
int xmit_datablock (
	const BYTE *buff,	/* 512 byte data block to be transmitted */
	BYTE token			/* Data/Stop token */
)
{
	BYTE resp;
	WORD w;
	UINT wc;


	if (!wait_ready()) return 0;

	xchg_spi(token);				/* Xmit data token */
	if (token != 0xFD) {		/* Is data token */

		SSP0CR0 = 0x000F;				/* Select 16-bit mode */

		for (wc = 0; wc < 8; wc++) {	/* Push 8 frames into pipeline */
			w = *buff++; w = (w << 8) | *buff++;
			SSP0DR = w;
		}
		wc = 512 - 16;
		do {							/* Transmit data block */
			w = *buff++; w = (w << 8) | *buff++;
			while (!(SSP0SR & _BV(2))) ;
			SSP0DR; SSP0DR = w;
			w = *buff++; w = (w << 8) | *buff++;
			while (!(SSP0SR & _BV(2))) ;
			SSP0DR; SSP0DR = w;
		} while (wc -= 4);
		for (wc = 0; wc < 8; wc++) {	/* Pop remaining frames from pipeline */
			while (!(SSP0SR & _BV(2))) ;
			SSP0DR;
		}
		SSP0DR = 0xFFFF;				/* CRC (dummy) */
		while (!(SSP0SR & _BV(2))) ;
		SSP0DR;

		SSP0CR0 = 0x0007;				/* Select 8-bit mode */

		resp = xchg_spi(0xFF);			/* Reveive data response */
		if ((resp & 0x1F) != 0x05)		/* If not accepted, return with error */
			return 0;
	}

	return 1;
}



/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static
BYTE send_cmd (		/* Returns R1 resp (bit7==1:Send failed) */
	BYTE cmd,		/* Command index */
	DWORD arg		/* Argument */
)
{
	BYTE n, res;


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
		cmd &= 0x7F;
		res = send_cmd(CMD55, 0);
		if (res > 1) return res;
	}

	/* Select the card and wait for ready except to stop multiple block read */
	if (cmd != CMD12) {
		deselect();
		if (!select()) return 0xFF;
	}

	/* Send command packet */
	xchg_spi(0x40 | cmd);				/* Start + Command index */
	xchg_spi((BYTE)(arg >> 24));		/* Argument[31..24] */
	xchg_spi((BYTE)(arg >> 16));		/* Argument[23..16] */
	xchg_spi((BYTE)(arg >> 8));			/* Argument[15..8] */
	xchg_spi((BYTE)arg);				/* Argument[7..0] */
	n = 0x01;							/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;			/* Valid CRC for CMD0(0) */
	if (cmd == CMD8) n = 0x87;			/* Valid CRC for CMD8(0x1AA) */
	xchg_spi(n);

	/* Receive command response */
	if (cmd == CMD12) xchg_spi(0xFF);	/* Skip a stuff byte when stop reading */
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do
		res = xchg_spi(0xFF);
	while ((res & 0x80) && --n);

	return res;			/* Return with the response value */
}



/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE drv		/* Physical drive nmuber (0) */
)
{
	BYTE n, cmd, ty, ocr[4];
	long tmr;


	if (drv) return STA_NOINIT;			/* Supports only single drive */
	if (Stat & STA_NODISK) return Stat;	/* No card in the socket */

	power_on();							/* Force socket power on */
	for (n = 10; n; n--) xchg_spi(0xFF); /* 80 dummy clocks */

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {			/* Enter Idle state */
		tmr = 10000;
		if (send_cmd(CMD8, 0x1AA) == 1) {	/* SDv2? */
			for (n = 0; n < 4; n++) ocr[n] = xchg_spi(0xFF);	/* Get trailing return value of R7 resp */
			if (ocr[2] == 0x01 && ocr[3] == 0xAA) {				/* The card can work at vdd range of 2.7-3.6V */
				while (--tmr && send_cmd(ACMD41, 1UL << 30));	/* Wait for leaving idle state (ACMD41 with HCS bit) */
				if (tmr && send_cmd(CMD58, 0) == 0) {			/* Check CCS bit in the OCR */
					for (n = 0; n < 4; n++) ocr[n] = xchg_spi(0xFF);
					ty = (ocr[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2;	/* SDv2 */
				}
			}
		} else {							/* SDv1 or MMCv3 */
			if (send_cmd(ACMD41, 0) <= 1) {
				ty = CT_SD1; cmd = ACMD41;	/* SDv1 */
			} else {
				ty = CT_MMC; cmd = CMD1;	/* MMCv3 */
			}
			while (tmr && send_cmd(cmd, 0));		/* Wait for leaving idle state */
			if (!tmr || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
				ty = 0;
		}
	}
	CardType = ty;
	deselect();

	if (ty) {			/* Initialization succeded */
		Stat &= ~STA_NOINIT;
	} else {			/* Initialization failed */
		Stat |= STA_NOINIT;
	}

	return Stat;
}



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE drv		/* Physical drive nmuber (0) */
)
{
	int n;
	DSTATUS st;


	if (drv) return STA_NOINIT;		/* Supports only single drive */

	st = Stat;
	if (!(st & STA_NOINIT)) {
		if (send_cmd(CMD58, 0))		/* Check if the card is kept initialized */
			st = STA_NOINIT;
		for (n = 0; n < 4; n++) xchg_spi(0xFF);
		CS_HIGH();
	}
	Stat = st;

	return st;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE drv,			/* Physical drive nmuber (0) */
	BYTE *buff,			/* Pointer to the data buffer to store read data */
	DWORD sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..255) */
)
{
	BYTE cmd;


	if (drv || !count) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;
	if (!(CardType & CT_BLOCK)) sector *= 512;	/* Convert to byte address if needed */

	cmd = count > 1 ? CMD18 : CMD17;			/*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
	if (send_cmd(cmd, sector) == 0) {
		do {
			if (!rcvr_datablock(buff, 512)) break;
			buff += 512;
		} while (--count);
		if (cmd == CMD18) send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

DRESULT disk_write (
	BYTE drv,			/* Physical drive nmuber (0) */
	const BYTE *buff,	/* Pointer to the data to be written */
	DWORD sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..255) */
)
{
	if (drv || !count) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;

	if (!(CardType & CT_BLOCK)) sector *= 512;	/* Convert to byte address if needed */

	if (count == 1) {	/* Single block write */
		if ((send_cmd(CMD24, sector) == 0)	/* WRITE_BLOCK */
			&& xmit_datablock(buff, 0xFE))
			count = 0;
	}
	else {				/* Multiple block write */
		if (CardType & CT_SDC) send_cmd(ACMD23, count);
		if (send_cmd(CMD25, sector) == 0) {	/* WRITE_MULTIPLE_BLOCK */
			do {
				if (!xmit_datablock(buff, 0xFC)) break;
				buff += 512;
			} while (--count);
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
				count = 1;
		}
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
	BYTE drv,		/* Physical drive nmuber (0) */
	BYTE ctrl,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT res;
	BYTE n, csd[16];
	DWORD csize;


	if (drv) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;

	res = RES_ERROR;

	switch (ctrl) {
	case CTRL_SYNC :		/* Finalize internal write process of the card */
		if (select()) res = RES_OK;
		break;

	case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
		if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
			if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
				csize = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
				*(DWORD*)buff = csize << 10;
			} else {					/* SDC ver 1.XX or MMC ver 3 */
				n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
				csize = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
				*(DWORD*)buff = csize << (n - 9);
			}
			res = RES_OK;
		}
		break;

	default:
		res = RES_PARERR;
	}

	return res;
}


