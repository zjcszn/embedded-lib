/*------------------------------------------------------------------------/
/  MARYEX-OB OLED display control module
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

#include "disp.h"
#include "xitoa.h"
#include "uart.h"


#define POWER_LOW()		PORTD &= ~_BV(3)
#define POWER_HIGH()	PORTD |= _BV(3)
#define RES_LOW()	PORTD &= ~_BV(4)
#define RES_HIGH()	PORTD |= _BV(4)
#define CS_LOW()	PORTD &= ~_BV(5)
#define CS_HIGH()	PORTD |= _BV(5)

#define	CMD_WR(d)	send_cmd(d);	/* Write a command byte to the OLED */
#define	DATA_WRB(d)	send_data(d);	/* Write a data byte to the OLED */
#define	DATA_WPX(d)	{ send_data(d >> 8); send_data(d); }	/* Write a pixel to the OLED */


static int MaskT, MaskL, MaskR, MaskB;	/* Active drawing area */
static int LocX, LocY;				/* Current dot position */
static uint32_t ChrColor;			/* Current character color ((bg << 16) + fg) */
static const prog_uint8_t *FontS;	/* Current font (ANK) */

/* Import a FONTX2 file as byte array */
IMPORT_BIN(".progmem", "mplfont/MPLHN10X.FNT", Font5x10);	/* const prog_uint8_t Font5x10[] */



/*-----------------------------------------------------*/
/* Send a command/data to the OLED module              */
/*-----------------------------------------------------*/


void __attribute__ ((noinline, naked)) send_cmd (
	BYTE d
)
{
	d = d;
	asm (
		"in r31, 0x12\n"
		"andi r31, 0x3F\n"
		"out 0x12, r31\n"	// '0' indicates the frame is a command
		"sbi 0x12, 7\n"

		"bst r24, 7\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D7
		"sbi 0x12, 7\n"

		"bst r24, 6\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D6
		"sbi 0x12, 7\n"

		"bst r24, 5\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D5
		"sbi 0x12, 7\n"

		"bst r24, 4\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D4
		"sbi 0x12, 7\n"

		"bst r24, 3\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D3
		"sbi 0x12, 7\n"

		"bst r24, 2\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D2
		"sbi 0x12, 7\n"

		"bst r24, 1\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D1
		"sbi 0x12, 7\n"

		"bst r24, 0\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D0
		"sbi 0x12, 7\n"

		"ret\n"
	);
}



void __attribute__ ((noinline, naked)) send_data (
	BYTE d
)
{
	d = d;
	asm (
		"in r31, 0x12\n"
		"andi r31, 0x7F\n"
		"ori r31, 0x40\n"
		"out 0x12, r31\n"	// '1' indicates the frame is a data
		"sbi 0x12, 7\n"

		"bst r24, 7\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D7
		"sbi 0x12, 7\n"

		"bst r24, 6\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D6
		"sbi 0x12, 7\n"

		"bst r24, 5\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D5
		"sbi 0x12, 7\n"

		"bst r24, 4\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D4
		"sbi 0x12, 7\n"

		"bst r24, 3\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D3
		"sbi 0x12, 7\n"

		"bst r24, 2\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D2
		"sbi 0x12, 7\n"

		"bst r24, 1\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D1
		"sbi 0x12, 7\n"

		"bst r24, 0\n"
		"bld r31, 6\n"
		"out 0x12, r31\n"	// D0
		"sbi 0x12, 7\n"

		"ret\n"
	);
}



/*-----------------------------------------------------*/
/* Set rectangular area to be transferred              */
/*-----------------------------------------------------*/

static
void disp_setrect (
	int left,		/* Left end (0 to 127) */
	int right,		/* Right end (0 to 127, >= left) */
	int top,		/* Top end (0 to 127) */
	int bottom		/* Bottom end (0 to 127, >= top) */
)
{
	CMD_WR(0x15);	/* Set H range */
	DATA_WRB(left); DATA_WRB(right);

	CMD_WR(0x75);	/* Set V range */
	DATA_WRB(top); DATA_WRB(bottom); 

	CMD_WR(0x5C);	/* Ready to receive pixel data */
}



/*-----------------------------------------------------*/
/* Initialize display module                           */
/*-----------------------------------------------------*/

