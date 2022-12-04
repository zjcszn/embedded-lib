/*------------------------------------------------------------------------/
/  Sound Streamer and RIFF-WAVE file player for MARY/104 system
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

#include "sound.h"


#define FCC(c1,c2,c3,c4)	((c4<<24)+(c3<<16)+(c2<<8)+c1)	/* FourCC */
#define NBSIZE 64
#define F_AHBCLK	36000000


static
WAVFIFO *WavFifo;	/* Pointer to sound FIFO control block */


/*-----------------------------------------------------*/
/* Sound sampling ISR                                  */

void CT32B0_IRQHandler (void)
{
	WAVFIFO *fcb = WavFifo;	/* Pointer to FIFO controls */
	UINT ri, ct;
	BYTE a1, a2, *buff;


	TMR32B0IR = _BV(0);	/* Clear MR0 match irq flag */

	if (!fcb) return;	/* Unexpected interrupt */
	buff = fcb->buff;	/* FIFO buffer */
	ct = fcb->ct; ri = fcb->ri;	/* Byte count, Read index */

	switch (fcb->mode) {
	case 0:		/* Mono, 8bit */
		if (ct < 1) return;
		a1 = a2 = buff[ri];
		ct -= 1; ri += 1;
		break;
	case 1:		/* Stereo, 8bit */
		if (ct < 2) return;
		a1 = buff[ri];
		a2 = buff[ri + 1];
		ct -= 2; ri += 2;
		break;
	case 2:		/* Mono, 16bit */
		if (ct < 2) return;
		a1 = a2 = buff[ri + 1] ^ 0x80;
		ct -= 2; ri += 2;
		break;
	default:	/* Stereo, 16bit */
		if (ct < 4) return;
		a1 = buff[ri + 1] ^ 0x80;
		a2 = buff[ri + 3] ^ 0x80;
		ct -= 4; ri += 4;
	}
	TMR32B1MR0 = a1;	/* AOUT0 (left) */
	TMR32B1MR1 = a2;	/* AOUT1 (right) */

	fcb->ct = ct;
	fcb->ri = ri & (fcb->sz_buff - 1);
}



/*-----------------------------------------------------*/
/* Enable sound output stream                          */

int sound_start (
	WAVFIFO* fcb,	/* Pointer to the sound FIFO control structure */
	DWORD fs		/* Sampling frequency [Hz] (8000-48000) */
)
{
	if (fs < 8000 || fs > 48000) return 0;	/* Check sampling freq */

	fcb->ri = 0; fcb->wi = 0; fcb->ct = 0;	/* Flush FIFO */
	WavFifo = fcb;			/* Register FIFO control structure */

	/* Configure CT32B1 as audio outputs */
	__enable_ahbclk(PCCT32B1);	/* Enable CT32B1 module */
	TMR32B1MR0 = 0x80;		/* Set center level */
	TMR32B1MR1 = 0x80;
	TMR32B1MR2 = 0xFF;		/* Set count range to 0-255 (8-bit resolution) */
	TMR32B1MCR = 0x080;		/* Set counter cleared on MR2 match */
	TMR32B1PWMC = 0x03;		/* Enable MAT0/MAT1 PWM output */
	TMR32B1TC = 0;			/* Clear counter */
	TMR32B1TCR = 0x01;		/* Start counter */
	IOCON_R_PIO1_1 = 0x83;	/* Attach CT32B1_MAT0 to I/O pad */
	IOCON_R_PIO1_2 = 0x83;	/* Attach CT32B1_MAT1 to I/O pad */

	/* Configure CT32B0 as sampling interval timer */
	__enable_ahbclk(PCCT32B0);	/* Enable CT32B0 module */
	TMR32B0MR0 = F_AHBCLK / fs - 1;	/* Set sampling interval time (MR0) */
	TMR32B0MCR = 0x003;			/* Set counter clear/interrupt on MR0 match */
	TMR32B0TC = 0;				/* Clear counter */
	TMR32B0TCR = 0x01;			/* Start counter */
	__enable_irqn(CT32B0_IRQn);	/* Enable interrupt */
	__set_irqn_priority(CT32B0_IRQn, 0);	/* Set interrupt priority, highest */

	return 1;
}



/*-----------------------------------------------------*/
/* Disable sound output                                */

void sound_stop (void)
{
	TMR32B1MR0 = 0x80;	/* Return outputs to center (CT32B1) */
	TMR32B1MR1 = 0x80;

	TMR32B0TCR = 0;		/* Stop sampling interrupt (CT32B0) */
	__disable_irqn(CT32B0_IRQn);

	WavFifo = 0;		/* Unregister FIFO control structure */
}



/*-----------------------------------------------------*/
/* WAV file loader                                     */

#if _USE_SOUND_PLAYER

