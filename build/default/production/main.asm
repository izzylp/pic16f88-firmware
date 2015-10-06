;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (Linux)
; This file was generated Wed Jun 24 15:41:23 2015
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f88
	radix dec
	include "p16f88.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config _CONFIG1, 0x2f38
	__config _CONFIG2, 0x3ffc
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ports_init
	extern	_timer_init
	extern	_timer_start
	extern	_pwm_init
	extern	_pwm_output
	extern	_adc_init
	extern	_adc_start
	extern	_interrupt_external_enable
	extern	_interrupt_adc_enable
	extern	_interrupt_timer_enable
	extern	_interrupt_peripheral_enable
	extern	_interrupt_global_enable
	extern	___isr
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_ANSELbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_WDTCONbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_ANSEL
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _ports_init
;   _timer_init
;   _adc_init
;   _pwm_init
;   _interrupt_external_enable
;   _interrupt_adc_enable
;   _interrupt_timer_enable
;   _interrupt_peripheral_enable
;   _interrupt_global_enable
;   _timer_start
;   _ports_init
;   _timer_init
;   _adc_init
;   _pwm_init
;   _interrupt_external_enable
;   _interrupt_adc_enable
;   _interrupt_timer_enable
;   _interrupt_peripheral_enable
;   _interrupt_global_enable
;   _timer_start
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	14; "main.c"	OSCCON = 0b01000110;
	MOVLW	0x46
	BANKSEL	_OSCCON
	MOVWF	_OSCCON
;	.line	16; "main.c"	ports_init();
	PAGESEL	_ports_init
	CALL	_ports_init
	PAGESEL	$
;	.line	17; "main.c"	timer_init();
	PAGESEL	_timer_init
	CALL	_timer_init
	PAGESEL	$
;	.line	18; "main.c"	adc_init();
	PAGESEL	_adc_init
	CALL	_adc_init
	PAGESEL	$
;	.line	19; "main.c"	pwm_init();
	PAGESEL	_pwm_init
	CALL	_pwm_init
	PAGESEL	$
;	.line	21; "main.c"	interrupt_external_enable();
	PAGESEL	_interrupt_external_enable
	CALL	_interrupt_external_enable
	PAGESEL	$
;	.line	22; "main.c"	interrupt_adc_enable();
	PAGESEL	_interrupt_adc_enable
	CALL	_interrupt_adc_enable
	PAGESEL	$
;	.line	23; "main.c"	interrupt_timer_enable();
	PAGESEL	_interrupt_timer_enable
	CALL	_interrupt_timer_enable
	PAGESEL	$
;	.line	24; "main.c"	interrupt_peripheral_enable();
	PAGESEL	_interrupt_peripheral_enable
	CALL	_interrupt_peripheral_enable
	PAGESEL	$
;	.line	25; "main.c"	interrupt_global_enable();
	PAGESEL	_interrupt_global_enable
	CALL	_interrupt_global_enable
	PAGESEL	$
;	.line	32; "main.c"	timer_start();
	PAGESEL	_timer_start
	CALL	_timer_start
	PAGESEL	$
_00107_DS_
	GOTO	_00107_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   14+   21 =    35 instructions (  112 byte)

	end
