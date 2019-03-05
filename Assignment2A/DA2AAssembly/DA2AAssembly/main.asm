;
; DA2AAssembly.asm
;
; Created: 3/4/2019 6:09:37 PM
; Author : Some guy
;

	.org 0      ;used to clear registers
	SBI DDRB, 2 ;make PB02 as output on PORTB 
	LDI R20,5  ;set clock prescaler to 1024
	STS TCCR1B, R20 ;set clock prescaler to timer

	LOOP1: 
		IN R16, PINC ;reading in all pins in port C and storing values in R16
		ANDI R16, 4  ;and value in R16 with PINC2
		CPI R16, 4   ;compare value in R16 with PINC2
		BRNE LOOP1   ;loop1 label
		RJMP LOOP2   ;loop2 label

	LOOP2:
		SBI PORTB, 2  ;turn LED PB2 on
		LDI R20, 0x00 ;resetting the counter to 0
		STS TCNT1H, R20 ;stores counter values used for high bits 
		STS TCNT1L, R20 ;stores counter values used for low bits
		
		DELAY:
		LDS R29,TCNT1H ;loading upper bit of counter to R29
		LDS R28,TCNT1L ;loading lower bit of counter to R28
		CPI R28, 0x25  ;comparing if lower 8 bits of timer is 0x25
		BRSH BODY      ;branch if lower bits reach the desired amount
		RJMP DELAY     ;delay label

		BODY: 
		CPI R29, 0x26 ;compare if higer 8 bits of timer is 0x26
		BRLT DELAY    ;branch if higher bits rach desired amount
		RJMP OFF      ;off label

		OFF:
			LDI R17, 0     ;load 0 into R17 for turning off LED
			OUT PORTB, R17 ;set value in R17 to PORTB, turn off LED 
			RJMP LOOP1     ;loop1 label

	