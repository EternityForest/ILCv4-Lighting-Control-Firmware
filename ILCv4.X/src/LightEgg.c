/**
 *@file LightEgg.c
 *@author Daniel Black
 *@details A slow fading rainbow modefile. All lights are the same in this mode.
 *has 256*6 colors and uses no multiplies.
 *@date February 2012 based on earlier work by same author 
 */
#include "global.h"
/**A variable containing an index into a 6 entry color table as the destination color*/
static unsigned char color;
/**The current color as 3 variables one each for red green and blue, Red component*/
static unsigned char red;
/**The current color as 3 variables one each for red green and blue, Green component*/
static unsigned char green;
/**The current color as 3 variables one each for red green and blue,Blue component*/
static unsigned char blue;
/**three tables for the rgb components of the 6 entry color table,Green component*/
const static unsigned char redtable[8] = {255, 0, 0, 0, 255, 255}; //a table of rgb values to be
/** Blue color table */
const static unsigned char bluetable[8] = {0, 0, 255, 255, 255, 0}; //interpolate for a rainbow
/** Green color table */
const static unsigned char greentable[8] = {255, 255, 255, 0, 0, 0};

//const static Color rainbow[8] = {{255,0,255},{0,0,255},{0,255,255},{0,255,0};
static unsigned char i, j;

#define movingtowards color //because lower  i is a frame counter, get a few bits for the



/**@breif the update function.the idea of the rainbow algorithm is to figure out the next color from the current color
while not using an intermediate variable to hold the location along a spectrum
to do this we rely on the fact that only one color changes at atime so we get which ofrgb
is not equal to the destination color from a table and move it towards by 1
if all colors are the right color, increment the destination register by 1. if the destination register is above 5(5 points to the 6th color) reset it to 0.
 */
void LightEgg()
{
    j = redtable[movingtowards]; //using j as a temp to only acess the array once
    if ((!(red == j))) //if red is not the same as the destination, red must be changing
    { //therefore we dont need to check the other colors.
        if (red > j) //small errors in other colors will be dealt with once redarrives
        { // so it does not contain lots of obvious unrecoverable states.
            red -= 1; //red
        }
        else {
            red += 1; //red
        }

    }
    else //if rednot there yet
    {
        j = bluetable[movingtowards];
        if (!(blue == j)) {
            if (blue > j)//bwds
            {
                blue -= 1; //blue
            }
            else {
                blue += 1; //blue
            }

        }//else
        else {
            j = greentable[movingtowards];
            if (!(green == j)) {
                if (green > j) {
                    green -= 1; //green
                }
                else {
                    green += 1; //green
                }

            }
            else {

                color += 1; //increment movingtowards, leav loop counter alonei
                if (color > 5) {
                    color = 0; //reset color registeri
                }


            }
        }
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].rdest = red;
        lights[i].gdest = green;
        lights[i].bdest = blue;
        lights[i].rate = 28;
        //It wont ever need to fade this fast, but other effecs can modify the direct r.
        //In effect we are just directly setting the value
    }
}

/**Light egg Beat Handler.*/
void Beat_LightEgg()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].r = 128;//not 255 for aesthetic reasons.
        lights[i].g = 128;
        lights[i].b = 128;
    }

}