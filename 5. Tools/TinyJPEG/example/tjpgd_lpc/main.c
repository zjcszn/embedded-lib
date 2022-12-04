/*------------------------------------------------------------------------/
/  MARY OLED/SD test program                                              /
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

#include <string.h>
#include "LPC1100.h"
#include "iic.h"
#include "xprintf.h"
#include "uart.h"
#include "diskio.h"
#include "ff.h"
#include "rtc.h"
#include "disp.h"
#include "filer.h"

#define F_CPU	36000000

#define _MODE_STANDALONE	1	/* Commanded by 1:Motion/UART, 0:UART only */


FATFS Fatfs;

char Line[64];	/* Console input buffer */
BYTE Buff[4096] __attribute__ ((aligned(4)));

volatile UINT Timer;	/* 1kHz increment timer */



#if _MODE_STANDALONE
/*--------------------------------------------------------------*/
/* MEMS data aacquisition and motion command processing         */
/*--------------------------------------------------------------*/

static
volatile I2CCTRL I2cCtrl;	/* Control structure for I2C transaction */

static
volatile int8_t I2cBuff[8];	/* I2C read/write buffer */


/*------------------------------------------------------*/
/* Call-back function called on end of I2C transaction  */

static
void i2c_eot (
	int stat	/* I2C transaction status */
)
{
	int z;
	static int x, y, cx, cy;
	static uint8_t wc, tm_x, tm_y, tm_z, tm_cnt;


	if (stat != I2C_SUCCEEDED) return;

	z = (int8_t)I2cBuff[6];		/* Get Z-axis value */
	if (tm_z < 255) tm_z++;
	if (tm_z < 80) return;		/* Masking time (200ms) */

	if (z >= 50) {				/* Tapped? (>3.5G) */
		tm_x = tm_y = 0;
		tm_z = 0;
		UartCmd = BTN_OK;
		return;
	}

	x += (int8_t)I2cBuff[2];
	y += (int8_t)I2cBuff[4];
	if (++wc == 8) {	/* Accumulate 8 samples and process it (50 processes/sec) */
		if (tm_cnt < 5) {
			cx = x; cy = y;
			tm_cnt++;
		} else {
			x -= cx; y -= cy;
		}

		if (tm_x < 255) tm_x++;
		if (x >= -16 && x <= 16) {
			tm_x = 20;
		} else {
			if ((x <= -50 && tm_x >= 10) || (x <= -32 && tm_x >= 25)) {
				tm_x = 0;
				UartCmd = BTN_RIGHT;
			}
			if ((x >= 50 && tm_x >= 10) || (x >= 32 && tm_x >= 25)) {
				tm_x = 0;
				UartCmd = BTN_LEFT;
			}
		}

		if (tm_y < 255) tm_y++;
		if (y >= -16 && y <= 16) {
			tm_y = 20;
		} else {
			if ((y <= -50 && tm_y >= 10) || (y <= -32 && tm_y >= 25)) {
				tm_y = 0;
				UartCmd = BTN_UP;
			}
			if ((y >= 50 && tm_y >= 10) || (y >= 32 && tm_y >= 25)) {
				tm_y = 0;
				UartCmd = BTN_DOWN;
			}
		}

		wc = x = y = 0;
	}
}


/*---------------------------------------------*/
/* MEMS data ready interrupt (MEMS INT signal) */

void PIO_1_IRQHandler (void)
{
	GPIO1IC = _BV(9);	/* Clear P1.9 irq */

	if (I2cCtrl.stat) {
		I2cCtrl.sla = 0x1C;
		I2cCtrl.retry = 3;
		I2cCtrl.ncmd = 1; I2cCtrl.cmd[0] = 0xA7;	/* Read register 0x27-2D into I2cBuff */
		I2cCtrl.dir = I2C_READ;
		I2cCtrl.ndata = 7; I2cCtrl.data = (uint8_t*)I2cBuff;
		I2cCtrl.eotfunc = i2c_eot;
		i2c0_start(&I2cCtrl);	/* Initiate to read acceleration data from MEMS */
	}
}


