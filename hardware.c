#include "hardware.h"
#include "types.h"

static void delay()
{
	uint16_t i, j;

	for (i=0; i<100; i++) {
		for (j=0; j<100; j++);
	}
}

void init_hardware(void)
{
}