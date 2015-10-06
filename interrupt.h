#ifndef INTERRUPT_H
#define	INTERRUPT_H

/* Habilitar interrup��o externa (terminal INT) */
void interrupt_external_enable(void);
/* Habilitar interrup��o do ADC */
void interrupt_adc_enable(void);
/* Habilitar interrup��o do Timer 1 */
void interrupt_timer_enable(void);
/* Habilitar interrup��o dos perif�ricos */
void interrupt_peripheral_enable(void);
/* Habilitar interrup��es globais */
void interrupt_global_enable(void);
/* Interrupt Service Routine */
void __isr(void) __interrupt(1);

#endif	/* INTERRUPT_H */

