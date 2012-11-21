/**
 *@file User_Interface_Button.c
 *@author Daniel Black
 *@details A file containing the user interface with one button.
 *Press for the next mode modulo the number of modes.
 *We can pretty much ignore switch bounce because this is only called once per 33ms or so frame.
 *bounce might occur ocasionnaly but i have not found it to be a problem.
 *Exact pin assignments for the button are in the device file.
 */


#include "device_18F25K22.h"
extern void SetMode(unsigned char newmode);
extern unsigned char GetMode();

/**Was the button pressed in the last frame?*/
static unsigned char ButtonAlreadyPressed;

static unsigned char t;

/**Ui handler*/
void
ui()
{
    if (Button_Depressed)
    {
        /*If the button was already pressed last frame do nothing*/
        if (ButtonAlreadyPressed)
        {

        }
        else
        {
            /*If the button was just now presse and was not last frame,
             *  get the mode, increment it,
             *  set a flag saying the button was released
             */
            t = GetMode();
            SetMode(1 + t);
            ButtonAlreadyPressed = 1;
        }
    }
    else //If the button is currently released
    {
        ButtonAlreadyPressed = 0;
    }
}