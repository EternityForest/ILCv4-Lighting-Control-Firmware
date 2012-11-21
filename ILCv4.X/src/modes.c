/**
 * @file modes.c
 * @author Daniel Black
 * @details A file containing neccesary functions to initialize and run
 * different modes of operation. 
 * @date February 2012
 */
#include "global.h"
//Declarations And Prototypes
#define SOUNDREACTIVEMODE 0
extern void soundreactive_init ();
extern void SoundReactive_Beat ();

#define LIGHTEGG 1
extern void LightEgg ();
#define LIGHTEGGSOUNDREACTIVE 2
extern void Beat_LightEgg ();
#define TWINKLECANDLE 3
extern void Wyndhame1 ();
#define REALCANDLE 4
extern void Wyndhame2 ();
#define AQUA 5
extern void Aqua ();
#define FIREFLIES 6
extern void Do_fireflies ();
#define SPARKSFLY 7
extern void SparksFly ();
extern void init_SparksFly ();
#define FUKAIMORI_A 8
extern void FukaiMori ();
#define FUKAIMORI_B 9
extern void FukaiMori ();
extern void FukaiMoriDecorations ();
#define SUNLIGHTSIM 10
extern void Do_SunlightSim ();
#define TEST 11

/**A variable holding the current lighting mode fir the entire system*/
/*static*/ unsigned char mode = 0;
static unsigned char i;

extern void DoMode ();
extern void InitMode ();
extern void BeatMode ();
extern void SetMode (unsigned char);

//An all white mode for testing.
static void
TestMode ()
{
  for (i = 0; i < ActiveFixtures; i += 1)
    {
      lights[i].updated = 1;
      lights[i].rdest = 255;
      lights[i].gdest = 255;
      lights[i].bdest = 255;
    }
}

/**A function that calls the frame update function of the current mode,
 * Based only on the mode variable.
 */
void
DoMode ()
{
  //Based on the current mode, run one fra
  {
    switch (mode)
      {
      case SOUNDREACTIVEMODE:
        //Dont do anything, wait for a beat to be triggered.
        //Dont delete this case
        break;

      case LIGHTEGG: //A color therapy style slow rainbow fade
        LightEgg ();
        break;
      case LIGHTEGGSOUNDREACTIVE:
        LightEgg (); //Exact same as above but with a beat handler in dobeat.
        break;
      case TWINKLECANDLE:
        Wyndhame1 ();
        break;
      case REALCANDLE://A electronic candle simulation
        Wyndhame2 ();
        break;
      case AQUA:
        Aqua ();
        break;
      case FIREFLIES:
        Do_fireflies ();
        break;
      case SPARKSFLY:
        SparksFly ();
        break;
      case FUKAIMORI_A:
        FukaiMori ();
        break;
      case FUKAIMORI_B:
        FukaiMori ();
        FukaiMoriDecorations ();
        break;
      case SUNLIGHTSIM:
        Do_SunlightSim ();
        break;
        /*
         case TEST:
        TestMode();
        break;
         */
      default:
        //If you go past the last mode wrap to 0.
        SetMode (0);
        break;
      }
  }
}

/**
 * A function that initializes the mode pointed to by the mode variable
 */
void
InitMode ()
{
  //Based on the current mode
  if (mode < 32)
    {
      switch (mode)
        {
        case 0:
          soundreactive_init ();
          break;
        case SPARKSFLY:
          init_SparksFly;
          break;
        }
    }
}

/**Beat event handler. Finds the beat handler of the eslected mode and calls it.*/
void
BeatMode ()
{
  switch (mode)
    {
    case SOUNDREACTIVEMODE:
      SoundReactive_Beat ();
      break;
    case LIGHTEGGSOUNDREACTIVE:
      //This mode is the same as normal light egg but with this beat specifier.
      Beat_LightEgg ();
      break;
    }
}

/**Returns the current mode's number. @returns The number of the current mode*/
unsigned char
GetMode ()/**Returns the current mode's number.*/

{
  return (mode);
}

/**Set the current mode to newmode and initialize it.
 * @param newmode as unsigned char the new mode
 */
void
SetMode (unsigned char newmode)
{
  mode = newmode;
  InitMode ();
}
