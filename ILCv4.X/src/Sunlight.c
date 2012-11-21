/**@file sunlight.c @author Daniel Black @details A mode intended to approximate dappled sunlight @date February 2012*/


#include "global.h"
#include "data.h"
//A sunlight ripple simulator based on summing 4 sine waves
static unsigned char phase1, phase2, phase3, phase1start, phase2start, phase3start, phase4, phase4start, k, z;
//we declare variables for the phase at light 1 and for the phase at light n

/**
 * The Sunlight ripple frame update function
 *
 */
void Do_SunlightSim()
{
    z = (z >> 1)+(random() >> 1); //lowpass random

    phase1 = phase1start;
    phase2 = phase2start;
    phase3 = phase3start;
    phase4 = phase4start;
    for (k = 0; k < ActiveFixtures; k++)
    {

        lights[k].g = (sin[phase1] >> 3) + (sin[phase2] >> 3) +(sin[phase4] >> 3) + (sin[phase3] >> 3);
        lights[k].r = lights[k].g;
        lights[k].b = (lights[k].g >> 2) + lights[k].g>>3;
        phase1 = phase1 + 7;
        phase2 = phase2 + 15;
        phase3 = phase3 + 26;
        phase4 = phase4 + 31;
    }
    phase1start = phase1start + 1;
    phase2start = phase2start + 3;
    phase3start = phase3start + 8;
    phase4start = phase4start + 9;
}