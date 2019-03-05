/*
 * DA2ACode.c
 *
 * Created: 3/2/2019 3:53:54 PM
 * Author : Some guy
 */ 

#include <avr/io.h>
#define F_CPU 7000000UL
#include <util/delay.h>

int main(void)
{
	DDRB |= (1 << PB2); //sets PB2 as output
	while(1)            //loop for while LED is on
	{
		PORTB |= (1 << PB2); //delay for LED on 60% duty cycle
		_delay_ms(450);      //delay value in ms
		PORTB &= ~(1<<PB2);  //delay for LED off
		_delay_ms(300);      //delay value in ms
	}
	return 1;
}	

