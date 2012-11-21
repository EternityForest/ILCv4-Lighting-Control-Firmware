/** @file SparksFly.c
 *  @author Daniel Black
 *  @details A mode where electical arcs are simulated. 
 */

#include "global.h"

static unsigned char i,j,t;

/**A struct representing one electrical arc*/
struct arc
{
    /**Where is the arc*/
    unsigned char position;
    /**Is the arc on or off*/
    unsigned char on;
};

static struct arc arcs[15];

/**Initializer for SparksFly*/
void init_SparksFly()
{
    for (i = 0; i < ActiveFixtures; i++)
    {
        lights[i].rdest = 0;
        lights[i].gdest = 0;
        lights[i].bdest = 0;
        lights[i].rate = 26;
    }
}

/**Per frame update function for SparksFly*/
void SparksFly()
{
    for (i = 0; i <16; i++)
    {
        if (arcs[i].on)
        {
            lights[arcs[i].position].rdest = 188;
            lights[arcs[i].position].gdest = 160;
            lights[arcs[i].position].bdest = 255;
            lights[arcs[i].position].rate = 60;
        }
        else
        {
            lights[arcs[i].position].rate = 30;
            lights[arcs[i].position].rdest = 26;
            lights[arcs[i].position].gdest = 60;
            lights[arcs[i].position].bdest = 40;
        }
        if (random() > 211)
        {
            arcs[i].on = 255^arcs[i].on; //toggle weather or not the arc is lit
        }
        if(random()>240)
        {
            for(j=0;j<200;j++)
            {
                t = random();
                if (t<ActiveFixtures)
                {
                    arcs[i].position = t;
                }
            }
        }
    }

}




