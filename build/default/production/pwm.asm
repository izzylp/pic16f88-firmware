;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (Linux)
; This file was generated Wed Jun 24 15:41:23 2015
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"pwm.c"
	list	p=16f88
	radix dec
	include "p16f88.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_pwm_output
	global	_pwm_init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pwm_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1003	res	1
r0x1002	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_pwm	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _pwm_output	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
_pwm_output	;Function start
; 2 exit points
;	.line	17; "pwm.c"	void pwm_output(sint16_t pwm_valor)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=0, offr=0
;	.line	19; "pwm.c"	CCPR1L = (pwm_valor >> 2) & 0x00ff;
	BCF	STATUS,0
	BTFSC	r0x1000,7
	BSF	STATUS,0
	RRF	r0x1000,W
	MOVWF	r0x1002
	RRF	r0x1001,W
	MOVWF	r0x1003
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=1, offr=0
	BCF	STATUS,0
	BTFSC	r0x1002,7
	BSF	STATUS,0
	RRF	r0x1002,F
	RRF	r0x1003,F
	CLRF	r0x1002
	MOVF	r0x1003,W
	BANKSEL	_CCPR1L
	MOVWF	_CCPR1L
;	.line	20; "pwm.c"	CCP1Y = pwm_valor & 0x0001;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	ANDLW	0x01
	MOVWF	r0x1003
	MOVWF	r0x1002
	RRF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_CCP1CONbits
	BCF	_CCP1CONbits,4
_00001_DS_
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,4
_00002_DS_
;	.line	21; "pwm.c"	CCP1X = (pwm_valor & 0x0002) >> 1;
	MOVLW	0x02
	BANKSEL	r0x1001
	ANDWF	r0x1001,F
	CLRF	r0x1000
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=0, offr=0
	BCF	STATUS,0
	BTFSC	r0x1000,7
	BSF	STATUS,0
	RRF	r0x1000,W
	MOVWF	r0x1002
	RRF	r0x1001,W
	MOVWF	r0x1003
	MOVWF	r0x1001
	RRF	r0x1001,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_CCP1CONbits
	BCF	_CCP1CONbits,5
_00003_DS_
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,5
_00004_DS_
	RETURN	
; exit point of _pwm_output

;***
;  pBlock Stats: dbName = C
;***
;entry:  _pwm_init	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_pwm_init	;Function start
; 2 exit points
;	.line	9; "pwm.c"	PR2 = 255;
	MOVLW	0xff
	BANKSEL	_PR2
	MOVWF	_PR2
;	.line	11; "pwm.c"	CCP1CON = 0b00001111;
	MOVLW	0x0f
	BANKSEL	_CCP1CON
	MOVWF	_CCP1CON
;	.line	12; "pwm.c"	CCPR1L = 0b00000000;
	CLRF	_CCPR1L
;	.line	14; "pwm.c"	T2CON = 0b00000100;
	MOVLW	0x04
	MOVWF	_T2CON
	RETURN	
; exit point of _pwm_init


;	code size estimation:
;	   56+   10 =    66 instructions (  152 byte)

	end
