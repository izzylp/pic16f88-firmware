;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (Linux)
; This file was generated Wed Jun 24 15:41:23 2015
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"interrupt.c"
	list	p=16f88
	radix dec
	include "p16f88.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_timer_init
	extern	_timer_start
	extern	_adc_init
	extern	_adc_start
	extern	_pwm_init
	extern	_pwm_output
	extern	___sint2fs
	extern	___fsmul
	extern	___fsadd
	extern	___fs2sint
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
	extern	___sdcc_saved_fsr

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
	global	_interrupt_external_enable
	global	_interrupt_adc_enable
	global	_interrupt_timer_enable
	global	_interrupt_peripheral_enable
	global	_interrupt_global_enable
	global	___isr

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_interrupt_0	udata
r0x100A	res	1
r0x1009	res	1
r0x1008	res	1
r0x100B	res	1
r0x100C	res	1
r0x100E	res	1
r0x100D	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_interrupt_0	idata
_ciclos
	db	0x99, 0xf9


ID_interrupt_1	idata
_adc_canal
	db	0xff


ID_interrupt_2	idata
_adc_result
	db	0x00, 0x00


ID_interrupt_3	idata
_pwm_valor
	db	0x00, 0x00


ID_interrupt_4	idata
_pwm_float
	db	0x00, 0x00, 0x00, 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  ___isr	;Function start
