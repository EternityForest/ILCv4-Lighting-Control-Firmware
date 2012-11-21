/**
 *@file aqua.c
 *@author Daniel Black
 *@details The modefile for water ripple simulation.based on the summation of 3 sinusoid waves with
 * a bit of jitter in each one
 *@date February 2012
 */
#include "global.h"
#include "data.h"
//A water ripple simulator based on summing 3 sine waves
static unsigned char phase1, phase2, phase3, phase1start, phase2start, phase3start, phase4, phase4start, k, z;
//we declare variables for the phase at light 1 and for the phase at light n

/**
 * The water ripple frame update function
 *
 */
void Aqua()
{
    z = (z >> 1)+(random() >> 1); //lowpass random

    phase1 = phase1start;
    phase2 = phase2start;
    phase3 = phase3start;
    phase4 = phase4start;
    for (k = 0; k < ActiveFixtures; k++)
    {
        lights[k].b = (lights[k].g>>1)+128;
        //holding b at constant we change g based on the sum of four sine waves
        lights[k].g = (sin[phase1] >> 3) + (sin[phase2] >> 3) +(sin[phase4] >> 3) + (sin[phase3] >> 3);
        lights[k].r = lights[k].g >> 2;
        phase1 = phase1 + 3;
        phase2 = phase2 + 5;
        phase3 = phase3 + 7;
        phase4 = phase4 + 11;
    }
    phase1start = phase1start + 12;
    phase2start = phase2start + 16;
    phase3start = phase3start + 20;
    phase4start = phase4start + 22;
}