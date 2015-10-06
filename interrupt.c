#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "timer.h"
#include "basico.h"
#include "types.h"
#include "adc.h"
#include "pwm.h"
#include "debug.h"
#include "portable.h"

static uint16_t ciclos = 63897;
/* Para a protoboard: adc_canal inicial = ADC1
 * Para o PCB: adc_canal inicial = ADC2
 */
#ifdef PCB_MODE
	static volatile uint8_t adc_canal = ADC2;
#else
	static volatile uint8_t adc_canal = ADC1;
#endif
static volatile sint16_t adc_result = 0;
static volatile sint16_t pwm_valor = 0;
static volatile float pwm_float = 0;

void interrupt_external_enable(void)
{
	/* Seta interrupção em borda de descida */
	BIT_CLR(OPTION_REG, 6);
	/* Limpa flag de interrupção */
	BIT_CLR(INTCON, 1);
	/* Habilita interrupção */
	BIT_SET(INTCON, 4);
}

void interrupt_adc_enable(void)
{
	/* Limpa flag de interrupção */
	BIT_CLR(PIR1, 6);
	/* Habilita interrupção */
	BIT_SET(PIE1, 6);
}

void interrupt_timer_enable(void)
{
	/* Limpa flag de interrupção */
	BIT_CLR(PIR1, 0);
	/* Habilita interrupção */
	BIT_SET(PIE1, 0);
}

void interrupt_peripheral_enable(void)
{
	/* Habilita interrupções */
	BIT_SET(INTCON,	6);
}

void interrupt_global_enable(void)
{
	/* Habilita interrupções */
	BIT_SET(INTCON, 7);
}

void __isr(void) __interrupt (1)
{
	/* Interrupção do Timer 1 */
	if (BIT_TST(PIR1, 0)) {
            	#ifdef DEBUG_MODE
                        /* Saída digital TEST3 */
                        BIT_FLP(PORTB, 4);
                #endif
		/* Gera a saída PWM quando a conversão estiver completa */
		if (!BIT_TST(ADCON0, 2)) {
			if (adc_canal == ADC1) {
                                #ifdef DEBUG_MODE
                                        /* Saída digital TEST4 */
                                        BIT_FLP(PORTB, 5);
                                #endif
				#ifdef PCB_MODE
					pwm_valor = 0.6452 * (adc_result - 1023) + 1010;
				#else
					pwm_valor = 0.6579 * (adc_result - 1023) + 1023;
				#endif
			} else {
                                #ifdef DEBUG_MODE
                                        /* Saída digital TEST5 */
                                        BIT_FLP(PORTB, 6);
                                #endif
				#ifdef PCB_MODE
				pwm_valor = 6.5340 * (adc_result - 123) + 1023;
				if (pwm_valor > 1023)
					pwm_valor = 1023;
				else if (pwm_valor < 350)
					pwm_valor = 350;
				#else
				pwm_valor = 6.5340 * (adc_result - 123) + 1023;
				if (pwm_valor > 1023)
					pwm_valor = 1023;
				else if (pwm_valor < 350)
					pwm_valor = 350;
				#endif
			}
			/* Gera a saída PWM */
			CCPR1L = (pwm_valor >> 2) & 0x00ff;
			CCP1Y = pwm_valor & 0x0001;
			CCP1X = (pwm_valor & 0x0002) >> 1;

			/* Dispara o ADC */
			adc_start(adc_canal);
		}
		TMR1H = (ciclos >> 8);
		TMR1L = (ciclos & 0x00FF);
		BIT_CLR(PIR1, 0);
	}
	/* Interrupção do ADC */
	if (BIT_TST(PIR1, 6))
	{
		#ifdef DEBUG_MODE
			/* Saída digital TEST2 */
			BIT_FLP(PORTB, 2);
		#endif
		adc_result = ADRESH;
		adc_result <<= 8;
		adc_result += ADRESL;
		BIT_CLR(PIR1, 6);
	}
	/* Interrupção externa */
	if (BIT_TST(INTCON, 1))
	{
		#ifdef DEBUG_MODE
			/* Saída digital TEST1 */
			BIT_FLP(PORTB, 1);
		#endif
		adc_canal = ~adc_canal;
		BIT_CLR(INTCON, 1);
	}
}