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


#define CS_LOW()	{ SSP0CR0 = 0x0008; GPIO0MASKED[1<<2] = (0<<2); }		/* Set 9-bit/18MHz, CS=L */
#define CS_HIGH()	{ while (SSP0SR & 0x10); GPIO0MASKED[1<<2] = (1<<2); }	/* Wait for EOT, CS=H */

#define	CMD_WR(d)	{ while (!(SSP0SR & 2)); SSP0DR = (d); }			/* Write a command byte to the OLED */
#define	DATA_WRB(d)	{ while (!(SSP0SR & 2)); SSP0DR = 0x100 | (d); }	/* Write a data byte to the OLED */
#define	DATA_WPX(d)	{ while (!(SSP0SR & 2)); SSP0DR = 0x100 | (d >> 8); while (!(SSP0SR & 2)); SSP0DR = 0x100 | (d); }	/* Write a pixel to the OLED */


static int MaskT, MaskL, MaskR, MaskB;	/* Active drawing area */
static int LocX, LocY;			/* Current dot position */
static uint32_t ChrColor;		/* Current character color ((bg << 16) + fg) */
static const uint8_t *FontS;	/* Current font (ANK) */
#if DISP_USE_DBCS
static const uint8_t *FontD;	/* Current font (Kanji) */
static uint8_t Sjis1;			/* Sjis leading byte */
#endif
#if DISP_USE_FILE_LOADER
volatile long TmrFrm;			/* Increased 1000 every 1ms */
#endif

/* Import FONTX2 files as byte array */
IMPORT_BIN(".rodata", "mplfont/MPLHN10X.FNT", Font5x10);	/* const uint8_t Font5x10[] */
IMPORT_BIN_PART(".rodata", "fnt8x16.FNT", 0, 17 + 8 * 128, Font8x16);	/* const uint8_t Font8x16[] */



/*-----------------------------------------------------*/
/* Check if signature string is exit                   */

static int chk_sign (
	const void* str,	/* Data bytes to be checked */
	const void* txt		/* Signature to check */
)
{
	const char *s = str, *t = txt;


	while (*t) {
		if (*t++ != *s++) return 0;
	}
	return 1;
}



/*-----------------------------------------------------*/
/* Set rectangular area to be transferred              */

