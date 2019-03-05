;
; DA2A.asm
;
; Created: 3/2/2019 12:17:07 PM
; Author : Mat Tomljenovic
;

		
	    .org 0       ;clears registers
		SBI DDRB, 1  ;set output port PB1
START:	
		LDI R20, 0x24   ;load 0x24 into register 20
		STS OCR1AH, R20 ;set value in R20 to high bits of output compare
		LDI R20, 0x04   ;load 0x04 into R20
		STS OCR1AL, R20 ;set vlaue in R20 to low bits of output compare
		LDI R20, 0x0C   ;load 0x0C into R20
		STS TCCR1B, R20 ;set value in R20 into lower bit of timer
		LDI R20, 0x40   ;load 0x40 into R20
		STS TCCR1A, R20 ;set value in R20 to high bit of timer
		
LOOP1:	
		IN R20, TIFR1   ;timer interrutpt flag
		SBRS R20, OCF1A ;set overflow carry flag
		RJMP LOOP1      ;loop1 label
		LDI R16, 1<<OCF1A ;load output compare flag into R16
		OUT TIFR1, R16    ;value for time delay is loaded from R16
		LDI R20, 0x3D     ;load 0x3D into register 20
		STS OCR1AH, R20   ;set value in R20 into overflow carry bit
		LDI R20, 0x06     ;load 0x06 into R20 
		STS OCR1AL, R20   ;set value in R20 to overflow carry flag lower bit
		LDI R20, 0x0C     ;load 0x0C into R20
		STS TCCR1B, R20   ;set value in R20 into lower bits of timer
		LDI R20, 0x40     ;laod 0x40 into R20
		STS TCCR1A, R20   ;set value in R20 into high bits of timer
		
LOOP2:	IN R20, TIFR1     ;timer interrupt flag 
		SBRS R20, OCF1A   ;skip if bit in R20 is set to overflow carry
		RJMP LOOP2        ;loop2 label
		LDI R16, 1<<OCF1A ;load output compare flag into R16
		OUT TIFR1, R16    ;value for time delay is loaded from R16
		RJMP START        ;jump to start loop

	


