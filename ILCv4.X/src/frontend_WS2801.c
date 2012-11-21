/**
 * @file frontend_SPI_WS2801.c
 * @author Daniel Black
 * @details A front end using the PIC built in ADC and soft SPI outputting to a WS2081 chip string.
 * This file is meant to handle all rapid i/o tasks
 * @date February 2012
 */


/**the hawrdare abstraction definitions*/
#include "device_18F25k22.h"
#include "global.h"

static unsigned char i, j, ThisSample;
/**the peak sample of this frame*/
unsigned char SamplePeak;

/**Output the content of lights[] to the spi port formatted for a ws2801 string.
 *also take a bunch of audio samples and put the highest in samplepeak,
 *and add some entropy to rng_state.
 *The SPI output is done using bitbanged software SPI.
 *Contains machine specific code as ADC commands, ADC reads, and pin output register assignments
 **/
void
sample(void)
{
    //In the outer loop we iterate over all lights. in each of the three inner loops we iterate
    //over the bits in the red,green,and blue values of the light chosen by the outer loop.
    //we use soft bit-banged SPI to simplify things, and to act as a sort of delay.
    //In between colors, we do the audio sampling routine for a total of (activefixtures*3 colors)
    //samples per frame.

    rng_state = rng_state + GetAdcResult(); //use audio to add to my entropypool
    for (i = 0; i < ActiveFixtures; i++)
    {

        ThisSample = GetAdcResult(); //Get an ADC readng for sound input.
        StartAnalogToDigitalConversion();
        //Envelope follower, when this functon ends samplepeak contains the highest value.
        if (ThisSample > SamplePeak)
        {
            SamplePeak = ThisSample;
        }

        for (j = 128; j > 0; j = j >> 1)
        {
            CK_LOW();
            NOP();
            if ((lights[i].r) & j)
                MOSI_HIGH();
            else
                MOSI_LOW();
            NOP();
            CK_HIGH();
            NOP();
        }

        ThisSample = GetAdcResult(); //Get an ADC readng for sound input.
        StartAnalogToDigitalConversion();
        //Envelope follower, when this functon ends samplepeak contains the highest value.
        if (ThisSample > SamplePeak)
        {
            SamplePeak = ThisSample;
        }

        for (j = 128; j > 0; j = j >> 1)
        {
            CK_LOW();
            NOP();
            if ((lights[i].g) & j)
                MOSI_HIGH();
            else
                MOSI_LOW();
            NOP();
            CK_HIGH();
            NOP();
        }

        ThisSample = GetAdcResult(); //Get an ADC readng for sound input.
        StartAnalogToDigitalConversion();
        //Envelope follower, when this functon ends samplepeak contains the highest value.
        if (ThisSample > SamplePeak)
        {
            SamplePeak = ThisSample;
        }

        for (j = 128; j > 0; j = j >> 1)
        {
            CK_LOW();
            NOP();
            if ((lights[i].b) & j)
                MOSI_HIGH();
            else
                MOSI_LOW();
            NOP();
            CK_HIGH();
            NOP();
        }
        CK_LOW();
    }

}