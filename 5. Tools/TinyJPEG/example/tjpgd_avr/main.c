/*---------------------------------------------------------------*/
/* Petit FAT file system module test program R0.02 (C)ChaN, 2009 */
/*---------------------------------------------------------------*/

#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "diskio.h"
#include "pff.h"
#include "xitoa.h"
#include "disp.h"


/*---------------------------------------------------------*/
/* Work Area                                               */
/*---------------------------------------------------------*/

FATFS Fs;			/* File system object */

char Work[3100];	/* Minimum working buffer for the most JPEG picture */



/*---------------------------------------------------------*/

static
void put_rc (FRESULT rc)
{
	const prog_char *p;
	static const prog_char str[] =
		"OK\0" "DISK_ERR\0" "NOT_READY\0" "NO_FILE\0" "NO_PATH\0"
		"NOT_OPENED\0" "NOT_ENABLED\0" "NO_FILE_SYSTEM\0";
	FRESULT i;

	for (p = str, i = 0; i != rc && pgm_read_byte_near(p); i++) {
		while(pgm_read_byte_near(p++));
	}
	xprintf(PSTR("rc=%u FR_%S\n"), (WORD)rc, p);
}



static
void get_line (char *buff, int len)
{
	BYTE c;
	int i = 0;


	for (;;) {
		c = uart_getc();
		if (c == '\r') break;
		if ((c == '\b') && i) {
			i--;
			uart_putc(c);
			continue;
		}
		if (c >= ' ' && i < len - 1) {	/* Visible chars */
			buff[i++] = c;
			xputc(c);
		}
	}
	buff[i] = 0;
	uart_putc('\n');
}



static
void put_dump (const BYTE *buff, DWORD ofs, int cnt)
{
	BYTE n;


	xitoa(ofs, 16, -8); xputc(' ');
	for(n = 0; n < cnt; n++) {
		xputc(' ');	xitoa(buff[n], 16, -2); 
	}
	xputs(PSTR("  "));
	for(n = 0; n < cnt; n++)
		xputc(((buff[n] < 0x20)||(buff[n] >= 0x7F)) ? '.' : buff[n]);
	xputc('\n');
}



static
void IoInit ()
{
	PORTA = 0b11111111;	// Port A

	PORTB = 0b10110000; // Port B
	DDRB  = 0b11000000;

	PORTC = 0b11111111;	// Port C

	PORTD = 0b00100111; // Port D
	DDRD  = 0b11111000;

	PORTE = 0b11110010; // Port E
	DDRE  = 0b10000010;

	PORTF = 0b11111111;	// Port F

	PORTG = 0b11111; 	// Port G

	uart_init();		// Initialize UART driver

	sei();
}




/*-----------------------------------------------------------------------*/
/* Main                                                                  */


int main (void)
{
	char *ptr;
	long p1, p2;
	BYTE res;
	UINT s1, s2;
	DIR dir;			/* Directory object */
	FILINFO fno;		/* File information */


	IoInit();

	/* Send a message to the console */
	xfunc_out = uart_putc;
	xputs(PSTR("\nTJpgDec/PFF test monitor\n"));

	/* Put a message into the display */
	disp_init();
	xfprintf(disp_putc, PSTR("TJpgDec/PFF"));
	disp_fill(0, 54, 10, 14, C_BLUE);

	for (;;) {
		xputc('>');
		get_line(Work, sizeof Work);
		ptr = Work;

		switch (*ptr++) {

		case 'l' :	/* l <file> - Load a file (.BMP or .JPG) */
			while (*ptr == ' ') ptr++;
			if (strstr_P(ptr, PSTR(".BMP")) || strstr_P(ptr, PSTR(".bmp"))) {
				load_bmp(ptr, Work, 3100);
				break;
			}
			if (strstr_P(ptr, PSTR(".JPG")) || strstr_P(ptr, PSTR(".jpg"))) {
				load_jpg(ptr, Work, 3100);
				break;
			}
			break;

		case 'f' :
			switch (*ptr++) {

			case 'i' :	/* fi - Mount the volume */
				put_rc(pf_mount(&Fs));
				break;

			case 'o' :	/* fo <file> - Open a file */
				while (*ptr == ' ') ptr++;
				put_rc(pf_open(ptr));
				break;

			case 'd' :	/* fd - Read the file 128 bytes and dump it */
				p2 = Fs.fptr;
				res = pf_read(Work, sizeof Work, &s1);
				if (res != FR_OK) { put_rc(res); break; }
				ptr = Work;
				while (s1) {
					s2 = (s1 >= 16) ? 16 : s1;
					s1 -= s2;
					put_dump((BYTE*)ptr, p2, s2);
					ptr += 16; p2 += 16;
				}
				break;

			case 't' :	/* ft - Type the file data via dreadp function */
				do {
					res = pf_read(0, 32768, &s1);
					if (res != FR_OK) { put_rc(res); break; }
				} while (s1 == 32768);
				break;

			case 'e' :	/* fe - Move file pointer of the file */
				if (!xatoi(&ptr, &p1)) break;
				res = pf_lseek(p1);
				put_rc(res);
				if (res == FR_OK)
					xprintf(PSTR("fptr = %lu(0x%lX)\n"), Fs.fptr, Fs.fptr);
				break;

			case 'l' :	/* fl [<path>] - Directory listing */
				while (*ptr == ' ') ptr++;
				res = pf_opendir(&dir, ptr);
				if (res) { put_rc(res); break; }
				s1 = 0;
				for(;;) {
					res = pf_readdir(&dir, &fno);
					if (res != FR_OK) { put_rc(res); break; }
					if (!fno.fname[0]) break;
					if (fno.fattrib & AM_DIR)
						xprintf(PSTR("   <DIR>   %s\n"), fno.fname);
					else
						xprintf(PSTR("%9lu  %s\n"), fno.fsize, fno.fname);
					s1++;
				}
				xprintf(PSTR("%u item(s)\n"), s1);
				break;
			}
			break;
		}
	}

}


