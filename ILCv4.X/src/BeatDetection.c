/**@file beat.c
 * @author Daniel Black
 * @details This file handles the detection of beats. The algorithm used is a custom algorithm called
 * VU-DFS (Volume Level Dual Filter Summation)
 * Which compares the ratio of the current level to a filtered average of the recent level.
 * Two detectors are used, each with its own filter time constant
 * (both are first order IIR filters with exponntial impulse responses in this implementation)
 * And threshold level. A beat is detected when the threshold is passed for either both filters AND the input signal has a positive second derivative.
 * This will prevent evenly or logarithmically increasing sounds from triggering multiple beats. 
 * 
 * If you want to change the constants, Please make an acesss routine rather then declaring them public.
 * @date Feb2012
 *
 *
 */
#include "global.h"
#include "data.h"
#include "DSP.h"
/**A lowpass filtered version of samplepeak filtered with a faster time than SlowRecentPeakAverage*/
unsigned short FastRecentPeakAverage;
/**A lowpass filtered version of samplepeak filtered with a slower smoothing fliter than FastRecentPeakAveerage*/
unsigned short SlowRecentPeakAverage; //Not static in case a user mode wants acess to the average VU level.
/**The amount that beattmr is reduced by every beat.*/
/**the beat backoff refractory period timer. increased by one every frame*/
static unsigned char BeatTimer; //time in frames since last beat occured
/**a temporary short for various things*/
static unsigned short TempShort;
/**How much to reduce beattmr by every time we detect a beat*/
/**static*/ unsigned char BeatTimerBackOff = 5;
/**the beat detector threshold*/
unsigned char SlowSampleThreshold = 189;
/**A faster sample threshold for the second filter. both must detect a beat for one to be triggered.*/
unsigned char FastSampleThreshold = 170;
/**The limit to how high beattmr can be*/
static unsigned char BeatTimerMaximum = 83;
/**If beattmr is lower than this a beat will not be triggered*/
static char AbsoluteBeatLimit = 5;
/**A filter length setting for the envelope follower that the current audio level is compared to to find beats, higher values are faster*/
static unsigned char SlowFilterSpeed = 89;
/**A faster filter length for VeryRecentPeaks*/
static unsigned char FastFilterSpeed = 169;
/**An accumulator that tries to detect the magnitue of the AC component of the envelope */
static short AccumulatedDerivativeEnvelope;
/**The a fifo of the last few samples ro check for a positive second derivative*/
static unsigned char lastsample, lastsample2;
//from modes.h, Passes control to the current mode's beat handler
void BeatMode ();

//check if a beat has occurred this frame. call every frame.

/**Check if a beat has occurred this frame by using the input data from sample(). The algortihm
 works by comparing the ratio of the peak volume of this frame to an average of previous frames.*/
void
DetectBeat ()
{
  if (BeatTimer <= BeatTimerMaximum)
    {
      BeatTimer = BeatTimer + 1;
    }


  TempShort = SamplePeak;
  TempShort = TempShort << 7;

  /*
  If the ratio of the current sample to the average of recent samples is high enough
  the average of recent samples isstored as an int for more resolution so we divide by 2^8
  and it is not an overflow and it is not tooo soon after last time,
  Trigger a beat and reduce the beat timer by the backoff.
  Note that we have TWO beat detectors with different values of "recent" i.e different time constant.
  We AND their outputs together to produce the final output.*/

  //Check if the timer has enough to trigger a beat
  if (BeatTimer > AbsoluteBeatLimit)
    {
      //If at least one detector says there is a beat trigger one.
      if (((TempShort / FastRecentPeakAverage) > FastSampleThreshold) | ((TempShort / SlowRecentPeakAverage) > SlowSampleThreshold))
        {
          //Check for a positive SECOND derivative to catch SOME double beat errors
           if ((((unsigned short) SamplePeak << 8) / ((unsigned short) lastsample+1 )) > (((unsigned short) lastsample << 8) / ((unsigned short) (lastsample2+1))))
///          if ((s_sub (SamplePeak, lastsample) > s_sub (lastsample, lastsample2)))
            {
              //beatmode() dispatches to the appropriate handler based on the current mode.

              BeatMode ();
              //This peice of code avoids underflow when reducing the counter
              if (BeatTimer >= BeatTimerBackOff)
                BeatTimer = BeatTimer - BeatTimerBackOff;
              else
                BeatTimer = 0;



            }
        }
    }


  //new code using fast precomputed division by interpolation
  //Basically we simulate an RC filter to average over the last few frames.
  //we make x copies of the filter state, y copies of the new value, take the sum.
  //First filter
  TempShort = SlowRecentPeakAverage;
  SlowRecentPeakAverage = SamplePeak * SlowFilterSpeed;
  SlowRecentPeakAverage += TempShort * (255 - SlowFilterSpeed);
  SlowRecentPeakAverage = SlowRecentPeakAverage >> 8;
  //Second filter, same algorith with different variables and constants.
  TempShort = FastRecentPeakAverage;
  FastRecentPeakAverage = SamplePeak * FastFilterSpeed;
  FastRecentPeakAverage += TempShort * (255 - FastFilterSpeed);
  FastRecentPeakAverage = FastRecentPeakAverage >> 8;
  //Do FIFOing
  lastsample2 = lastsample;
  lastsample = SamplePeak;

  SamplePeak = 0;

}

