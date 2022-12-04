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

#ifndef __DISPLAY
#define __DISPLAY
#include <avr/io.h>
#include <inttypes.h>

#define DISP_USE_FILE_LOADER	1	/* Enable file loader functions */

/* Dot screen size */
#define DISP_XS	128
#define DISP_YS	128

/* Text screen size */
#define TS_WIDTH	26
#define TS_HEIGHT	13


extern const uint8_t Font5x10[], Font8x16[];	/* Font image (FONTX2 format) */

/* Initialize display device  */
void disp_init (void);

/* Grafix functions */
void disp_mask (int left, int right, int top, int bottom);
void disp_pset (int x, int y, uint16_t color);
void disp_fill (int left, int right, int top, int bottom, uint16_t color);
void disp_box (int left, int right, int top, int bottom, uint16_t color);
void disp_moveto (int x, int y);
void disp_lineto (int x, int y, uint16_t color);
void disp_blt (int left, int right, int top, int bottom, const uint16_t *pat);

/* Text functions */
void disp_font_face (const uint8_t *font);
void disp_font_color (uint32_t color);
void disp_locate (int col, int row);
void disp_putc (uint8_t chr);

/* File loaders */
#if DISP_USE_FILE_LOADER
#include "pff.h"
#include "tjpgd.h"
#include "uart.h"
#include "xitoa.h"
void load_bmp (const char*, void *work, UINT sz_work);
void load_jpg (const char*, void *work, UINT sz_work);
#endif


/* Color values */
#define RGB16(r,g,b) (((r << 8) & 0xF800)|((g << 3) & 0x07E0)|(b >> 3))
#define	C_BLACK		RGB16(0,0,0)
#define	C_BLUE		RGB16(0,0,255)
#define	C_RED		RGB16(255,0,0)
#define	C_MAGENTA	RGB16(255,0,255)
#define	C_GREEN		RGB16(0,255,0)
#define	C_CYAN		RGB16(0,255,255)
#define	C_YELLOW	RGB16(255,255,0)
#define	C_WHITE		RGB16(255,255,255)
#define	C_LGRAY		RGB16(160,160,160)
#define	C_GRAY		RGB16(128,128,128)

/* File loader control buttons */
#define BTN_UP		'\x05'	/* (Up) ^[E] */
#define BTN_DOWN	'\x18'	/* (Down) ^[X] */
#define BTN_LEFT	'\x13'	/* (Left) ^[S] */
#define BTN_RIGHT	'\x04'	/* (Right) ^[D] */
#define BTN_OK		'\x0D'	/* (Ok) [Enter] */
#define BTN_CAN		'\x1B'	/* (Cansel) [Esc] */
#define BTN_PAUSE	' '		/* (Pause) [Space] */


#define	IMPORT_BIN(sect, file, sym) asm (\
		".section " #sect "\n"\
		".balign 4\n"\
		".global " #sym "\n"\
		#sym ":\n"\
		".incbin \"" file "\"\n"\
		".global _sizeof_" #sym "\n"\
		".set _sizeof_" #sym ", . - " #sym "\n"\
		".balign 4\n"\
		".section \".text\"\n")

#define	IMPORT_BIN_PART(sect, file, ofs, siz, sym) asm (\
		".section " #sect "\n"\
		".balign 4\n"\
		".global " #sym "\n"\
		#sym ":\n"\
		".incbin \"" file "\"," #ofs "," #siz "\n"\
		".global _sizeof_" #sym "\n"\
		".set _sizeof_" #sym ", . - " #sym "\n"\
		".balign 4\n"\
		".section \".text\"\n")

#endif

