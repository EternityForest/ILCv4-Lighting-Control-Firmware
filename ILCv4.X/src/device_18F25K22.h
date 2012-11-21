/**
 * @file device_18F25K22.h
 * @author Daniel Black
 * @details A simle abstraction layer for the pic chip. Note that the MOSI and CK 
 * designation is only logical and does not refer to any kind of hardware serial interface.
 * This should probably change to hardware serial, but i wasn't sure if i would need more control.
 * 
 * This File expects The audio input to be connected to the analog input pin through a resistor.
 * No biasing or level shifting is required. The input protection diodes in the PIC will clif the negative half of the wave.
 * The software only looks for the enevelope so this distortion will not cause problems.
 * 
 * PIN ASSIGNMENTS(From Memory, check if it does not work)
 * 
 * MOSI: RA1
 * CK: RA0
 * BUTTON: RB4 Active low
 * AUDIO IN: RB5 Connect to one audio channel through a 10k resistor of to both channels through a separate 10k for each for best performance.
 * The internal diodes clip the minus half of the sound, that is how it is supposed to be. Connect the audio ground to circuit ground.
 * 
 * I strongly reccomend at least 1 1000uf capacitor, at least 1 0.1uf capacitor, and at least 1 100uf capacitor on the power rails if large amounts of leds are to be powered.
 * 
 * @date February 2012
 * @todo
 */



/**Hi-Tech c wants you to include this file so here it is*/
#include <htc.h>


/**PIC configuration bit settings*/
//Set the 4X clock speed multiplier on, set the clock source to the internal oscillator,
//and disable the hardware WD timer.
__CONFIG(1, PLLCFG_ON & FOSC_INTIO7);
__CONFIG(2, WDTEN_OFF);


//System pin definitions and such

/**Set the MOSI pin low*/
#define MOSI_LOW() LATA &= 0b11111101

/**Set the MOSI pin high*/
#define MOSI_HIGH() LATA |= 0b00000010

/**Set the CK pin low*/
#define CK_LOW() LATA &= 0b11111110

/**Set the CK pin low*/
#define CK_HIGH() LATA |= 0b00000001
/**Get the button on RB4. Returns true if the button is pressed.*/
//Expects active low input.
#define Button_Depressed (!(PORTB & 0b00010000))


/**Initializer for everythong specific to the chip that must be run at startup.*/
static void InitMachineSpecificStuff()
{
    LATA = 0x0; //Outputs all low
    PR2 = 255;
    WPUB = 255; //Weak pullups on all portb inputs analog or not
    INTCON2 = 0; //no interrupts
    T0CON = 0b11000000;
    T2CON = 0b00111111; // timer 2 on, 1/16 pre ,
    // 1/8 post
    //	 PIE1 |= 0b000000010;						  // turn on timer
    // interrupts for t2
    OSCCON = 0b11110010; // hfintosc
    OSCTUNE |= 0b01000000; // pllen Turn on the PLL
    // = 0b11000000; //gie on
    // INTCON2 = 0b00000010; //highpriorite to oveerflow
    T0CON = 0b11000000;
    IPR1 = 2;
    TRISB = 255; // rb1 to analog, adc on.
    TRISA = 0b00000000; //PORTA all outputs
    TRISC = 0;
    ANSELB = 0b00100000; //One analog input on portb
    ADCON0 = 0b00110100; //ADC ch13
    ADCON1 = 0b00001000; //Use VREF module
    VREFCON0 = 0b10010000; //VREF on, 1,024V
    ADCON0 |= 0b00000001;  //turn ADC on
    ADCON0 |= 0b00000010;  //Start a reading
    INTCON =0;
}
//
/** start an ADC conversion */
#define StartAnalogToDigitalConversion()   {ADCON0 |= 0b00000010;}
/**Get the result of the most recent completed adc result.*/
#define GetAdcResult() (ADRESH)



