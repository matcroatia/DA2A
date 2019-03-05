;
; DA2Ap2.asm
;
; Created: 3/2/2019 5:39:12 PM
; Author : Some guy
;

	.org 0

	SBI DDRB, 2
	LDI R16, 16
	OUT DDRB, R16

