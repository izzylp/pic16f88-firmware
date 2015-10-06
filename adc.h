#ifndef ADC_H
#define	ADC_H

#include "types.h"

#define ADC1 ((uint8_t) 0x00)
#define ADC2 ((uint8_t) 0xff)

void adc_init(void);
void adc_start(uint8_t);

#endif	/* ADC_H */