/*-----------------------------------------------*/
/* Start MEMS continuous acc data aacquisition   */

static
void start_mems (void)
{
	int i;
	const uint8_t init[] = { 0xE7, 0x00, 0x04 };

	/* Initialize MEMS sensor (400sps, 8G/fs, XYZ enabled, irq on eoc) */
	for (i = 0; i < 2; i++) {
		I2cCtrl.sla = 0x1C;
		I2cCtrl.retry = 0;
		I2cCtrl.ncmd = 1; I2cCtrl.cmd[0] = 0xA0;
		I2cCtrl.dir = I2C_WRITE;
		I2cCtrl.ndata = 3; I2cCtrl.data = (uint8_t*)init;
		I2cCtrl.eotfunc = i2c_eot;
		i2c0_start(&I2cCtrl);
		while (!I2cCtrl.stat) ;
	}

	PIO_1_IRQHandler();	/* Start conversion loop */
	GPIO1IEV = _BV(9);	/* Select interrupt source (rising edge of P1.9 pin) */
	GPIO1IE = _BV(9);	/* Unmask interrupt of P1.9 pin */
	__enable_irqn(PIO_1_IRQn);	/* Enable PIO1 interrupt */
}
#endif


/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/
/* This is a real time clock service to be called from     */
/* FatFs module. Any valid time must be returned even if   */
/* the system does not support a real time clock.          */
/* This is not required in read-only configuration.        */

DWORD get_fattime (void)
{
	RTC rtc;


	/* Get local time */
	rtc_gettime(&rtc);

	/* Pack date and time into a DWORD variable */
	return	  ((DWORD)(rtc.year - 1980) << 25)
			| ((DWORD)rtc.month << 21)
			| ((DWORD)rtc.mday << 16)
			| ((DWORD)rtc.hour << 11)
			| ((DWORD)rtc.min << 5)
			| ((DWORD)rtc.sec >> 1);
}



/*--------------------------------------------------------------*/
/* 1000Hz interval timer                                         */
/*--------------------------------------------------------------*/

void SysTick_Handler (void)
{
	Timer++;		/* Performance counter */
#if DISP_USE_FILE_LOADER
	TmrFrm += 1000;	/* Increment frame time (disp.c) */
#endif
}



/*--------------------------------------------------------------*/
/* Put FatFs result code                                        */
/*--------------------------------------------------------------*/

static
void put_rc (FRESULT rc)
{
	const char *str =
		"OK\0" "DISK_ERR\0" "INT_ERR\0" "NOT_READY\0" "NO_FILE\0" "NO_PATH\0"
		"INVALID_NAME\0" "DENIED\0" "EXIST\0" "INVALID_OBJECT\0" "WRITE_PROTECTED\0"
		"INVALID_DRIVE\0" "NOT_ENABLED\0" "NO_FILE_SYSTEM\0" "MKFS_ABORTED\0" "TIMEOUT\0"
		"LOCKED\0" "NOT_ENOUGH_CORE\0" "TOO_MANY_OPEN_FILES\0";
	FRESULT i;

	for (i = 0; i != rc && *str; i++) {
		while (*str++) ;
	}
	xprintf("rc=%u FR_%s\n", (UINT)rc, str);
}



/*--------------------------------------------------------------*/
/* Initialization and main processing loop                      */
/*--------------------------------------------------------------*/

