/**
 * @file frame.c
 * @author Daniel Black
 * @details Handles fading based on each lights current color destination color and rate.
 * @date February 2012
 *
 */
#include "global.h"

/**The default fade rate for any mode that does not specify its own*/
unsigned char rate = 7;
/**the number of lightin fixtures to process*/
unsigned char ActiveFixtures = 100;
/**the array of lights representing the output device or devices*/
struct Fixture lights[110];



/**The function that does all the stuff. It just updates the r g and b values of every fixture based on the aforementioned fare rate and destination registers.
 This operates on the lights[] array and uses activefixtures to determine its length.*/
static unsigned char i;

void
DoAutomaticFading ()
{
  for (i = 0; i < ActiveFixtures; i = i + 1)
    { // iterate over lights
      if (lights[i].rdest > lights[i].r)
        { // check if the red
          // channel is going ip or
          // down.
          //compare difference to rate to avoid overshoot
          if ((lights[i].rdest - lights[i].r) > lights[i].rate)
            {
              //update channel
              lights[i].r = lights[i].r + lights[i].rate;
            }
          else
            {
              //if the current is withing rate of dest go to dest.
              lights[i].r = lights[i].rdest;
            }
        }
      else
        { // if going up
          if ((lights[i].r - lights[i].rdest) > lights[i].rate)
            {
              lights[i].r = lights[i].r - lights[i].rate;
            }
          else
            {
              lights[i].r = lights[i].rdest;
            }
        } // //////

      if (lights[i].gdest > lights[i].g)
        { // check if the g channel
          // is going ip or down.
          //compare difference to rate to avoid overshoot
          if ((lights[i].gdest - lights[i].g) > lights[i].rate)
            {
              //update channel
              lights[i].g = lights[i].g + lights[i].rate;
            }
          else
            {
              //if the current is withing rate of dest go to dest.
              lights[i].g = lights[i].gdest;
            }
        }
      else
        { // if going up
          if ((lights[i].g - lights[i].gdest) > lights[i].rate)
            {
              lights[i].g = lights[i].g - lights[i].rate;
            }
          else
            {
              lights[i].g = lights[i].gdest;
            }
        } // //////

      if (lights[i].bdest > lights[i].b)
        { // check if the red
          // channel is going ip or
          // down.
          //compare difference to rate to avoid overshoot
          if ((lights[i].bdest - lights[i].b) > lights[i].rate)
            {
              //update channel
              lights[i].b = lights[i].b + lights[i].rate;
            }
          else
            {
              //if the current is withing rate of dest go to dest.
              lights[i].b = lights[i].bdest;
            }
        }
      else
        { // if going up
          if (((lights[i].b) - (lights[i].bdest)) >
              (lights[i].rate))
            {
              lights[i].b = lights[i].b - lights[i].rate;
            }
          else
            {
              lights[i].b = lights[i].bdest;
            }
        } //

    }

}