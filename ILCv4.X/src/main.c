/**
//@file main18f25k22.c
//@details Inteligent Lighting Control (C) 2011 Daniel Dunn GPLv3                    |
//*/
 
#include "device_18F25K22.h"//Put this at the top
#include "global.h"

/**The main scheduleing loop. it just calls frame,sample,and domode repeatedly*/

extern void sample();
extern void DetectBeat();
extern void BeatMode();
extern void sample();
extern void DoAutomaticFading();
extern void DoMode();
extern void SetMode(unsigned char);
extern void setup_rng();
extern void ui();


/**Main function Initializes some things then goes into a loop that checks for a beat,
 *runs the I/O frontend by calling sample(), calls the frame updater frame(),
 *then calls domode to do whatever the current mode does.*/
void main()
{
    SetMode(0); //initialze sound reactive mode. Should use a named constant.
    setup_rng();
    InitMachineSpecificStuff();
    //voodoo bugfix for wmul cannot resolve identifier product error
    1*7;

    while (255) {
        ui(); //Do user interface, check button state and change mode if needed
        DetectBeat(); //detect a beat using data from sample
        sample(); //handle input and output
        DoAutomaticFading(); // handle all the behind the scenes fades and stuff.
        DoMode(); //do whatever the current mode does every frame
    }

}