int main (void)
{
	long p1, p2;
	char *ptr, *ptr2;
	FRESULT res;
	FATFS *fs;
	FIL fil;
	DIR dir;
	FILINFO fno;
	UINT ofs, s1, s2, cnt;
	RTC rtc;

	/* Enable SysTick timer in interval of 1 ms */
	SYST_RVR = F_CPU / 1000 - 1;
	SYST_CSR = 0x07;

	/* Initialize I2C module */
	i2c0_init();

	/* Initialize UART and attach it to xprintf module for console */
	uart0_init();
	xdev_out(uart0_putc);
	xdev_in(uart0_getc);
	xputs("MARY-MB/OB/SR test monitor\n");

	/* Initialize OLED module */
	disp_init();
	xfprintf(disp_putc, "MARY-MB/OB/SR");

#if _MODE_STANDALONE
	start_mems();	/* Start motion detection */
	f_mount(&Fatfs, "", 0);
	filer(Buff, sizeof Buff);
	GPIO1IE = 0;	/* Stop motion detection (mask MEMS interrupt) */
#endif

	for (;;) {
		xputc('>');
		xgets(Line, sizeof Line);
		ptr = Line;
		switch (*ptr++) {

		case 'F' :
			switch (*ptr++) {
			case 'D' :	/* FD - Start filer */
				filer(Buff, sizeof Buff);
				break;
			case 'L' :	/* FL <file> - Launch file loader */
				while (*ptr == ' ') ptr++;
				load_file(ptr, Buff, sizeof Buff);
				break;
			}
			break;

		case 'd' :
			switch (*ptr++) {

			case 'i' :	/* di - Initialize disk */
				xprintf("rc=%d\n", disk_initialize(0));
				break;

			case 'd' :	/* dd <sector> - Dump secrtor */
				if (!xatoi(&ptr, &p2)) break;
				res = disk_read(0, Buff, p2, 1);
				if (res) { xprintf("rc=%d\n", res); break; }
				xprintf("Sector:%lu\n", p2);
				for (ptr2 = (char*)Buff, ofs = 0; ofs < 0x200; ptr2 += 16, ofs += 16)
					put_dump(ptr2, ofs, 16, DW_CHAR);
				break;
			}
			break;

		case 'f' :
			switch (*ptr++) {
			case 'i' :	/* fi - Initialize logical drive */
				put_rc(f_mount(&Fatfs, "", 0));
				break;

			case 'l' :	/* fl [<path>] - Directory listing */
				while (*ptr == ' ') ptr++;
				res = f_opendir(&dir, ptr);
				if (res) { put_rc(res); break; }
				p1 = s1 = s2 = 0;
				for(;;) {
					res = f_readdir(&dir, &fno);
					if ((res != FR_OK) || !fno.fname[0]) break;
					if (fno.fattrib & AM_DIR) {
						s2++;
					} else {
						s1++; p1 += fno.fsize;
					}
					xprintf("%c%c%c%c%c %u/%02u/%02u %02u:%02u %9lu  %s\n", 
							(fno.fattrib & AM_DIR) ? 'D' : '-',
							(fno.fattrib & AM_RDO) ? 'R' : '-',
							(fno.fattrib & AM_HID) ? 'H' : '-',
							(fno.fattrib & AM_SYS) ? 'S' : '-',
							(fno.fattrib & AM_ARC) ? 'A' : '-',
							(fno.fdate >> 9) + 1980, (fno.fdate >> 5) & 15, fno.fdate & 31,
							(fno.ftime >> 11), (fno.ftime >> 5) & 63,
							fno.fsize, &(fno.fname[0]));
				}
				xprintf("%4u File(s),%10lu bytes\n%4u Dir(s)", s1, p1, s2);
				if (f_getfree(ptr, (DWORD*)&p1, &fs) == FR_OK)
					xprintf(", %10luK bytes free\n", p1 * fs->csize / 2);
				break;

			case 'o' :	/* fo <mode> <file> - Open a file */
				if (!xatoi(&ptr, &p1)) break;
				while (*ptr == ' ') ptr++;
				res = f_open(&fil, ptr, (BYTE)p1);
				put_rc(res);
				break;

			case 'c' :	/* fc - Close a file */
				res = f_close(&fil);
				put_rc(res);
				break;

			case 'e' :	/* fe - Seek file pointer */
				if (!xatoi(&ptr, &p1)) break;
				res = f_lseek(&fil, p1);
				put_rc(res);
				if (res == FR_OK)
					xprintf("fptr = %lu(0x%lX)\n", f_tell(&fil), f_tell(&fil));
				break;

			case 'r' :	/* fr <len> - read file */
				if (!xatoi(&ptr, &p1)) break;
				p2 = 0;
				Timer = 0;
				while (p1) {
					if ((UINT)p1 >= sizeof Buff)	{ cnt = sizeof Buff; p1 -= sizeof Buff; }
					else 			{ cnt = (WORD)p1; p1 = 0; }
					res = f_read(&fil, Buff, cnt, &s2);
					if (res != FR_OK) { put_rc(res); break; }
					p2 += s2;
					if (cnt != s2) break;
				}
				s2 = Timer;
				xprintf("%lu bytes read with %lu kB/sec.\n", p2, p2 / s2);
				break;

			case 'd' :	/* fd <len> - read and dump file from current fp */
				if (!xatoi(&ptr, &p1)) break;
				ofs = f_tell(&fil);
				while (p1) {
					if (p1 >= 16)	{ cnt = 16; p1 -= 16; }
					else 			{ cnt = (WORD)p1; p1 = 0; }
					res = f_read(&fil, Buff, cnt, &cnt);
					if (res != FR_OK) { put_rc(res); break; }
					if (!cnt) break;
					put_dump(Buff, ofs, cnt, DW_CHAR);
					ofs += 16;
				}
				break;

			case 'w' :	/* fw <len> <val> - write file */
				if (!xatoi(&ptr, &p1) || !xatoi(&ptr, &p2)) break;
				for (cnt = 0; cnt < sizeof Buff; Buff[cnt++] = 0) ;
				p2 = 0;
				Timer = 0;
				while (p1) {
					if ((UINT)p1 >= sizeof Buff) { cnt = sizeof Buff; p1 -= sizeof Buff; }
					else { cnt = (WORD)p1; p1 = 0; }
					res = f_write(&fil, Buff, cnt, &s2);
					if (res != FR_OK) { put_rc(res); break; }
					p2 += s2;
					if (cnt != s2) break;
				}
				s2 = Timer;
				xprintf("%lu bytes written with %lu kB/sec.\n", p2, p2 / s2);
				break;

			case 'v' :	/* fv - Truncate file */
				put_rc(f_truncate(&fil));
				break;

			case 'n' :	/* fn <old_name> <new_name> - Change file/dir name */
				while (*ptr == ' ') ptr++;
				ptr2 = strchr(ptr, ' ');
				if (!ptr2) break;
				*ptr2++ = 0;
				while (*ptr2 == ' ') ptr2++;
				put_rc(f_rename(ptr, ptr2));
				break;

			case 'u' :	/* fu <name> - Unlink a file or dir */
				while (*ptr == ' ') ptr++;
				put_rc(f_unlink(ptr));
				break;

			case 'k' :	/* fk <name> - Create a directory */
				while (*ptr == ' ') ptr++;
				put_rc(f_mkdir(ptr));
				break;

			case 'g' :	/* fg <path> - Change current directory */
				while (*ptr == ' ') ptr++;
				put_rc(f_chdir(ptr));
				break;

			case 'q' :	/* fq - Show current dir path */
				res = f_getcwd(Line, sizeof Line);
				if (res)
					put_rc(res);
				else
					xprintf("%s\n", Line);
				break;
			}
			break;

		case 't' :	/* t [<year> <mon> <mday> <hour> <min> <sec>] */
			if (xatoi(&ptr, &p1)) {
				rtc.year = (WORD)p1;
				xatoi(&ptr, &p1); rtc.month = (BYTE)p1;
				xatoi(&ptr, &p1); rtc.mday = (BYTE)p1;
				xatoi(&ptr, &p1); rtc.hour = (BYTE)p1;
				xatoi(&ptr, &p1); rtc.min = (BYTE)p1;
				if (!xatoi(&ptr, &p1)) break;
				rtc.sec = (BYTE)p1;
				rtc_settime(&rtc);
			}
			rtc_gettime(&rtc);
			xprintf("%u/%u/%u %02u:%02u:%02u\n", rtc.year, rtc.month, rtc.mday, rtc.hour, rtc.min, rtc.sec);
			break;

		}


	}
}
