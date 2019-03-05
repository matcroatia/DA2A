/*
 * DA2A part2 C.c
 *
 * Created: 3/2/2019 9:22:27 PM
 * Author : Some guy
 */ 

	#include <avr/io.h>
	#define F_CPU 8000000UL
	#include <util/delay.h>

	
	
	
	int main(void)
	{
		DDRB |= (1 << PB2); //Makes first pin of PORTB as Output
		
		DDRC &= ~(1<<PC2);//Makes first pin of PORTC as Input
		
		while(1) 
		{
			if(PINC & (1<<PC2) == 1) //If switch is pressed
			{
				PORTB |= (1<<PB2); //Turns ON LED
				_delay_ms(1200);
				PORTB &= ~(1<<PB2); //Turns OFF LED
			}
		}
		return 0;
	}