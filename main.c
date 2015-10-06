#include "config.h"
#include "basico.h"
#include "types.h"
#include "ports.h"
#include "timer.h"
#include "pwm.h"
#include "adc.h"
#include "interrupt.h"
//#include "debug.h"

void main(void)
{
	/* Configuração do oscilador interno para 1MHz */
	OSCCON = 0b01000110;

	ports_init();
	timer_init();
	adc_init();
	pwm_init();

	interrupt_external_enable();
	interrupt_adc_enable();
	interrupt_timer_enable();
	interrupt_peripheral_enable();
	interrupt_global_enable();

	#ifdef DEBUG_MODE
		/* Saída PWM */
		pwm_output((uint16_t) 512);
	#endif

	timer_start();

	for (;;);
}
