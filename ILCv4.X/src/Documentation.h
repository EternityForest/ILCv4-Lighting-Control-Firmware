/** @page AddNewEffect Adding new effects:
@par Introduction:
With the ILC3 lighting system, addding new effects becomes very easy.
Simply write your effect as one required function which will be called one time per frame,
An optional initializer, an otional beat handler, and put them in one file.
Add your effect to the switch statement in dommode() in modes.c. beat handler in the switch statement in beatmode(), and initialization routines in the switch statment in initmode();
assigne a mode number by adding a #define to the top, and thats it! if you need an initializer do the same for it, but with initmode(). The switch statement and tasks will do the rest for you, you only need to worry about your artistic vision!. Note: You must include the file "global.h" in your modefile to acess lights[],random(),etc.

@par API reference:
To create your light show, the main data structure to think about is lights[]. 
lights[] is an array of Fixture, a type representing one RGB full color light of some type.
The number of these is given in unsigned char activefixtures, defined in Frame.c .
the data structure called fixture contains r,g,b:three unsigned char variables to hold the current color,
rdest,gdest,bdest, three unsigned char variables for the destination color,
and rate, another unsigned char that holds the rate at which it will move to the destination color.
This allows you to do a number of cool things:
- Fade to a color: Set only the gdest,rdest,and bdest registers
- Jump to a color then fade to another color: set the r,g,b vars to the jump color and the dest vars to fade.
- Jump to a color and stay there: set both the color and destination color to the same color.

By setting these values, they will automatically fade as specified and the output will output.
This lets all the effects and modes share the same framework, letting you pack many effects onto one chip,
and save time witing it!

\par Resources Availible to You:
The underlying framework provides several commonly used features including:
\par A sine table:
	sin[] is a 256 byte array containing one full period of a sine wave ranging from 0-255.
\par A PseudoRandom number generator:
	random() will quickly return an 8 bit random value produced by a modified RC4 algorithm that uses audio
	input or RF background noise to avoid repeating every time you turn it on.
 \par Frame Rate Issues:
 Most likely, you will not have acess to the exact frame rate except by testing.
 The frame rate is determined by a combination of the CPU speed, The number of fixtures, The fixture
 interface, the front end code, the amount of time an effect takes to process.
 if you really need exact frame rates you can use the hardware times to measure and compensate.
 generally the frame rate will be between 20 and 120 frames per second, similar to video rates.
 In practice it has not caused problems so far.
 
*/

/**@mainpage
This is the documentation for the ILC3 sound reactive lights system. Some core features:
- Ability to define and switch between modes and create new modes easily(see \ref AddNewEffect)
- Ability to define output devices and switch between them easily
- Modular structure allows creating new mode quickly
- Beat detection engine
- Sound reactive mode that creates an intelligent high quality lighshow in response to any music.
- Low performance requirements allow 100 fixture or more shows on 8 bit devices.
- Machine specific code isolated to one device.h file
- Modes implemented so far include a water ripple, beta candle simulation, rainbow fades,etc.


Road Map:
-Better support for consistant frame rates
-Arduino Port
-DMX512 support

\par Note:
*/

/**@page understanding Understanding this code:
 * This is ashort guide to potentialy confusing aspects of this code:
 * - Some variables are not documented. These are mst likey temps.
 * - 
