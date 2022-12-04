/*------------------------------------------------------------------------/
/  The Main Development Bench of TJpgDec Module 
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


#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <wingdi.h>
#include "tjpgd.h"


#define MODE	0	/* Test mode: 0:Show decmpression status, 1:and output in BMP */
#define SCALE	0	/* Output scaling 0:1/1, 1:1/2, 2:1/4 or 3:1/8 */


/*---------------------------------*/
/* User defined session identifier */
/*---------------------------------*/

typedef struct {
	HANDLE hin;			/* Handle to the input stream */
	uint8_t *frmbuf;	/* Pointer to the frame buffer */
	uint32_t wbyte;		/* Number of bytes a line in the frame buffer */
} IODEV;



/*-----------------------------*/
/* User defined input function */
/*-----------------------------*/

size_t input_func (	/* Returns number of bytes read (zero on error) */
	JDEC* jd,		/* Decompression object */
	uint8_t* buff,	/* Pointer to the read buffer (null to remove data) */
	size_t ndata	/* Number of bytes to read/skip */
)
{
	DWORD rb;
	IODEV *dev = (IODEV*)jd->device;


	if (buff) {	/* Read bytes from input stream */
		ReadFile(dev->hin, buff, ndata, &rb, 0);
		return (size_t)rb;
	} else {	/* Remove bytes from input stream */
		rb = SetFilePointer(dev->hin, ndata, 0, FILE_CURRENT);
		return rb == 0xFFFFFFFF ? 0 : ndata;
	}
}



/*------------------------------*/
/* User defined output function */
/*------------------------------*/

int output_func (	/* 1:Ok, 0:Aborted */
	JDEC* jd,		/* Decompression object */
	void* bitmap,	/* Bitmap data to be output */
	JRECT* rect		/* Rectangular region to output */
)
{
	uint32_t nx, ny, xc, wd;
	uint8_t *src, *dst;
	IODEV *dev = (IODEV*)jd->device;


	nx = rect->right - rect->left + 1;
	ny = rect->bottom - rect->top + 1;	/* Number of lines of the rectangular */
	src = (uint8_t*)bitmap;				/* RGB bitmap to be output */

	wd = dev->wbyte;							/* Number of bytes a line of the frame buffer */
	dst = dev->frmbuf + rect->top * wd + rect->left * 3;	/* Left-top of the destination rectangular in the frame buffer */

	do {	/* Copy the rectangular to the frame buffer */
		xc = nx;
		do {
			if (JD_FORMAT == 2) {	/* Grayscale output */
				*dst++ = *src;
				*dst++ = *src;
				*dst++ = *src;
				src++;
			} else if (JD_FORMAT == 1) {	/* RGB565 output */
				*dst++ = (src[1] & 0xF8) | src[1] >> 5;
				*dst++ = src[1] << 5 | (src[0] & 0xE0) >> 3 | (src[1] >> 1 & 3);
				*dst++ = src[0] << 3 | (src[0] & 0x1F) >> 2;
				src += 2;
			} else {				/* RGB888 output */
				*dst++ = *src++;
				*dst++ = *src++;
				*dst++ = *src++;
			}
		} while (--xc);
		dst += wd - nx * 3;
	} while (--ny);

	return 1;	/* Continue to decompress */
}




/*------------------------------*/
/* Output frame buffer in BMP   */
/*------------------------------*/