int load_wav (
	FIL *fp,			/* Pointer to the open file object to play */
	const char *title,	/* Title (file name, etc...) */
	void *work,			/* Pointer to working buffer (must be-4 byte aligned) */
	UINT sz_work		/* Size of working buffer (must be power of 2) */
)
{
	UINT md, wi, br, tc, t, btr;
	DWORD sz, ssz, offw, szwav, wsmp, fsmp, eof;
	WAVFIFO fcb;
	BYTE k, *buff = work;
	char *p, nam[NBSIZE], art[NBSIZE];


	disp_font_color(C_WHITE);
	xfprintf(disp_putc, "\f%s\n", title);	/* Put title */

	/* Is it a WAV file? */
	if (f_read(fp, buff, 12, &br) || br != 12) return -1;
	if (LD_DWORD(&buff[0]) != FCC('R','I','F','F')) return -1;
	if (LD_DWORD(&buff[8]) != FCC('W','A','V','E')) return -1;
	eof = LD_DWORD(&buff[4]) + 8;

	/* Analyze the RIFF-WAVE header and get properties */
	nam[0] = art[0] = 0;
	md = fsmp = wsmp = offw = szwav = 0;
	while (f_tell(fp) < eof) {
		if (f_read(fp, buff, 8, &br) || br != 8) return -1;
		sz = (LD_DWORD(&buff[4]) + 1) & ~1;
		switch (LD_DWORD(&buff[0])) {
		case FCC('f','m','t',' ') :
			if (sz > 1000 || sz < 16 || f_read(fp, buff, sz, &br) || sz != br) return -1;
			if (LD_WORD(&buff[0]) != 0x1) return -1;	/* Check if LPCM */
			if (LD_WORD(&buff[2]) == 2) {	/* Channels (1 or 2) */
				md = 1; wsmp = 2;
			} else {
				md = 0; wsmp = 1;
			}
			if (LD_WORD(&buff[14]) == 16) {	/* Resolution (8 or 16) */
				md |= 2; wsmp *= 2;
			}
			fsmp = LD_DWORD(&buff[4]);		/* Sampling rate */
			break;

		case FCC('f','a','c','t') :
			f_lseek(fp, f_tell(fp) + sz);
			break;

		case FCC('d','a','t','a') :
			offw = f_tell(fp);	/* Wave data start offset */
			szwav = sz;			/* Wave data length [byte] */
			f_lseek(fp, f_tell(fp) + sz);
			break;

		case FCC('L','I','S','T'):
			sz += f_tell(fp);
			if (f_read(fp, buff, 4, &br) || br != 4) return -1;
			if (LD_DWORD(buff) == FCC('I','N','F','O')) {	/* LIST/INFO chunk */
				while (f_tell(fp) < sz) {
					if (f_read(fp, buff, 8, &br) || br != 8) return -1;
					ssz = (LD_DWORD(&buff[4]) + 1) & ~1;
					switch (LD_DWORD(buff)) {
					case FCC('I','N','A','M'):		/* INAM sub-chunk */
						p = nam; break;
					case FCC('I','A','R','T'):		/* IART sub-cnunk */
						p = art; break;
					default:
						p = 0;
					}
					if (p && ssz <= NBSIZE) {
						if (f_read(fp, p, ssz, &br) || br != ssz) return -1;
					} else {
						if (f_lseek(fp, f_tell(fp) + ssz)) return -1;
					}
				}
			} else {
				if (f_lseek(fp, sz)) return -1;	/* Skip unknown sub-chunk type */
			}
			break;

		default :	/* Unknown chunk */
			return -1;
		}
	}
	if (!szwav || !fsmp) return -1;		/* Check if valid WAV file */
	if (f_lseek(fp, offw)) return -1;	/* Seek to top of wav data */

	xfprintf(disp_putc, "ART:%s\nNAM:%s\n", art, nam);	/* Put IART and INAM field */
	tc = szwav / fsmp / wsmp;
	xfprintf(disp_putc, "Len:%u:%02u, %u.%ukHz, %s\n", tc / 60, tc % 60, fsmp / 1000, (fsmp / 100) % 10, (md & 1) ? "½ÃÚµ" : "ÓÉ×Ù");

	/* Initialize stream parameters and start sound streming */
	fcb.mode = md;
	fcb.buff = buff;
	fcb.sz_buff = sz_work;
	if (!sound_start(&fcb, fsmp)) return -1;

	disp_font_face(Font8x16);	/* Select current font for time indicator */

	k = 0; wi = 0;
	while (szwav || fcb.ct >= 4) {
		if (szwav && fcb.ct <= sz_work / 2) {	/* Refill FIFO when it gets half empty */
			btr = (szwav >= sz_work / 2) ? sz_work / 2 : szwav;
			f_read(fp, &buff[wi], btr, &br);
			if (br != btr) break;
			szwav -= br;
			wi = (wi + br) & (sz_work - 1);
			__disable_irq();
			fcb.ct += br;
			__enable_irq();
		}
		if (uart0_test()) {		/* Exit if a command arrived */
			k = uart0_getc();
			if (k == BTN_LEFT || k == BTN_RIGHT || k == BTN_CAN || k == BTN_OK) break;
		}
		t = (f_tell(fp) - offw - fcb.ct) / fsmp / wsmp;	/* Refresh time display every 1 sec */
		if (t != tc) {
			tc = t;
			xfprintf(disp_putc, "%2u:%02u\r", tc / 60, tc % 60);
		}
	}

	sound_stop();	/* Stop sound output */

	disp_font_face(Font5x10);	/* Restore font */

	return k;	/* Terminated due to -1:error, 0:eot, >0:key code */
}

#endif