static void disp_setrect (
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

void disp_init (void)
{
	static const uint8_t initdata[] = {	/* UG-2828GDEDF11 initialization data */
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
	const uint8_t *p;
	uint8_t cl;


	/* Initialize contorl port (SPI0) */
	GPIO0DIR |= _BV(2);				/* Set CS# as output */
	GPIO1DIR |= _BV(8)|_BV(4);		/* Set RES#, OLED_POWER as output */
	GPIO1MASKED[1<<4] = (0<<4);		/* OLED_POWER = L */

	/* Reset OLED module */
	GPIO0MASKED[1<<2] = (1<<2);		/* CS# = H */
	GPIO1MASKED[1<<8] = (0<<8);		/* RES# = L */
	for (n = 0; n < 10000; n++) GPIO1MASKED[1<<8];
	GPIO1MASKED[1<<8] = (1<<8);		/* RES# = H */
	for (n = 0; n < 1000; n++) GPIO1MASKED[1<<8];

	/* Initialize SPI0 module and attach it to the I/O pad */
	__enable_ahbclk(PCSSP0);
	PRESETCTRL |= _BV(0);	/* Release SSP0 reset */
	SSP0CLKDIV = 1;			/* PCLK = sysclk */
	SSP0CPSR = 0x02;		/* fc=PCLK/2 */
	SSP0CR0 = 0x0008;		/* Mode-0, 9-bit */
	SSP0CR1 = 0x02;			/* Enable SPI */
	IOCON_SCK_LOC = 0x02;	/* SCK0 location = PIO0_6 */
	IOCON_PIO0_6 = 0x02;	/* SCK0 */
	IOCON_PIO0_9 = 0x01;	/* MOSI0 */
	IOCON_PIO0_8 = 0x11;	/* MISO0/pull-up */

	/* Send initialization parameters */
	CS_LOW();
	p = initdata;
	while ((cl = *p++) != 0) {
		CMD_WR(*p++); cl--;
		while (cl--) DATA_WRB(*p++);
	}
	CS_HIGH();

	/* Clear screen and Display ON */
	disp_mask(0, DISP_XS - 1, 0, DISP_YS - 1);
	disp_fill(0, DISP_XS - 1, 0, DISP_YS - 1, C_BLACK);
	CS_LOW();
	CMD_WR(0xAF);
	CS_HIGH();

	GPIO1MASKED[1<<4] = (1<<4);			/* OLED_POWER = H */

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

void disp_fill (
	int left,		/* Left end (-32768 to 32767) */
	int right,		/* Right end (-32768 to 32767, >=left) */
	int top,		/* Top end (-32768 to 32767) */
	int bottom,		/* Bottom end (-32768 to 32767, >=top) */
	uint16_t color	/* Box color */
)
{
	uint32_t n;


	if (left > right || top > bottom) return; 	/* Check validity */
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

void disp_lineto (
	int x,		/* X position for the line to (-32768 to 32767) */
	int y,		/* Y position for the line to (-32768 to 32767) */
	uint16_t col	/* Line color */
)
{
	int32_t xr, yr, xd, yd;
	int ctr;


	xd = x - LocX; xr = LocX << 16; LocX = x;
	yd = y - LocY; yr = LocY << 16; LocY = y;

	if ((xd < 0 ? 0 - xd : xd) >= (yd < 0 ? 0 - yd : yd)) {
		ctr = (xd < 0 ? 0 - xd : xd) + 1;
		yd = (yd << 16) / (xd < 0 ? 0 - xd : xd);
		xd = (xd < 0 ? -1 : 1) << 16;
	} else {
		ctr = (yd < 0 ? 0 - yd : yd) + 1;
		xd = (xd << 16) / (yd < 0 ? 0 - yd : yd);
		yd = (yd < 0 ? -1 : 1) << 16;
	}
	xr += 1 << 15;
	yr += 1 << 15;
	do {
		disp_pset(xr >> 16, yr >> 16, col);
		xr += xd; yr += yd;
	} while (--ctr);

}



/*-----------------------------------------------------*/
/* Copy image data to the display                      */

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


	if (left > right || top > bottom) return; 	/* Check validity */
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

void disp_locate (
	int col,	/* Column position */
	int row		/* Row position */
)
{
	if (FontS) {	/* Pixel position is calcurated with size of single byte font */
		LocX = col * FontS[14];
		LocY = row * FontS[15];
#if DISP_USE_DBCS
		Sjis1 = 0;
#endif
	}
}



/*-----------------------------------------------------*/
/* Register text font                                  */

void disp_font_face (
	const uint8_t *font	/* Pointer to the font structure in FONTX2 format */
)
{
	if (chk_sign(font, "FONTX2")) {
#if DISP_USE_DBCS
		if (font[16] != 0)
			FontD = font;
		else
#endif
			FontS = font;
	}
}



/*-----------------------------------------------------*/
/* Set current text color                              */

void disp_font_color (
	uint32_t color	/* (bg << 16) + fg */
)
{
	ChrColor = color;
}



/*-----------------------------------------------------*/
/* Put a text character                                */

void disp_putc (
	uint8_t chr		/* Character to be output (kanji chars are given in two disp_putc sequence) */
)
{
	const uint8_t *fnt;;
	uint8_t b, d;
	uint16_t dchr;
	uint32_t col;
	int h, wc, w, wb, i, fofs;


	if ((fnt = FontS) == 0) return;	/* Exit if no font registerd */

	if (chr < 0x20) {	/* Processes the control character */
#if DISP_USE_DBCS
		Sjis1 = 0;
#endif
		switch (chr) {
		case '\n':	/* LF */
			LocY += fnt[15];
			/* follow next case */
		case '\r':	/* CR */
			LocX = 0;
			return;
		case '\b':	/* BS */
			LocX -= fnt[14];
			if (LocX < 0) LocX = 0;
			return;
		case '\f':	/* FF */
			disp_fill(0, DISP_XS-1, 0, DISP_YS-1, 0);
			LocX = LocY = 0;
			return;
		}
	}

	/* Exit if current position is out of screen */
	if ((unsigned int)LocX >= DISP_XS || (unsigned int)LocY >= DISP_YS) return;

#if DISP_USE_DBCS
	if (Sjis1) {	/* This is sjis trailing byte */
		uint16_t bchr, rs, re;
		int ri;

		dchr = Sjis1 * 256 + chr; 
		Sjis1 = 0;
		fnt = FontD;	/* Switch to double byte font */
		i = fnt[17];	/* Number of code blocks */
		ri = 18;		/* Start of code block table */
		bchr = 0;		/* Number of chars in previous blocks */
		while (i) {		/* Find the code in the code blocks */
			rs = fnt[ri + 0] + fnt[ri + 1] * 256;	/* Start of a code block */
			re = fnt[ri + 2] + fnt[ri + 3] * 256;	/* End of a code block */
			if (dchr >= rs && dchr <= re) break;	/* Is the character in the block? */
			bchr += re - rs + 1; ri += 4; i--;		/* Next code block */
		}
		if (!i) {	/* Code not found */
			LocX += fnt[14];		/* Put a transparent character */
			return;
		}
		dchr = dchr - rs + bchr;	/* Character offset in the font area */
		fofs = 18 + fnt[17] * 4;	/* Font area start address */
	} else {
		/* Check if this is sjis leading byte */
		if (FontD && (((uint8_t)(chr - 0x81) <= 0x1E) || ((uint8_t)(chr - 0xE0) <= 0x1C))) {
			Sjis1 = chr;	/* Next is sjis trailing byte */
			return;
		}
#endif
		dchr = chr;
		fofs = 17;		/* Font area start address */
#if DISP_USE_DBCS
	}
#endif

	h = fnt[15]; w = fnt[14]; wb = (w + 7) / 8;	/* Font size: height, dot width and byte width */
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
				d = fnt[i++];
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
/* BMP/IMG file loaders                                */


/* BMP file viewer scroll step */
#define MOVE_X	(DISP_XS / 4)	/* X scroll step */
#define MOVE_Y	(DISP_YS / 4)	/* Y scroll step */

/* IMG file header */
#define imSign			0	/* Signature "IM" or "im" */
#define	imWidth			2	/* Frame width (pix) */
#define	imHeight		4	/* Frame height (pix) */
#define	imBpp			6	/* Number of bits per pixel */
#define	imDataOfs		8	/* Data start offset */
#define	imFrames		12	/* Nuber of frames */
#define	imFrmPeriod		16	/* Frame period in unit of us */
#define	imFrmSize		20	/* Frame (picture+wav) size in unit of byte */
#define	imWavSamples	24	/* Number of audio samples */
#define	imWavFormat		28	/* Audio format b0:mono(0),stereo(1), b1:8bit(0),16bit(1) */
#define	imWavFreq		30	/* Audio sampling freqency */

extern volatile UINT Timer;		/* Performance counter */


/*----------------------------------*/
/* Transfer picture to the display  */

static int xfer_picture (
	FIL* fp,		/* Pointer to the open file to load */
	void* work,		/* Pointer to the working buffer */
	UINT sz_work,	/* Size of the working buffer [byte] */
	WORD bpp,		/* Color depth [bit] */
	DWORD szpic		/* Picture size [byte] */
)
{
	DWORD n;
	UINT br;
	WORD *dp, w;
	BYTE *bp, b, t;

	do {
		n = (szpic > sz_work) ? sz_work : szpic;
		f_read(fp, work, n, &br);
		if (n != br) return 0;
		szpic -= n;
		CS_LOW();
		switch (bpp) {
		case 16:	/* RGB565 */
			dp = (uint16_t*)work;
			do {
				w = *dp++; DATA_WPX(w);
				w = *dp++; DATA_WPX(w);
			} while (n -= 4);
			break;
		case 8:		/* 256 level grayscale */
			bp = (uint8_t*)work;
			do {
				b = *bp++ & 0xF8;
				w = (b << 8) | (b << 3) | (b >> 3);
				DATA_WPX(w);
				b = *bp++ & 0xF8;
				w = (b << 8) | (b << 3) | (b >> 3);
				DATA_WPX(w);
			} while (n -= 2);
			break;
		default:	/* 16 level grayscale */
			bp = (uint8_t*)work;
			do {
				t = *bp++;
				b = t >> 4; w = (b << 12) | (b << 7) | (b << 1);
				DATA_WPX(w);
				b = t & 0x0F; w = (b << 12) | (b << 7) | (b << 1);
				DATA_WPX(w);
			} while (--n);
		}
		CS_HIGH();
	} while (szpic);

	return 1;
}



/*--------------------------------------*/
/* Send audio data to the output stream */

static int xfer_audio (
	FIL* fp,		/* Pointer to the open file to load */
	void* work,		/* Pointer to the working buffer */
	UINT sz_work,	/* Size of the working buffer [byte] */
	WAVFIFO* pfcb,	/* Pointer to the audio stream fifo control block */
	UINT sz_audio	/* Size of audio (rounded-up to the 512 byte boundary) */
)
{
	UINT br, wi;
	BYTE *wbuf, *rp = work;


	if (sz_audio > sz_work) return 0;
	f_read(fp, work, sz_audio, &br);	/* Load audio data to the buffer */
	if (sz_audio != br) return 0;
	sz_audio = LD_WORD(rp); rp += 2;	/* Get actual size of the audio data */

	/* Push audio data to the audio stream fifo */
	wi = pfcb->wi;
	wbuf = pfcb->buff;
	do {
		if (pfcb->ct < pfcb->sz_buff) {
			wbuf[wi] = *rp++;
			wi = (wi + 1) & (pfcb->sz_buff - 1);
			__disable_irq();
			pfcb->ct++;
			__enable_irq();
			sz_audio--;
		}
	} while (sz_audio);
	pfcb->wi = wi;

	return 1;
}



/*-----------------------------------*/
/* IMG file loader                   */

void load_img (
	FIL *fp,		/* Pointer to the open file object to load */
	void *work,		/* Pointer to the working buffer (must be 4-byte aligned) */
	UINT sz_work	/* Size of the working buffer (must be power of 2) */
)
{
	char k;
	UINT run, x, y, br, mode;
	WORD bpp;
	long fd, tp;
	DWORD d, sz_pic, sz_frm, nfrm, cfrm;
	BYTE *buff = work;
	WAVFIFO fcb;
	BYTE sndbuf[2048];


	f_read(fp, buff, 128, &br);
	if (br != 128) return;
	mode = 0;
	if (chk_sign(buff+imSign, "IM")) mode = 1;	/* Video only */
	if (chk_sign(buff+imSign, "im")) mode = 2;	/* Audio/Video mixed */
	if (!mode) return;

	x = LD_WORD(buff+imWidth);		/* Check frame size */
	y = LD_WORD(buff+imHeight);
	if (!x || x > DISP_XS || !y || y > DISP_YS) return;

	bpp = LD_WORD(buff+imBpp);		/* Check color depth */
	if (bpp != 16 && bpp != 8 && bpp != 4) return;

	sz_pic = x * y * bpp / 8;	/* Picture size [byte] */

	d = LD_DWORD(buff+imDataOfs);	/* Go to data start position */
	if (f_lseek(fp, d) || f_tell(fp) != d) return;

	disp_fill(0, DISP_XS-1, 0, DISP_YS-1, 0);	/* Clear screen */
	CS_LOW();	/* Set image window */
	disp_setrect((DISP_XS - x) / 2, (DISP_XS - x) / 2 + x - 1, (DISP_YS - y) / 2, (DISP_YS - y) / 2 + y - 1);
	CS_HIGH();

	nfrm = LD_DWORD(buff+imFrames);		/* Number of frames */
	cfrm = 0;	/* Current frame (next frame number to display) */
	run = 1;	/* Play/Pause flag */

	if (mode == 1) {	/* Video frames only */
		fd = LD_DWORD(buff+imFrmPeriod);	/* Frame period [us] */
		tp = TmrFrm + fd;
		for (;;) {
			if (run && TmrFrm >= tp) {
				if (cfrm >= nfrm) break;	/* End of stream */
				if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;	/* Display picture */
				tp += fd;
				cfrm++;	/* Next frame */
			}
			k = 0;
			while (__kbhit()) k = __getch();	/* Get button command */
			if (k == BTN_CAN || k == BTN_OK) break;	/* Exit */
			if (k == BTN_UP) {	/* Pause/Resume */
				run ^= 1;
				tp = TmrFrm + fd;
			}
			if (!run) {
				if (k == BTN_RIGHT && cfrm < nfrm) {	/* Go to next frame */
					if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;	/* Put the picture */
					cfrm++;
				}
				if (k == BTN_LEFT && cfrm >= 2) {	/* Go to previous frame */
					if (f_lseek(fp, f_tell(fp) - sz_pic * 2)) break;
					if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;	/* Put the picture */
					cfrm--;
				}
			}
		}
	} else {		/* Audio/Video mixed stream */
		fcb.mode = LD_WORD(buff+imWavFormat);
		fcb.buff = sndbuf;
		fcb.sz_buff = sizeof sndbuf;
		if (!sound_start(&fcb, LD_WORD(buff+imWavFreq))) return;	/* Open audio output stream */
		sz_frm = LD_DWORD(buff+imFrmSize);

		for (;;) {
			if (run) {
				if (cfrm >= nfrm) break;	/* End of stream */
				if (!xfer_audio(fp, work, sz_work, &fcb, sz_frm - sz_pic)) break;	/* Output audio data */
				if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;			/* Display picture */
				cfrm++;	/* Next frame */
			}
			k = 0;
			while (__kbhit()) k = __getch();	/* Get button command */
			if (k == BTN_CAN || k == BTN_OK) break;	/* Exit */
			if (k == BTN_UP) run ^= 1;	/* Pause/Resume */
			if (!run) {
				if (k == BTN_RIGHT && cfrm < nfrm) {	/* Go to next frame */
					if (f_lseek(fp, f_tell(fp) + sz_frm - sz_pic)) break;		/* Skip audio data */
					if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;	/* Put the picture */
					cfrm++;	/* Next frame */
				}
				if (k == BTN_LEFT && cfrm >= 2) {	/* Go to previous frame */
					if (f_lseek(fp, f_tell(fp) - sz_frm * 2 + sz_frm - sz_pic)) break;	/* Goto previous picture */
					if (!xfer_picture(fp, work, sz_work, bpp, sz_pic)) break;			/* Put the picture */
					cfrm--;	/* Previous frame */
				}
			}
		}
		sound_stop();	/* Close sound output stream */
	}
}




/*-----------------------------------*/
/* Windows BMP file loader           */

void load_bmp (
	FIL *fp,		/* Pointer to the open file object to load */
	void *work,		/* Pointer to the working buffer (must be 4-byte aligned) */
	UINT sz_work	/* Size of the working buffer (must be power of 2) */
)
{
	DWORD n, m, biofs, bm_w, bm_h, iw, w, h, lc, left, top, xs, xe, ye;
	UINT bx;
	BYTE *buff = work, *p, k;
	WORD d;


	f_read(fp, buff, 128, &bx);
	if (bx != 128 || !chk_sign(buff, "BM")) return;
	biofs = LD_DWORD(buff+10);			/* bfOffBits */
	if (LD_WORD(buff+26) != 1) return;	/* biPlanes */
	if (LD_WORD(buff+28) != 24) return;	/* biBitCount */
	if (LD_DWORD(buff+30) != 0) return;	/* biCompression */
	bm_w = LD_DWORD(buff+18);			/* biWidth */
	bm_h = LD_DWORD(buff+22);			/* biHeight */
	iw = ((bm_w * 3) + 3) & ~3;			/* Bitmap line stride [byte] */
	if (!bm_w || !bm_h) return;			/* Check bitmap size */
	if (iw > sz_work) return;			/* Check if buffer size is sufficient for this file */

	disp_fill(0, DISP_XS-1, 0, DISP_YS-1, 0);	/* Clear screen */
	/* Determine left/right of image rectangular */
	if (bm_w > DISP_XS) {
		xs = 0; xe = DISP_XS - 1;	/* Full width */
	} else {
		xs = (DISP_XS - bm_w) / 2;	/* H-centering */
		xe = (DISP_XS - bm_w) / 2 + bm_w - 1;
	}
	/* Determine top/bottom of image rectangular */
	if (bm_h > DISP_YS) {	/* Full height */
		ye = DISP_YS - 1;
	} else {				/* V-centering */
		ye = (DISP_YS - bm_h) / 2 + bm_h - 1;
	}

	left = top = 0;	/* Offset from left/top of the picture */
	do {
		/* Put a rectangular of the picture */
		m = (bm_h <= DISP_YS) ? biofs : biofs + (bm_h - DISP_YS - top) * iw;
		if (f_lseek(fp, m) || m != f_tell(fp)) break;	/* Goto bottom line of the window */
		w = (bm_w > DISP_XS) ? DISP_XS : bm_w;	/* Rectangular width [pix] */
		h = (bm_h > DISP_YS) ? DISP_YS : bm_h;	/* Rectangular height [pix] */
		m = ye;
		do {
			lc = sz_work / iw;	/* Get some lines fit in the working buffer */
			if (lc > h) lc = h;
			h -= lc;
			f_read(fp, buff, lc * iw, &bx);
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

		k = __getch();	/* Get key command */
		while (__kbhit()) __getch();	/* Flush command queue */
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


/* User defined call-back function to input JPEG data */
static unsigned int tjd_input (	/* Returns number of bytes read (zero on error) */
	JDEC* jd,			/* Decoder object */
	uint8_t* buff,		/* Pointer to the read buffer (null to remove data) */
	unsigned int nd		/* Number of bytes to read/skip from input stream */
)
{
	UINT rb;
	FIL *fil = (FIL*)jd->device;	/* Input stream of this session */


	if (buff) {	/* Read nd bytes from the input strem */
		f_read(fil, buff, nd, &rb);
		return rb;	/* Returns number of bytes could be read */

	} else {	/* Skip nd bytes on the input stream */
		return (f_lseek(fil, f_tell(fil) + nd) == FR_OK) ? nd : 0;
	}
}



/* User defined call-back function to output RGB bitmap */
static int tjd_output (
	JDEC* jd,		/* Decoder object */
	void* bitmap,	/* Bitmap data to be output */
	JRECT* rect		/* Rectangular region to output */
)
{
	jd = jd;	/* Suppress warning (device identifier is not needed) */

	/* Check user interrupt at left end */
	if (!rect->left && __kbhit()) return 0;	/* Abort decompression */

	/* Put the rectangular into the display */
	disp_blt(rect->left, rect->right, rect->top, rect->bottom, (uint16_t*)bitmap);

	return 1;	/* Continue decompression */
}



void load_jpg (
	FIL *fp,		/* Pointer to the open file object to load */
	void *work,		/* Pointer to the working buffer (must be 4-byte aligned) */
	UINT sz_work	/* Size of the working buffer (must be power of 2) */
)
{
	JDEC jd;		/* Decoder object (124 bytes) */
	JRESULT rc;
	BYTE scale;


	disp_fill(0, DISP_XS-1, 0, DISP_YS-1, 0);	/* Clear screen */
	disp_font_color(C_WHITE);

	/* Prepare to decompress the file */
	rc = jd_prepare(&jd, tjd_input, work, sz_work, fp);
	if (rc == JDR_OK) {

		/* Determine scale factor */
		for (scale = 0; scale < 3; scale++) {
			if ((jd.width >> scale) <= DISP_XS && (jd.height >> scale) <= DISP_YS) break;
		}

		/* Put picture information at bottom of screen */
		disp_locate(0, TS_HEIGHT - 1);
		xfprintf(disp_putc, "%ux%u 1/%u", jd.width, jd.height, 1 << scale);

		/* Start to decompress the JPEG file */
		rc = jd_decomp(&jd, tjd_output, scale);	/* Start to decompress */

	} else {

		/* Display error code */
		disp_locate(0, 0);
		xfprintf(disp_putc, "Error: %d", rc);
	}
	__getch();
}


/*-----------------------------------*/
/* Text file loader                  */

typedef struct {
	BYTE sbuf[512];
	DWORD ltbl[1];
} TXVIEW;


void load_txt (
	FIL *fp,		/* Pointer to the open file object to load */
	void *work,
	UINT sz_work
)
{
	TXVIEW *tv = work;
	UINT lw, i, j, line, br, col, lines, max_lines;
	DWORD cfp;
	BYTE c;
	char k;


	max_lines = (sz_work - (UINT)tv->ltbl + (UINT)&tv) / 4;

	cfp = br = i = 0;
	tv->ltbl[0] = 0;
	for (line = 0; line < max_lines - 1; ) {
		if (i >= br) {
			cfp = f_tell(fp);
			f_read(fp, tv->sbuf, 512, &br);
			if (br == 0) break;
			i = 0;
		}
		if (tv->sbuf[i++] == '\n')
			tv->ltbl[++line] = cfp + i;
	}
	lines = line;
	line = col = 0;
	disp_font_color(C_WHITE);
	for (;;) {
		disp_locate(0, 0);
		for (i = line; i < line + TS_HEIGHT && i < lines; i++) {
			f_lseek(fp, tv->ltbl[i]);
			lw = tv->ltbl[i + 1] - tv->ltbl[i];
			f_read(fp, tv->sbuf, lw > 512 ? 512 : lw, &br);
			if (!br) return;
			for (j = 0; j < col && tv->sbuf[j] != '\n'; j++) {
#if DISP_USE_DBCS
				if (FontD && ((tv->sbuf[j] >= 0x81 && tv->sbuf[j] <= 0x9F) || (tv->sbuf[j] >= 0xE0 && tv->sbuf[j] <= 0xFC))) j++;
#endif
			}
			if (tv->sbuf[j] != '\n') {
				if (j > col) disp_putc(' ');
				for ( ; tv->sbuf[j] != '\n' && j < TS_WIDTH + col; j++) {
					c = tv->sbuf[j];
					if (c == '\r' || c == '\t') c = ' ';
					disp_putc(c);
				}
			}
			for ( ; j < TS_WIDTH + col; j++) disp_putc(' ');
			disp_putc('\n');
		}
		for ( ; i < line + TS_HEIGHT; i++) {
			for (j = 0; j < TS_WIDTH; j++) disp_putc(' ');
			disp_putc('\n');
		}

		k = __getch();
		if (k == BTN_CAN || k == BTN_OK) break;
		if (k == BTN_DOWN) {
			if (line + TS_HEIGHT < lines) line++;
		}
		if (k == BTN_UP) {
			if (line) line--;
		}
		if (k == BTN_LEFT) {
			if (col) col--;
		}
		if (k == BTN_RIGHT) {
			if (col < 512 - col) col++;
		}
	}
}

#endif
