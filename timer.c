#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "timer.h"
#include "types.h"

void timer_init(void)
{
	/*  Período do clock = 32768/4 s
	 *  Para gerar interrupção a cada 200ms,
	 *  precisa-se de 1638 ciclos
	 */
	uint16_t ciclos = 63897 + 120;

	T1CON = 0x00;
	/* Salva a parte alta */
	TMR1H = ciclos >> 8;
	/* Salva a parte baixa*/
	TMR1L = ciclos & 0x00ff;
}

void timer_start(void)
{
	/* Dispara o Timer 1 */
	T1CON |= 0x01;
}