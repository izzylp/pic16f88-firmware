#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "adc.h"
#include "basico.h"
#include "types.h"

void delay()
{
	uint8_t i;
	for (i=0; i<10; i++);
}

void adc_init(void)
{
	/* Configura AN0 e AN1 como entradas */
	ANSEL = 0b00000011;
	/* Seleciona saída justificada à direita, clock FOSC/4, Vdd e Vss */
	ADCON1 = 0b11000000;
	/* Seleciona AN0 com clock FOSC/4 */
	ADCON0 = 0b00000001;
}

void adc_start(uint8_t adc_canal)
{
	if (adc_canal == ADC1) {
		ADCON0 = 0b00000001;
	} else {
		ADCON0 = 0b00001001;
	}
	delay();
	/* Dispara ADC */
	BIT_SET(ADCON0, 2);
}