void disp_init (void)
{
	static const prog_uint8_t initdata[] = {	/* UG-2828GDEDF11 initialization data */
		1, 0xA4,		/* All OFF */
		2, 0xFD, 0x12,	/* Unlock command */
		2, 0xFD, 0xB1,	/* Unlock command */
		1, 0xAE,		/* Sleep mode ON */
		2, 0xB3, 0xE1,	/* Freeuqncy = 0xE, Divider = 0x1 */
		2, 0xCA, 0x7F,	/* Mux ratio = 127 */
		2, 0xA2, 0x00,	/* Display offset = 0 */
		2, 0xA1, 0x00,	/* Display start line = 0 */
		2, 0xA0, 0x74,	/* 65k color, COM split, Reverse scan, Color seq = C-B-A */
		2, 0xB5, 0x00,	/* GPIO0,1 disabled */
		2, 0xAB, 0x01,	/* Enable internal regurator */
		4, 0xB4, 0xA0, 0xB5, 0x55,	/* External VSL */
		4, 0xC1, 0xC8, 0x98, 0xC8,	/* Contrast for A, B, C */
		2, 0xC7, 0x0A,	/* Master contrast = 10 */
		64, 0xB8, 1, 2, 2, 3, 4, 4, 5, 6, 7, 9, 10, 11, 13, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 37, 39, 42, 44, 47, 50, 53, 56, 59, 62, 65, 68, 71, 75, 78, 82, 85, 89, 93, 96, 100, 104, 108, 112, 116, 121, 125, 129, 134, 138, 143, 147, 152, 156, 161, 166, 171, 176, 181,  /* Gamma 1.6 */
		2, 0xB1, 0x32,	/* OLED driving phase length */
		4, 0xB2, 0xA4, 0x00, 0x00,
		2, 0xBB, 0x17,	/* Pre-charge voltage */
		2, 0xB6, 0x01,	/* 2nd pre-charge period */
		2, 0xBE, 0x05,	/* COM deselect voltage */
		1, 0xA6,		/* Reset to normal display */
		0
	};
	int n;
	const prog_uint8_t *p;
	uint8_t cl, d;


	/* Reset OLED module */
	CS_HIGH();			/* CS# = H */
	RES_LOW();			/* RES# = L */
	for (n = 0; n < 30000; n++) PINB;
	RES_HIGH();			/* RES# = H */
	for (n = 0; n < 3000; n++)  PINB;

	/* Send initialization parameters */
	p = initdata;
	while ((cl = pgm_read_byte(p++)) != 0) {
		CS_LOW();
		d = pgm_read_byte(p++);
		CMD_WR(d); cl--;
		while (cl--) {
			d = pgm_read_byte(p++);
			DATA_WRB(d);
		}
		CS_HIGH();
	}

	/* Clear screen and Display ON */
	disp_mask(0, DISP_XS - 1, 0, DISP_YS - 1);
	disp_fill(0, DISP_XS - 1, 0, DISP_YS - 1, C_BLACK);
	CS_LOW();
	CMD_WR(0xAF);
	CS_HIGH();

	POWER_HIGH();			/* OLED_POWER = H */

	disp_font_face(Font5x10);	/* Select font */
	disp_font_color(C_WHITE);
}



/*-----------------------------------------------------*/
/* Set active drawing area                             */
/*-----------------------------------------------------*/
/* The mask feature affects only disp_fill, disp_box,  */
/* disp_pset, disp_lineto and disp_blt function        */

void disp_mask (
	int left,		/* Left end of active window (0 to DISP_XS-1) */
	int right,		/* Right end of active window (0 to DISP_XS-1, >=left) */
	int top,		/* Top end of active window (0 to DISP_YS-1) */
	int bottom		/* Bottom end of active window (0 to DISP_YS-1, >=top) */
)
{
	if (left >= 0 && right < DISP_XS && left <= right && top >= 0 && bottom < DISP_XS && top <= bottom) {
		MaskL = left;
		MaskR = right;
		MaskT = top;
		MaskB = bottom;
	}
}



/*-----------------------------------------------------*/
/* Draw a solid rectangular                            */
/*-----------------------------------------------------*/

