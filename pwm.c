#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "pwm.h"
#include "types.h"
#include "basico.h"

void pwm_init(void)
{
        /* Configura frequência do PWM para 1 kHz */
	PR2 = 255;
        /* Configura PWM e duty cyle = 0 */
	CCP1CON = 0b00001111;
	CCPR1L = 0b00000000;
    	/* Dispara o Timer 2 com Prescale de 1 */
	T2CON = 0b00000100;
}

void pwm_output(sint16_t pwm_valor)
{
	CCPR1L = (pwm_valor >> 2) & 0x00ff;
	CCP1Y = pwm_valor & 0x0001;
	CCP1X = (pwm_valor & 0x0002) >> 1;
}