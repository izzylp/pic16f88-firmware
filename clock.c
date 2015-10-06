#include "clock.h"

static void delay()
{
	unsigned char i;

	for (i=0; i<255; i++);
	for (i=0; i<255; i++);
	for (i=0; i<255; i++);
}

void init_clock(void)
{
	char delay;

	/* Clock provém do INTRC, estável, 1 Mhz */
	OSCCON = 0x01000110;

	/* Delay para estabilização */
	delay();
}
