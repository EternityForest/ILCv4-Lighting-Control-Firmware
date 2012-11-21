/**
 *@file global.h
 *@author daniel black
 *@date February 2012
 *@details Contains global variable declarations
 */
#define Global_Is_Included

/**the number of lightin fixtures to process*/
//Global so that effects know how much lighting data to work on
extern unsigned char ActiveFixtures;
/**A structure representing one lighting fixture of the rgb variety.
 * Defines a current color, a destination color(how much per frame)
 * and a rate to fade at. also defines the unused feature updated.
 * fading is handled by fade in autoframefade.h
 */

/**A sctruct representing one light fixture and it's state, Supporting variable rate fading and 24 bit color.*/
struct Fixture
{
   /**the maximum rate to fade at. if 255, go directly to color. Rate units are in value per frame, so the
    fading is linear. Fading is done in the RGB colorspace*/
    unsigned char rate;
   /**current red value*/
    unsigned char r;
 /**current green value*/
    unsigned char g;
   /**current blue value*/
    unsigned char b;
    /**blue destination value*/
    unsigned char bdest;
    /**red destination value*/
    unsigned char rdest;
    /**green destination value*/
    unsigned char gdest;
    /**has this light been updated since the value
     *was transmitted or acted upon? is really a bool.
     *not used anywhere but is serving as padding.
     */
    unsigned char updated;
};
/**an RGB light color datatype*/
struct Color {
/**red value of this color*/
    unsigned char red;
	/**green value of this color*/
    unsigned char green;
	/**blue value of this color*/
    unsigned char blue;

};

typedef struct Fixture fixture;
/**the array of lights representing the output device or devices*/
//Global because it is how effects affets the output
extern fixture lights[]; // an array of fixtures representing all active lights[i]..

/**an entropy pool made by addng the aufo to this var. used to mix into rc4 to create variation*/
//Global so that more entropy can be added
extern unsigned char rng_state;

 /**the peak sample of this frame*/
 //global so that user effects can acess the raw audio
extern unsigned char SamplePeak;

/**The random number generator*/
//Global becuse randomness is a common function
extern unsigned char random(void);

/**The default fade rate for any mode that does not specify its own.*/
extern unsigned char rate;

/**The "agressiveness" vs "Softness" parameer as detected by the beat detector*/
extern signed char Beatosity;