void disp_fill (
	int left,		/* Left end (-32768 to 32767) */
	int right,		/* Right end (-32768 to 32767, >=left) */
	int top,		/* Top end (-32768 to 32767) */
	int bottom,		/* Bottom end (-32768 to 32767, >=top) */
	uint16_t color	/* Box color */
)
{
	uint32_t n;


	if (left > right || top > bottom) return; 	/* Check varidity */
	if (left > MaskR || right < MaskL  || top > MaskB || bottom < MaskT) return;	/* Check if in active area */

	if (top < MaskT) top = MaskT;		/* Clip top of rectangular if it is out of active area */
	if (bottom > MaskB) bottom = MaskB;	/* Clip bottom of rectangular if it is out of active area */
	if (left < MaskL) left = MaskL;		/* Clip left of rectangular if it is out of active area */
	if (right > MaskR) right = MaskR;	/* Clip right of rectangular if it is out of active area */

	CS_LOW();	/* Select display module */
	disp_setrect(left, right, top, bottom);
	n = (uint32_t)(right - left + 1) * (uint32_t)(bottom - top + 1);
	do { DATA_WPX(color); } while (--n);
	CS_HIGH();	/* Deselect display module */
}



/*-----------------------------------------------------*/
/* Draw a hollow rectangular                           */
/*-----------------------------------------------------*/

void disp_box (
	int left,		/* Left end (-32768 to 32767) */
	int right,		/* Right end (-32768 to 32767, >=left) */
	int top,		/* Top end (-32768 to 32767) */
	int bottom,		/* Bottom end (-32768 to 32767, >=top) */
	uint16_t color	/* Box color */
)
{
	disp_fill(left, left, top, bottom, color);
	disp_fill(right, right, top, bottom, color);
	disp_fill(left, right, top, top, color);
	disp_fill(left, right, bottom, bottom, color);
}



/*-----------------------------------------------------*/
/* Draw a dot                                          */
/*-----------------------------------------------------*/

void disp_pset (
	int x,		/* X position (-32768 to 32767) */
	int y,		/* Y position (-32768 to 32767) */
	uint16_t color	/* Pixel color */
)
{
	if (x >= MaskL && x <= MaskR && y >= MaskT && y <= MaskB) {
		CS_LOW();			/* Select display module */
		CMD_WR(0x15);		/* Set H position */
		DATA_WRB(x); DATA_WRB(x);
		CMD_WR(0x75);		/* Set V position */
		DATA_WRB(y); DATA_WRB(y); 
		CMD_WR(0x5C);		/* Put a pixel */
		DATA_WPX(color);
		CS_HIGH();			/* Deselect display module */
	}
}



/*-----------------------------------------------------*/
/* Set current dot position for disp_lineto            */
/*-----------------------------------------------------*/

void disp_moveto (
	int x,		/* X position (-32768 to 32767) */
	int y		/* Y position (-32768 to 32767) */
)
{
	LocX = x;
	LocY = y;
}



/*-----------------------------------------------------*/
/* Draw a line from current position                   */
/*-----------------------------------------------------*/

void disp_lineto (
	int x,		/* X position for the line to (-32768 to 32767) */
	int y,		/* Y position for the line to (-32768 to 32767) */
	uint16_t col	/* Line color */
)
{
	int32_t xr, yr, xd, yd;
	int ctr;


	xd = x - LocX; xr = (int32_t)LocX << 16; LocX = x;
	yd = y - LocY; yr = (int32_t)LocY << 16; LocY = y;

	if ((xd < 0 ? 0 - xd : xd) >= (yd < 0 ? 0 - yd : yd)) {
		ctr = (xd < 0 ? 0 - xd : xd) + 1;
		yd = (yd << 16) / (xd < 0 ? 0 - xd : xd);
		xd = (uint32_t)(xd < 0 ? -1 : 1) << 16;
	} else {
		ctr = (yd < 0 ? 0 - yd : yd) + 1;
		xd = (xd << 16) / (yd < 0 ? 0 - yd : yd);
		yd = (uint32_t)(yd < 0 ? -1 : 1) << 16;
	}
	xr += (int32_t)1 << 15;
	yr += (int32_t)1 << 15;
	do {
		disp_pset(xr >> 16, yr >> 16, col);
		xr += xd; yr += yd;
	} while (--ctr);

}



/*-----------------------------------------------------*/
/* Copy image data to the display                      */
/*-----------------------------------------------------*/