void write_bmp (
	const char* fname,
	uint8_t* buf,
	uint32_t width,
	uint32_t height
)
{
	uint32_t i, wb, xb = (width * 3 + 3) & ~3;
	uint8_t *s, *d, r, g, b;
	BITMAPFILEHEADER bfh;
	BITMAPINFOHEADER bih;
	HANDLE hbmp;


	hbmp = CreateFile(fname, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
	if (hbmp == INVALID_HANDLE_VALUE) return;

	memset(&bfh, 0, sizeof bfh);
	bfh.bfType = 'MB';
	bfh.bfSize = sizeof (BITMAPFILEHEADER) + sizeof (BITMAPINFOHEADER) + xb * height;
	bfh.bfOffBits = sizeof (BITMAPFILEHEADER) + sizeof (BITMAPINFOHEADER);
	WriteFile(hbmp, &bfh, sizeof bfh, &wb, 0);

	memset(&bih, 0, sizeof bih);
	bih.biSize = sizeof bih;
	bih.biWidth = width;
	bih.biHeight = height;
	bih.biPlanes = 1;
	bih.biBitCount = 24;
	bih.biCompression = BI_RGB;
	WriteFile(hbmp, &bih, sizeof bih, &wb, 0);

	/* Flip top and down, swap byte order RGB to BGR */
	s = buf; d = buf + xb * (height - 1);
	while (s <= d) {
		for (i = 0; i < width * 3; i += 3) {
			r = s[i+0]; g = s[i+1]; b = s[i+2];
			s[i+0] = d[i+2]; s[i+1] = d[i+1]; s[i+2] = d[i+0];
			d[i+0] = b; d[i+1] = g; d[i+2] = r;
		}
		d -= xb; s += xb;
	}

	WriteFile(hbmp, buf, xb * height, &wb, 0);

	CloseHandle(hbmp);
}



/*------------------------------*/
/* Decompress a JPEG stream     */
/*------------------------------*/

JRESULT jpegtest (char* fname)
{
	const size_t sz_work = 32768;	/* Size of working buffer for TJpgDec module */
	void *jdwork;	/* Pointer to TJpgDec work area */
	JDEC jd;		/* TJpgDec decompression object */
	IODEV iodev;	/* Identifier of the decompression session (depends on application) */
	JRESULT rc;
	uint32_t xb, xs, ys;
	char str[256];


	printf("%s", fname);	/* Put file name */

	/* Open JPEG file */
	iodev.hin = CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
	if (iodev.hin != INVALID_HANDLE_VALUE) {

		jdwork = VirtualAlloc(0, sz_work, MEM_RESERVE|MEM_COMMIT, PAGE_READWRITE);	/* Allocate a work area for TJpgDec */

		/* Prepare to decompress the JPEG image */
		rc = jd_prepare(&jd, input_func, jdwork, sz_work, &iodev);

		if (rc == JDR_OK) {
			printf(",%u,%u", jd.width, jd.height);	/* Image dimensions */
			printf(",%s", jd.ncomp == 1 ? "4:0:0" : jd.msx == 1 ? "4:4:4" : jd.msy == 1 ? "4:2:2" : "4:2:0");	/* Sampling ratio */
			printf(",%u", jd.nrst);					/* Restart interval */
			printf(",%u", sz_work - jd.sz_pool);	/* Used memory size */

			/* Initialize frame buffer */
			xs = jd.width >> SCALE;		/* Image size to output */
			ys = jd.height >> SCALE;
			xb = (xs * 3 + 3) & ~3;		/* Byte width of the frame buffer */
			iodev.wbyte = xb;
			iodev.frmbuf = VirtualAlloc(0, xb * ys, MEM_RESERVE|MEM_COMMIT, PAGE_READWRITE);	/* Allocate a frame buffer */

			/* Start JPEG decompression */
			rc = jd_decomp(&jd, output_func, SCALE);

			printf(",%d", rc);
			if (MODE == 1 && rc == JDR_OK) {		/* Save the decompressed picture as a bmp file */
				strcpy(str, fname);
				strcpy(str + strlen(str) - 4, ".bmp");
				write_bmp(str, (uint8_t*)iodev.frmbuf, xs, ys);
			}
			VirtualFree(iodev.frmbuf, 0, MEM_RELEASE);	/* Discard frame buffer */
		} else {	/* Error occured on prepare */
			printf(",,,,,%d", rc);
		}

		VirtualFree(jdwork, 0, MEM_RELEASE);	/* Discard work area */

		CloseHandle(iodev.hin);	/* Close JPEG file */
	}

	printf("\n");
	return rc;
}





int main (int argc, char* argv[])
{
	HANDLE fd;
	WIN32_FIND_DATA ff;
	int ok = 0, fail = 0;
	LARGE_INTEGER freq, tmr_s, tmr_e;

	if (argc == 2) {
		SetCurrentDirectory(argv[1]);
		printf("FileName,Width,Height,Sampling,Restart,UsedMemory,Result\n");
	} else {
		printf("Usage: jdev <directory>\n");
		return 1;
	}

	fd = FindFirstFile("*.jpg", &ff);	/* Process all .jpg files in the dir */
	if (fd != INVALID_HANDLE_VALUE) {
		QueryPerformanceCounter(&tmr_s);
		do {
			if (ff.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;
			if (jpegtest(ff.cFileName) == JDR_OK) {
				ok++;
			} else {
				fail++;
			}
		} while (FindNextFile(fd, &ff));
		QueryPerformanceCounter(&tmr_e);
		QueryPerformanceFrequency(&freq);
		FindClose(fd);
		printf("\n");
		printf("%f seconds\n", (double)(tmr_e.QuadPart - tmr_s.QuadPart) / freq.QuadPart);
	}

	printf("%d succeeded, %d failed.\n", ok, fail);
	printf("Type enter..."); getchar();
	return 0;
}

