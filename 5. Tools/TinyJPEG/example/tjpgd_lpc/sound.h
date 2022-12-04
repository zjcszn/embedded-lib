#ifndef _SOUND_DEFINED
#define _SOUND_DEFINED

#include "LPC1100.h"

#define _USE_SOUND_PLAYER	1	/* Enable load_wav() */

typedef struct {		/* Sound FIFO control block */
	uint16_t mode;		/* Data format b0: mono(0)/stereo(1), b1: 8bit(0)/16bit(1) */
	volatile uint16_t ri, wi, ct;	/* FIFO read/write index and counter */
	uint8_t *buff;		/* Pointer to FIFO buffer (must be 4-byte aligned) */
	uint16_t sz_buff;	/* Size of FIFO buffer (must be power of 2) */
} WAVFIFO;

int sound_start (WAVFIFO* fcb, uint32_t fs);
void sound_stop (void);

#if _USE_SOUND_PLAYER
#include <string.h>
#include "ff.h"
#include "disp.h"
#include "uart.h"
#include "xprintf.h"
int load_wav (FIL* fp, const char* title, void *work, UINT sz_work);
#endif

#endif
