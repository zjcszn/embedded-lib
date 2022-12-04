#ifndef I2C_DEFINED
#define I2C_DEFINED
#include "LPC1100.h"


#define I2C_WRITE	0	/* Data directiron flag (I2CCTRL.dir) */
#define I2C_READ	1	/* Data directiron flag (I2CCTRL.dir) */


/* I2C transaction work area */
typedef struct {
	uint8_t stat;			/* I2C transaction status */
	uint8_t dir;			/* Read or write for secondary buffer I2C_DIR_WRITE/I2C_DIR_READ */
	uint8_t sla;			/* Slave address (0..127) */
	uint8_t ncmd;			/* Number of bytes of cmd[] (1..4) */
	uint16_t retry;			/* Number of retries of SLA+W (0..) when not ACKed */
	uint8_t cmd[4];			/* Command bytes follows SLA+W */
	uint8_t icmd;			/* Index of command byte */
	uint16_t ndata;			/* Number of bytes of secondary data (0:no secondary data transfer) */
	uint8_t *data;			/* Pointer to secondary data buffer for read/write */
	void (*eotfunc)(int);	/* Call-back function to notify end of transaction (0:not used) */
} I2CCTRL;


/* Status code (I2CCTRL.stat) */
enum {
	I2C_BUSY = 0,	/* An I2C transaction is in progress. Must not discard this structure */
	I2C_SUCCEEDED,	/* Transaction succeeded */
	I2C_TIMEOUT,	/* Failed due to slave not responded to addressing */
	I2C_ABORTED,	/* Failed due to slave not responded to sent data */
	I2C_ERROR		/* Failed due to bus error, arbitration failed or unknown error */
};


/* I2C control module API */
void i2c0_init (void);				/* Initialize I2C module */
int i2c0_start (volatile I2CCTRL*);	/* Start an I2C transaction */
void i2c0_abort (void);				/* Abort an I2C transaction in progress */

#endif