void disp_blt (
	int left,		/* Left end (-32768 to 32767) */
	int right,		/* Right end (-32768 to 32767, >=left) */
	int top,		/* Top end (-32768 to 32767) */
	int bottom,		/* Bottom end (-32768 to 32767, >=right) */
	const uint16_t *pat	/* Pattern data */
)
{
	int yc, xc, xl, xs;
	uint16_t pd;


	if (left > right || top > bottom) return; 	/* Check varidity */
	if (left > MaskR || right < MaskL  || top > MaskB || bottom < MaskT) return;	/* Check if in active area */

	yc = bottom - top + 1;			/* Vertical size */
	xc = right - left + 1; xs = 0;	/* Horizontal size and skip */

	if (top < MaskT) {		/* Clip top of source image if it is out of active area */
		pat += xc * (MaskT - top);
		yc -= MaskT - top;
		top = MaskT;
	}
	if (bottom > MaskB) {	/* Clip bottom of source image if it is out of active area */
		yc -= bottom - MaskB;
		bottom = MaskB;
	}
	if (left < MaskL) {		/* Clip left of source image if it is out of active area */
		pat += MaskL - left;
		xc -= MaskL - left;
		xs += MaskL - left;
		left = MaskL;
	}
	if (right > MaskR) {	/* Clip right of source image it is out of active area */
		xc -= right - MaskR;
		xs += right - MaskR;
		right = MaskR;
	}

	CS_LOW();	/* Select display module */
	disp_setrect(left, right, top, bottom);	/* Set rectangular area to fill */
	do {	/* Send image data */
		xl = xc;
		do {
			pd = *pat++;
			DATA_WPX(pd);
		} while (--xl);
		pat += xs;
	} while (--yc);
	CS_HIGH();	/* Deselect display module */
}



/*-----------------------------------------------------*/
/* Set current character position for disp_putc        */
/*-----------------------------------------------------*/

void disp_locate (
	int col,	/* Column position */
	int row		/* Row position */
)
{
	if (FontS) {	/* Pixel position is calcurated with size of single byte font */
		LocX = col * pgm_read_byte(&FontS[14]);
		LocY = row * pgm_read_byte(&FontS[15]);
	}
}



/*-----------------------------------------------------*/
/* Register text font                                  */
/*-----------------------------------------------------*/

void disp_font_face (
	const uint8_t *font	/* Pointer to the font structure in FONTX2 format */
)
{
	FontS = font;
}



/*-----------------------------------------------------*/
/* Set current text color                              */
/*-----------------------------------------------------*/

void disp_font_color (
	uint32_t color	/* (bg << 16) + fg */
)
{
	ChrColor = color;
}



/*-----------------------------------------------------*/
/* Put a text character                                */
/*-----------------------------------------------------*/

void disp_putc (
	uint8_t chr		/* Character to be output (kanji chars are given in two disp_putc sequence) */
)
{
	const prog_uint8_t *fnt;
	uint8_t b, d;
	uint16_t dchr;
	uint32_t col;
	int h, wc, w, wb, i, fofs;


	if ((fnt = FontS) == 0) return;	/* Exit if no font registerd */

	if (chr < 0x20) {	/* Processes the control character */
		switch (chr) {
		case '\n':	/* LF */
			LocY += pgm_read_byte(&fnt[15]);
			/* FALLTHROUGH */
		case '\r':	/* CR */
			LocX = 0;
			return;
		case '\b':	/* BS */
			LocX -= pgm_read_byte(&fnt[14]);
			if (LocX < 0) LocX = 0;
			return;
		case '\f':	/* FF */
			disp_fill(0, DISP_XS - 1, 0, DISP_YS - 1, 0);
			LocX = LocY = 0;
			return;
		}
	}

	/* Exit if current position is out of screen */
	if ((unsigned int)LocX >= DISP_XS || (unsigned int)LocY >= DISP_YS) return;

	dchr = chr;
	fofs = 17;		/* Font area start address */

	h = pgm_read_byte(&fnt[15]); w = pgm_read_byte(&fnt[14]); wb = (w + 7) / 8;	/* Font size: height, dot width and byte width */
	fnt += fofs + dchr * wb * h;				/* Goto start of the bitmap */

	if (LocX + w > DISP_XS) w = DISP_XS - LocX;	/* Clip right of font face at right edge */
	if (LocY + h > DISP_YS) h = DISP_YS - LocY;	/* Clip bottom of font face at bottom edge */

	CS_LOW();	/* Select display module */
	disp_setrect(LocX, LocX + w - 1, LocY, LocY + h - 1);
	d = 0;
	do {
		wc = w; b = i = 0;
		do {
			if (!b) {		/* Get next 8 dots */
				b = 0x80;
				d = pgm_read_byte(&fnt[i++]);
			}
			col = ChrColor;
			if (!(b & d)) col >>= 16;	/* Select color, BG or FG */
			b >>= 1;		/* Next bit */
			DATA_WPX(col);	/* Put the color */
		} while (--wc);
		fnt += wb;		/* Next raster */
	} while (--h);
	CS_HIGH();	/* Deselect display module */

	LocX += w;	/* Update current position */
}




