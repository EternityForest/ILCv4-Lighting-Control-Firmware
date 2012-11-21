/**@file FukaiMori.c @author Daniel Black @details A modefile intended to remind of a forest*/

#include "global.h"
#include "data.h"

static unsigned char phase1, phase2, phase3, phase1start, phase2start, phase3start, phase4, phase4start, k, z;
//we declare variables for the phase at light 1 and for the phase at light n

/**
 * The frame update function. We sum 4 sine waves as in Aqua() but this time for green,
 *  then we add little flashy decorations by randomly setting the r and b values
 *
 */

void FukaiMori()
{
    z = (z >> 1)+(random() >> 1); //lowpass random

    phase1 = phase1start;
    phase2 = phase2start;
    phase3 = phase3start;
    phase4 = phase4start;
    for (k = 0; k < ActiveFixtures; k++)
    {
        lights[k].gdest = (sin[phase1] >> 3) + (sin[phase2] >> 3) +(sin[phase4] >> 3) + (sin[phase3] >> 3);
        lights[k].rdest = 0;
        lights[k].bdest = 0;
        phase1 = phase1 + 7;
        phase2 = phase2 + 15;
        phase3 = phase3 + 26;
        phase4 = phase4 + 31;

    }

    phase1start = phase1start + 7;
    phase2start = phase2start + 15;
    phase3start = phase3start + 21;
    phase4start = phase4start + 31;
}

/**Add little twinkling decorations to FukaiMori*/
void FukaiMoriDecorations()
{
for (k = 0; k < ActiveFixtures; k++)
    {
		if (random() > 206)
        {
            if (random() > 254)
            {
                lights[k].r = 255;
            }
            if (random() > 254)
            {
                lights[k].b = 255;
            }
        }
	}
}