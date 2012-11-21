/** @file twinklecandle.c
 *  @author Daniel Black
 *  @details A candle simeulator
 */

#include "global.h"

/**Maximum value a realistic candle can have for green*/
static unsigned char candlermax = 255;
/**Maximum value a realistic candle can have for red*/
static unsigned char candlegmax = 255;
/**Maximum value a realistic candle can have for b*/
static unsigned char candlebmax = 50;
/**risetime of a realistic mode virtual flame*/
static unsigned char CandleFlickerUpRate = 15;
/**fall time of a realistic mode virtual flame*/
static unsigned char CandleFlickerDownRate = 7;
/**In realistic mode, a the Blue level is always (the red level times this)/256 */
static unsigned char BlueMultiplier = 38;
/**In realistic mode, a the Green level is always (the red level times this)/256*/
static unsigned char GreenMultiplier = 169;
/**How fast the virtual flame rises before the filtering*/
static unsigned char UpCounter = 1;
/**A representation of how likey it is that a realistic mode candle will flicker this frame.
 Higher Values == More Likely*/
static unsigned char FlickerChance = 19;


static unsigned char i, j;

/** A fantasy oriented rainbowy flicker*/
void
Wyndhame1 ()
{
  for (i = 0; i < ActiveFixtures; i++)
    {
      if (lights[i].rdest <= (255 - 8))
        {
          lights[i].rdest = lights[i].rdest + 8;
        }

      if ((lights[i].gdest <= ((128 + 64) - 8)))
        {
          lights[i].gdest = lights[i].gdest + 8;
        }

      if (lights[i].bdest <= (64 - 2))
        {
          lights[i].bdest = lights[i].bdest + 2;
        }


      if (random () < 65)
        {
          j = random ();
          lights[i].rdest = j;
          lights[i].gdest = (j >> 1) + j >> 2;
          lights[i].bdest = j >> 2;
        }

      if (lights[i].r < lights[i].rdest)
        {
          lights[i].rate = CandleFlickerUpRate;
        }
      else
        {
          lights[i].rate = CandleFlickerDownRate;
        }
    }
}

/**A more realistic virtual candle*/
void
Wyndhame2 ()
{
  for (i = 0; i < ActiveFixtures; i++)
    {
      if ((lights[i].rdest) <= (255 - 8))
        {
          lights[i].rdest = lights[i].rdest + UpCounter;
        }
      if (random () < FlickerChance)
        {
          lights[i].rdest = random ();
        }

      if (lights[i].r < lights[i].rdest)
        {
          lights[i].rate = CandleFlickerUpRate;
        }
      else
        {
          lights[i].rate = CandleFlickerDownRate;
        }
      //Set the other two channels to a fraction multiple of red.
      lights[i].g = ((((unsigned short) lights[i].r) * GreenMultiplier) >> 8);
      lights[i].b = ((((unsigned short) lights[i].r) * BlueMultiplier) >> 8);
    }
}
