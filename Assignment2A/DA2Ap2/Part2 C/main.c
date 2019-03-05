/*
 * Part2 C.c
 *
 * Created: 3/2/2019 9:16:06 PM
 * Author : Some guy
 */ 
	
		#include <avr/io.h>
		#include <util/delay.h>

		int main(void)
		{
			
			 
			DDRB = 0x02; //sets PB2 as output
			while(1)     //loop for while LED on
			{
				if ((PINC & (1 << PC2)) == (1<<PC2)) //if to light up LED when button is pressed
				{
					PORTB = 0xFF; //Turns ON LED
					_delay_ms(9000); //1.2 second delay
					PORTB = 0; //Turns OFF LED
				}
			}
			
		}