; 0 exit points
;functions called:
;   ___sint2fs
;   ___fsmul
;   ___fsadd
;   ___fs2sint
;   ___sint2fs
;   ___fsmul
;   ___fsadd
;   ___fs2sint
;   _adc_start
;   ___sint2fs
;   ___fsmul
;   ___fsadd
;   ___fs2sint
;   ___sint2fs
;   ___fsmul
;   ___fsadd
;   ___fs2sint
;   _adc_start
;11 compiler assigned registers:
;   r0x100B
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   STK01
;   STK02
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting pCode block
___isr	;Function start
; 0 exit points
;	.line	61; "interrupt.c"	void __isr(void) __interrupt (1)
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	64; "interrupt.c"	if (BIT_TST(PIR1, 0)) {
	BANKSEL	_PIR1
	MOVF	_PIR1,W
	ANDLW	0x01
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSC	STATUS,2
	GOTO	_00136_DS_
;	.line	67; "interrupt.c"	BIT_FLP(PORTB, 4);
	MOVLW	0x10
	BANKSEL	_PORTB
	XORWF	_PORTB,F
;	.line	70; "interrupt.c"	if (!BIT_TST(ADCON0, 2)) {
	MOVF	_ADCON0,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00134_DS_
;	.line	71; "interrupt.c"	if (adc_canal == ADC1) {
	BANKSEL	_adc_canal
	MOVF	_adc_canal,W
	BTFSS	STATUS,2
	GOTO	_00131_DS_
;	.line	74; "interrupt.c"	BIT_FLP(PORTB, 5);
	MOVLW	0x20
	BANKSEL	_PORTB
	XORWF	_PORTB,F
;	.line	77; "interrupt.c"	pwm_valor = 0.6452 * (adc_result - 1023) + 1010;
	MOVLW	0x01
	BANKSEL	_adc_result
	ADDWF	_adc_result,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVLW	0xfc
	MOVWF	r0x100C
	BANKSEL	_adc_result
	MOVF	(_adc_result + 1),W
	BTFSC	STATUS,0
	INCF	(_adc_result + 1),W
	BTFSC	STATUS,2
	GOTO	_00001_DS_
	BANKSEL	r0x100C
	ADDWF	r0x100C,F
_00001_DS_
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100C,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVWF	STK06
	MOVF	r0x100C,W
	MOVWF	STK05
	MOVF	r0x100E,W
	MOVWF	STK04
	MOVF	r0x100D,W
	MOVWF	STK03
	MOVLW	0xd4
	MOVWF	STK02
	MOVLW	0x2b
	MOVWF	STK01
	MOVLW	0x25
	MOVWF	STK00
	MOVLW	0x3f
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVLW	0x00
	MOVWF	STK06
	MOVLW	0x80
	MOVWF	STK05
	MOVLW	0x7c
	MOVWF	STK04
	MOVLW	0x44
	MOVWF	STK03
	MOVF	r0x100B,W
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	___fsadd
	CALL	___fsadd
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	___fs2sint
	CALL	___fs2sint
	PAGESEL	$
	BANKSEL	_pwm_valor
	MOVWF	(_pwm_valor + 1)
	MOVF	STK00,W
	MOVWF	_pwm_valor
	GOTO	_00132_DS_
_00131_DS_
;	.line	84; "interrupt.c"	BIT_FLP(PORTB, 6);
	MOVLW	0x40
	BANKSEL	_PORTB
	XORWF	_PORTB,F
;	.line	87; "interrupt.c"	pwm_valor = 6.5340 * (adc_result - 123) + 1023;
	MOVLW	0x85
	BANKSEL	_adc_result
	ADDWF	_adc_result,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVLW	0xff
	MOVWF	r0x100C
	BANKSEL	_adc_result
	MOVF	(_adc_result + 1),W
	BTFSC	STATUS,0
	INCF	(_adc_result + 1),W
	BTFSC	STATUS,2
	GOTO	_00002_DS_
	BANKSEL	r0x100C
	ADDWF	r0x100C,F
_00002_DS_
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100C,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVWF	STK06
	MOVF	r0x100C,W
	MOVWF	STK05
	MOVF	r0x100E,W
	MOVWF	STK04
	MOVF	r0x100D,W
	MOVWF	STK03
	MOVLW	0x87
	MOVWF	STK02
	MOVLW	0x16
	MOVWF	STK01
	MOVLW	0xd1
	MOVWF	STK00
	MOVLW	0x40
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVLW	0x00
	MOVWF	STK06
	MOVLW	0xc0
	MOVWF	STK05
	MOVLW	0x7f
	MOVWF	STK04
	MOVLW	0x44
	MOVWF	STK03
	MOVF	r0x100B,W
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	___fsadd
	CALL	___fsadd
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100C
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVWF	STK02
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	___fs2sint
	CALL	___fs2sint
	PAGESEL	$
	BANKSEL	_pwm_valor
	MOVWF	(_pwm_valor + 1)
	MOVF	STK00,W
	MOVWF	_pwm_valor
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit(0x400=1024), size=2, mask=ffff
;	.line	88; "interrupt.c"	if (pwm_valor > 1023)
	MOVF	(_pwm_valor + 1),W
	ADDLW	0x80
	ADDLW	0x7c
	BTFSS	STATUS,2
	GOTO	_00164_DS_
	MOVLW	0x00
	SUBWF	_pwm_valor,W
_00164_DS_
	BTFSS	STATUS,0
	GOTO	_00128_DS_
;;genSkipc:3247: created from rifx:0xffce0614
;	.line	89; "interrupt.c"	pwm_valor = 1023;
	MOVLW	0xff
	BANKSEL	_pwm_valor
	MOVWF	_pwm_valor
	MOVLW	0x03
	MOVWF	(_pwm_valor + 1)
	GOTO	_00132_DS_
;;signed compare: left < lit(0x15E=350), size=2, mask=ffff
_00128_DS_
;	.line	90; "interrupt.c"	else if (pwm_valor < 350)
	BANKSEL	_pwm_valor
	MOVF	(_pwm_valor + 1),W
	ADDLW	0x80
	ADDLW	0x7f
	BTFSS	STATUS,2
	GOTO	_00165_DS_
	MOVLW	0x5e
	SUBWF	_pwm_valor,W
_00165_DS_
	BTFSC	STATUS,0
	GOTO	_00132_DS_
;;genSkipc:3247: created from rifx:0xffce0614
;	.line	91; "interrupt.c"	pwm_valor = 350;
	MOVLW	0x5e
	BANKSEL	_pwm_valor
	MOVWF	_pwm_valor
	MOVLW	0x01
	MOVWF	(_pwm_valor + 1)
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=0, offr=0
_00132_DS_
;	.line	101; "interrupt.c"	CCPR1L = (pwm_valor >> 2) & 0x00ff;
	BCF	STATUS,0
	BANKSEL	(_pwm_valor + 1)
	BTFSC	(_pwm_valor + 1),7
	BSF	STATUS,0
	RRF	(_pwm_valor + 1),W
	BANKSEL	r0x100C
	MOVWF	r0x100C
	BANKSEL	_pwm_valor
	RRF	_pwm_valor,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=1, offr=0
	BCF	STATUS,0
	BTFSC	r0x100C,7
	BSF	STATUS,0
	RRF	r0x100C,F
	RRF	r0x100B,F
	CLRF	r0x100C
	MOVF	r0x100B,W
	BANKSEL	_CCPR1L
	MOVWF	_CCPR1L
;	.line	102; "interrupt.c"	CCP1Y = pwm_valor & 0x0001;
	BANKSEL	_pwm_valor
	MOVF	_pwm_valor,W
	ANDLW	0x01
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_CCP1CONbits
	BCF	_CCP1CONbits,4
_00003_DS_
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,4
_00004_DS_
;	.line	103; "interrupt.c"	CCP1X = (pwm_valor & 0x0002) >> 1;
	MOVLW	0x02
	BANKSEL	_pwm_valor
	ANDWF	_pwm_valor,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	CLRF	r0x100C
;;shiftRight_Left2ResultLit:5273: shCount=1, size=2, sign=1, same=0, offr=0
	BCF	STATUS,0
	BTFSC	r0x100C,7
	BSF	STATUS,0
	RRF	r0x100C,W
	MOVWF	r0x100D
	RRF	r0x100B,W
	MOVWF	r0x100E
	MOVWF	r0x100B
	RRF	r0x100B,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_CCP1CONbits
	BCF	_CCP1CONbits,5
_00005_DS_
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,5
_00006_DS_
;	.line	106; "interrupt.c"	adc_start(adc_canal);
	BANKSEL	_adc_canal
	MOVF	_adc_canal,W
	PAGESEL	_adc_start
	CALL	_adc_start
	PAGESEL	$
;;102	MOVF	(_ciclos + 1),W
_00134_DS_
;	.line	108; "interrupt.c"	TMR1H = (ciclos >> 8);
	BANKSEL	r0x100E
	CLRF	r0x100E
;;101	MOVF	r0x100B,W
	BANKSEL	_ciclos
	MOVF	(_ciclos + 1),W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	BANKSEL	_TMR1H
	MOVWF	_TMR1H
;;100	MOVF	_ciclos,W
;	.line	109; "interrupt.c"	TMR1L = (ciclos & 0x00FF);
	BANKSEL	r0x100E
	CLRF	r0x100E
;;99	MOVF	r0x100B,W
	BANKSEL	_ciclos
	MOVF	_ciclos,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	BANKSEL	_TMR1L
	MOVWF	_TMR1L
;	.line	110; "interrupt.c"	BIT_CLR(PIR1, 0);
	MOVF	_PIR1,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVLW	0xfe
	ANDWF	r0x100B,W
	BANKSEL	_PIR1
	MOVWF	_PIR1
_00136_DS_
;	.line	113; "interrupt.c"	if (BIT_TST(PIR1, 6))
	BANKSEL	_PIR1
	MOVF	_PIR1,W
	ANDLW	0x40
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSC	STATUS,2
	GOTO	_00138_DS_
;	.line	117; "interrupt.c"	BIT_FLP(PORTB, 2);
	MOVLW	0x04
	BANKSEL	_PORTB
	XORWF	_PORTB,F
;	.line	119; "interrupt.c"	adc_result = ADRESH;
	MOVF	_ADRESH,W
	BANKSEL	_adc_result
	MOVWF	_adc_result
	CLRF	(_adc_result + 1)
;	.line	120; "interrupt.c"	adc_result <<= 8;
	MOVF	_adc_result,W
	MOVWF	(_adc_result + 1)
	CLRF	_adc_result
;	.line	121; "interrupt.c"	adc_result += ADRESL;
	BANKSEL	_ADRESL
	MOVF	_ADRESL,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	CLRF	r0x100D
	MOVF	r0x100B,W
	BANKSEL	_adc_result
	ADDWF	_adc_result,F
	MOVLW	0x00
	BTFSS	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	r0x100D
	INCF	r0x100D,W
	BTFSC	STATUS,2
	GOTO	_00008_DS_
_00007_DS_
	BANKSEL	_adc_result
	ADDWF	(_adc_result + 1),F
_00008_DS_
;	.line	122; "interrupt.c"	BIT_CLR(PIR1, 6);
	BANKSEL	_PIR1
	MOVF	_PIR1,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVLW	0xbf
	ANDWF	r0x100B,W
	BANKSEL	_PIR1
	MOVWF	_PIR1
_00138_DS_
;	.line	125; "interrupt.c"	if (BIT_TST(INTCON, 1))
	BANKSEL	_INTCON
	MOVF	_INTCON,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSC	STATUS,2
	GOTO	_00141_DS_
;	.line	129; "interrupt.c"	BIT_FLP(PORTB, 1);
	MOVLW	0x02
	BANKSEL	_PORTB
	XORWF	_PORTB,F
;	.line	131; "interrupt.c"	adc_canal = ~adc_canal;
	BANKSEL	_adc_canal
	COMF	_adc_canal,F
;	.line	132; "interrupt.c"	BIT_CLR(INTCON, 1);
	BANKSEL	_INTCON
	MOVF	_INTCON,W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVLW	0xfd
	ANDWF	r0x100B,W
	BANKSEL	_INTCON
	MOVWF	_INTCON
_00141_DS_
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_interrupt	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _interrupt_global_enable	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_interrupt_global_enable	;Function start
; 2 exit points
;	.line	58; "interrupt.c"	BIT_SET(INTCON, 7);
	BANKSEL	_INTCON
	BSF	_INTCON,7
	RETURN	
; exit point of _interrupt_global_enable

;***
;  pBlock Stats: dbName = C
;***
;entry:  _interrupt_peripheral_enable	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_interrupt_peripheral_enable	;Function start
; 2 exit points
;	.line	52; "interrupt.c"	BIT_SET(INTCON,	6);
	BANKSEL	_INTCON
	BSF	_INTCON,6
	RETURN	
; exit point of _interrupt_peripheral_enable

;***
;  pBlock Stats: dbName = C
;***
;entry:  _interrupt_timer_enable	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
_interrupt_timer_enable	;Function start
; 2 exit points
;	.line	44; "interrupt.c"	BIT_CLR(PIR1, 0);
	BANKSEL	_PIR1
	MOVF	_PIR1,W
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVLW	0xfe
	ANDWF	r0x1008,W
	BANKSEL	_PIR1
	MOVWF	_PIR1
;	.line	46; "interrupt.c"	BIT_SET(PIE1, 0);
	BANKSEL	_PIE1
	BSF	_PIE1,0
	RETURN	
; exit point of _interrupt_timer_enable

;***
;  pBlock Stats: dbName = C
;***
;entry:  _interrupt_adc_enable	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
_interrupt_adc_enable	;Function start
; 2 exit points
;	.line	36; "interrupt.c"	BIT_CLR(PIR1, 6);
	BANKSEL	_PIR1
	MOVF	_PIR1,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	MOVLW	0xbf
	ANDWF	r0x1009,W
	BANKSEL	_PIR1
	MOVWF	_PIR1
;	.line	38; "interrupt.c"	BIT_SET(PIE1, 6);
	BANKSEL	_PIE1
	BSF	_PIE1,6
	RETURN	
; exit point of _interrupt_adc_enable

;***
;  pBlock Stats: dbName = C
;***
;entry:  _interrupt_external_enable	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
_interrupt_external_enable	;Function start
; 2 exit points
;	.line	26; "interrupt.c"	BIT_CLR(OPTION_REG, 6);
	BANKSEL	_OPTION_REG
	MOVF	_OPTION_REG,W
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVLW	0xbf
	ANDWF	r0x100A,W
	BANKSEL	_OPTION_REG
	MOVWF	_OPTION_REG
;	.line	28; "interrupt.c"	BIT_CLR(INTCON, 1);
	BANKSEL	_INTCON
	MOVF	_INTCON,W
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVLW	0xfd
	ANDWF	r0x100A,W
	BANKSEL	_INTCON
	MOVWF	_INTCON
;	.line	30; "interrupt.c"	BIT_SET(INTCON, 4);
	BSF	_INTCON,4
	RETURN	
; exit point of _interrupt_external_enable


;	code size estimation:
;	  363+  108 =   471 instructions ( 1158 byte)

	end