#if DISP_USE_FILE_LOADER
/*-----------------------------------------------------*/
/* BMP/JPG file loaders                                */
/*-----------------------------------------------------*/


/* BMP file viewer scroll step */
#define MOVE_X	(DISP_XS / 4)	/* X scroll step */
#define MOVE_Y	(DISP_YS / 4)	/* Y scroll step */

extern FATFS Fs;	/* File system object (main.c) */



/*-----------------------------------*/
/* Load multi-byte word */
/*-----------------------------------*/

static WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
{
	WORD rv;

	rv = ptr[1];
	rv = rv << 8 | ptr[0];
	return rv;
}

static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
{
	DWORD rv;

	rv = ptr[3];
	rv = rv << 8 | ptr[2];
	rv = rv << 8 | ptr[1];
	rv = rv << 8 | ptr[0];
	return rv;
}



/*-----------------------------------*/
/* Windows BMP file loader           */
/*-----------------------------------*/

void load_bmp (
	const char* fn,		/* File to open */
	void *work,			/* Pointer to the working buffer (must be 4-byte aligned) */
	uint16_t sz_work	/* Size of the working buffer (must be power of 2) */
)
{
	uint32_t n, m, biofs, bm_w, bm_h, iw, w, h, lc, left, top, xs, xe, ye;
	uint16_t bx, d;
	uint8_t *buff = work, *p, k;


	if (pf_open(fn)) return;
	pf_read(buff, 128, &bx);
	if (bx != 128 || memcmp_P(buff, PSTR("BM"), 2)) return;
	biofs = ld_dword(buff+10);			/* bfOffBits */
	if (ld_word(buff+26) != 1) return;	/* biPlanes */
	if (ld_word(buff+28) != 24) return;	/* biBitCount */
	if (ld_dword(buff+30) != 0) return;	/* biCompression */
	bm_w = ld_dword(buff+18);			/* biWidth */
	bm_h = ld_dword(buff+22);			/* biHeight */
	iw = ((bm_w * 3) + 3) & ~3;			/* Bitmap line stride [byte] */
	if (!bm_w || !bm_h) return;			/* Check bitmap size */
	if (iw > sz_work) return;			/* Check if buffer size is sufficient for this file */

	disp_fill(0, DISP_XS, 0, DISP_YS, 0);	/* Clear screen */
	/* Determine left/right of image rectangular */
	if (bm_w > DISP_XS) {
		xs = 0; xe = DISP_XS - 1;	/* Full width */
	} else {
		xs = (DISP_XS - bm_w) / 2;	/* H-centering */
		xe = (DISP_XS - bm_w) / 2 + bm_w - 1;
	}
	/* Determine top/bottom of image rectangular */
	if (bm_h > DISP_YS) {
		ye = DISP_YS - 1;	/* Full height */
	} else {
		ye = (DISP_YS - bm_h) / 2 + bm_h - 1;
	}

	left = top = 0;	/* Offset from left/top of the picture */
	do {
		/* Put a rectangular of the picture */
		m = (bm_h <= DISP_YS) ? biofs : biofs + (bm_h - DISP_YS - top) * iw;
		if (pf_lseek(m) || m != Fs.fptr) break;	/* Goto bottom line of the window */
		w = (bm_w > DISP_XS) ? DISP_XS : bm_w;	/* Rectangular width [pix] */
		h = (bm_h > DISP_YS) ? DISP_YS : bm_h;	/* Rectangular height [pix] */
		m = ye;
		do {
			lc = sz_work / iw;	/* Get some lines fit in the working buffer */
			if (lc > h) lc = h;
			h -= lc;
			pf_read(buff, lc * iw, &bx);
			CS_LOW();
			disp_setrect(xs, xe, m - lc + 1, m);	/* Begin to transfer data to a rectangular area */
			m -= lc;
			do {	/* Line loop */
				lc--; p = &buff[lc * iw + left * 3];
				n = w;
				do {	/* Pixel loop  */
					d = *p++ >> 3;	/* Get an RGB888 pixel, convert to RGB565 format */
					d |= (*p++ >> 2) << 5;
					d |= (*p++ >> 3) << 11;
					DATA_WPX(d);
				} while (--n);
			} while (lc);
			CS_HIGH();
		} while (h);

		k = uart_getc();	/* Get key command */
		while (uart_test()) uart_getc();	/* Flush command queue */
		switch (k) {
		case BTN_RIGHT:	/* Move right */
			if (bm_w > DISP_XS)
				left = (left + MOVE_X + DISP_XS <= bm_w) ? left + MOVE_X : bm_w - DISP_XS;
			break;
		case BTN_LEFT:	/* Move left */
			if (bm_w > DISP_XS)
				left = (left >= MOVE_X) ? left - MOVE_X : 0;
			break;
		case BTN_DOWN:	/* Move down */
			if (bm_h > DISP_YS)
				top = (top + DISP_YS + MOVE_Y <= bm_h) ? top + MOVE_Y : bm_h - DISP_YS;
			break;
		case BTN_UP:	/* Move up */
			if (bm_h > DISP_YS)
				top = (top >= MOVE_Y) ? top - MOVE_Y : 0;
			break;
		default:		/* Exit */
			k = 0;
		}
	} while (k);
}




