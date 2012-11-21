/**
 * @file fireflies.c
 * @author Daniel Black
 * @details This is the modefile for the main firefly simulator
 * @date February 2012
 * @bug could stand a little realism improvment
 */

#include "global.h"
/** This struct contains the data for one virtual firefly*/
struct FireFly
{
  unsigned char position, destination;

};
/** An array containng all the fireflies*/
static struct FireFly fireflies[9];
/** the total number of fireflies "onscreen" at once*/
static unsigned char maxfireflies = 8;
static unsigned char firefly, fireflycounter,i;
/** the number of frames before we randomly start moving a firefly*/
static unsigned char fireflycounterlimit = 25;

/**The primary frame updater for the firefly mode*/
void
Do_fireflies (void)
{

  for (i = 0; i < ActiveFixtures; i++)
    {
      lights[i].rdest = 45+lights[i].rdest>>2 ;
      lights[i].gdest = 20+lights[i].gdest>>2 ;
      lights[i].bdest =  12;
      lights[i].rate = 6;
    }
  for (firefly = 0; firefly < maxfireflies; firefly++)
    {
      lights[fireflies[firefly].position].gdest = 255;
      lights[fireflies[i].position].rdest = 250;

      if (fireflycounter & 3) //only move fireflies every fourth frame
        {
          //Move all fireflies towards their destination at rate 1 per frame.
          if (fireflies[firefly].position < fireflies[firefly].destination)
            {
              if (fireflies[firefly].position < ActiveFixtures)
                {
                  fireflies[firefly].position = fireflies[firefly].position + 1;
                }

            }
          else
            {
              if (!((fireflies[firefly].position == 0)|(fireflies[firefly].position == fireflies[firefly].destination)))
                {
                  fireflies[firefly].position--;
                }
            }

        }
    }

  fireflycounter = fireflycounter + 1;
  if (fireflycounter > fireflycounterlimit)
    {
      fireflycounter = 0;
      //randomly change the destination of a random firefly to something 0-activefixtures
      fireflies[(((int) random ()) / (int) (255 / maxfireflies))].destination = ((int) random ()) / ((int) 255 / ActiveFixtures);
    }
}
