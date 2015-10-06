#ifndef CONFIG_H
#define	CONFIG_H

#include "/usr/local/share/sdcc/non-free/include/pic14/pic16f88.h"
#include "types.h"

static __code uint8_t __at(_CONFIG1) conf1=
        _INTRC_IO & _WDT_OFF & _PWRTE_OFF & _MCLR_ON & _BOREN_OFF &
        _LVP_OFF & _CPD_OFF & _WRT_OFF & _DEBUG_OFF & _CCP1_RB3 & _CP_OFF;

static __code uint8_t __at(_CONFIG2) conf2 = _FCMEN_OFF & _IESO_OFF;

#endif	/* CONFIG_H */