/*-----------------------------------*/
/* JPEG file loader                  */
/*-----------------------------------*/


/* User defined call-back function to input JPEG data */
static unsigned int tjd_input (	/* Returns number of bytes read (zero on error) */
	JDEC* jd,			/* Decompression object */
	uint8_t* buff,		/* Pointer to the read buffer (null to remove data) */
	unsigned int nd		/* Number of bytes to read/skip from input stream */
)
{
	UINT rb;


	jd = jd;	/* Suppress warning (device identifier is not needed in this appication) */

	if (buff) {	/* Read nd bytes from the input strem */
		pf_read(buff, nd, &rb);
		return rb;	/* Returns number of bytes could be read */

	} else {	/* Skip nd bytes on the input stream */
		return (pf_lseek(Fs.fptr + nd) == FR_OK) ? nd : 0;
	}
}



/* User defined call-back function to output RGB bitmap */
static int tjd_output (
	JDEC* jd,		/* Decompression object of current session */
	void* bitmap,	/* Bitmap data to be output */
	JRECT* rect		/* Rectangular region to output */
)
{
	jd = jd;	/* Suppress warning (device identifier is not needed in this appication) */

	/* Check user interrupt at left end */
	if (!rect->left && uart_test()) return 0;	/* Abort to decompression */

	/* Put the rectangular into the display device */
	disp_blt(rect->left, rect->right, rect->top, rect->bottom, (uint16_t*)bitmap);

	return 1;	/* Continue to decompression */
}




void load_jpg (
	const char* fn,		/* File to open */
	void *work,			/* Pointer to the working buffer (must be 4-byte aligned) */
	uint16_t sz_work	/* Size of the working buffer (must be power of 2) */
)
{
	JDEC jd;		/* Decompression object (70 bytes) */
	JRESULT rc;
	uint8_t scale;


	if (pf_open(fn)) return;

	disp_fill(0, DISP_XS, 0, DISP_YS, 0);	/* Clear screen */
	disp_font_color(C_WHITE);

	/* Prepare to decompress the file */
	rc = jd_prepare(&jd, tjd_input, work, sz_work, 0);
	if (rc == JDR_OK) {

		/* Determine scale factor */
		for (scale = 0; scale < 3; scale++) {
			if ((jd.width >> scale) <= DISP_XS && (jd.height >> scale) <= DISP_YS) break;
		}

		/* Display size information at bottom of screen */
		disp_locate(0, TS_HEIGHT - 1);
		xfprintf(disp_putc, PSTR("%ux%u 1/%u"), jd.width, jd.height, 1 << scale);

		/* Start to decompress the JPEG file */
		rc = jd_decomp(&jd, tjd_output, scale);	/* Start to decompress */

	} else {

		/* Display error code */
		disp_locate(0, 0);
		xfprintf(disp_putc, PSTR("Error: %d"), rc);
	}
	uart_getc();
}

#endif
