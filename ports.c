#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "ports.h"

void ports_init(void)
{
	TRISA = 0b11100011;
	TRISB = 0b00000001;

	PORTA |= 0b00011100;
	PORTB |= 0b11110110;
}