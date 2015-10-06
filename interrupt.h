#ifndef INTERRUPT_H
#define	INTERRUPT_H

/* Habilitar interrupção externa (terminal INT) */
void interrupt_external_enable(void);
/* Habilitar interrupção do ADC */
void interrupt_adc_enable(void);
/* Habilitar interrupção do Timer 1 */
void interrupt_timer_enable(void);
/* Habilitar interrupção dos periféricos */
void interrupt_peripheral_enable(void);
/* Habilitar interrupções globais */
void interrupt_global_enable(void);
/* Interrupt Service Routine */
void __isr(void) __interrupt(1);

#endif	/* INTERRUPT_H */

