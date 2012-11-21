/**
 *@file DSP.c
 *@author Daniel Black
 *@details DSP math functions
 */
#include "DSP.h"

/**subtract a from b saturating at 0*/
unsigned char
s_sub (unsigned char a, unsigned char b)
{

  if (a > b)
    {
      return (a - b);
    }
  else
    {
      return (0);
    }
}

/**Add a+b saturating at 255*/
unsigned char
s_add (unsigned char a, unsigned char b)
{

  if ((a + b) > a)
    {
      return (a + b);
    }
  else
    {
      return (255);
    }
}
