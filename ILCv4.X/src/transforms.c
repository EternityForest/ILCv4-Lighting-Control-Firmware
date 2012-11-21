/**@file transforms.c
 *  @author Daniel Black
 *  @details The modefile for the entire sound reactive mode.
 *  Needs refactoring as a few critical peices are in another castle(file)
 */
//prototypes
#include "global.h"
/*data.h must not be included before global.h
because it uses data structures from that file*/
#include "data.h"


//Lighting transforms
void AllRed(void);
void AllBlue(void);
void AllOrange(void);
void AllGreen(void);
void FadeOrange(void);
void FadeYellow(void);
void AllYellow(void);
void AllGreen(void);
void FadeGreen(void);
void FadeBlue(void);
void AllPurple(void);
void FadeWhite(void);
void AllWhite(void);
void FadeRed(void);
void FadePurple(void);
void randomall(void);
void solodance(void);
void randomonnlyafew(void);
/// What is this doing here? void InterruptHandlerHigh(void);
void oneblink(void);
void gradientp(void);
void Flash(void);
void solodance2(void);
void randomall2(void);



static unsigned char i, j, genericiunsignedchartemp;

/**some metadata about an effect */
struct Effect // effect data
{
    /** a pointer to the effect code*/
    void (*effect) (void);

    /** a list of links to other effect(links are to code body) note that it might be undefined*/
    void (*possiblelink[5]) (void);
    /**a value representing the Link Probability*/
    unsigned char lp[5];
};
/** an instance of effect that has data about the current effect*/
static struct Effect activeeffect;

/**a color used by several effects that is kind of a theme color for the moment*/
struct Color dancecolor; // an "active" or "theme" color

/**Sound reactive mode beat handler. Hadles all the effect switch on beat functionality.
 *Contains crappy coding! Not even sure how it works but it does!
 * if the siund reactive mode has not been initialized a pointer violation will occur
 */
void SoundReactive_Beat() // beat handler
{
    for (i = 0; i < 200; i = (i + 1)) //try up to 10 times
    { // try all the effect
        // links and see what they
        // do.
        if ((random() < activeeffect.lp[i & 3]) & !(activeeffect.lp[i & 3] == 0))

           {
            for (j = 0; j < 5; j = j + 1) {
                activeeffect.lp[j] = 0;
            }
            activeeffect.effect = activeeffect.possiblelink[i & 3];
            activeeffect.effect();

            i = 208; // exit the loop after a
            // link is used. break
            // made bugs.
        }
    }
    {
        i = i - 1;
    }
}

/**
 * The initializer for the ILC3 sould reactive mode.
 * Initializes some important function pointers
 */
void soundreactive_init()
{
    //initialize the system into sound reactive mode.
    activeeffect.possiblelink[0] = &FadeBlue;
    activeeffect.possiblelink[1] = &FadeRed; // / no crap allowerd // init them!!!!
    activeeffect.possiblelink[2] = &FadeWhite;
    activeeffect.possiblelink[3] = &FadeGreen;
    activeeffect.possiblelink[4] = &FadeOrange;
    for (i = 0; i < ActiveFixtures ; i++)
    {
    lights[i].rate = rate;
    }
    activeeffect.lp[0] = 255;
}

//lighting efffects

//Lighting Effects that affect all lights equally

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllRed(void)
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 255;
        lights[i].g = 0;
        lights[i].b = 0;
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 0;
        lights[i].bdest = 0;
    }
    activeeffect.effect = &AllRed;
    activeeffect.possiblelink[0] = &AllOrange;
    activeeffect.possiblelink[1] = &solodance;
    activeeffect.possiblelink[2] = &FadeGreen;
    activeeffect.possiblelink[3] = &oneblink;
    activeeffect.lp[0] = 100 + 0;
    activeeffect.lp[1] = 95 + 0;
    activeeffect.lp[2] = 50 -0;
    activeeffect.lp[3] = 100 + 0;
    dancecolor.red = 255;
    dancecolor.blue = 0;
    dancecolor.green = 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllOrange()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 255;
        lights[i].g = 127;
        lights[i].b = 0;
        lights[i].rdest = 255;
        lights[i].gdest = 127;
        lights[i].bdest = 0;
    }
    activeeffect.effect = &AllOrange;
    activeeffect.possiblelink[0] = &FadeYellow;
    activeeffect.possiblelink[1] = &AllYellow;
    activeeffect.possiblelink[2] = &solodance2;
    activeeffect.lp[0] = 120 - 0;
    activeeffect.lp[1] = 70 + 0;
    activeeffect.lp[2] = 70 - 0;
    dancecolor.red = 255;
    dancecolor.blue = 0;
    dancecolor.green = 127;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllYellow()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 255;
        lights[i].g = 255;
        lights[i].b = 0;
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 255;
        lights[i].bdest = 0;
    }
    activeeffect.effect = &AllYellow;
    activeeffect.possiblelink[0] = &AllGreen;
    activeeffect.possiblelink[1] = &AllOrange;
    activeeffect.possiblelink[2] = &FadeGreen;
    activeeffect.possiblelink[2] = &randomonnlyafew;
    activeeffect.lp[0] = 110 + 0;
    activeeffect.lp[1] = 80 + 0;
    activeeffect.lp[2] = 100- 0;
    activeeffect.lp[2] = 100 + 0;
    dancecolor.red = 255;
    dancecolor.blue = 0;
    dancecolor.green = 255;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllGreen()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 0;
        lights[i].g = 255;
        lights[i].b = 0;
        lights[i].updated = 1;
        lights[i].rdest = 0;
        lights[i].gdest = 255;
        lights[i].bdest = 0;
    }
    dancecolor.red = 0;
    dancecolor.blue = 0;
    dancecolor.green = 255;
    activeeffect.effect = &AllGreen;
    activeeffect.possiblelink[0] = &AllBlue;
    activeeffect.possiblelink[1] = &solodance;
    activeeffect.possiblelink[2] = &FadeYellow;
    activeeffect.lp[0] = 100 + 0;
    activeeffect.lp[1] = 70 + 0;
    activeeffect.lp[2] = 100 - 0;

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllBlue(void)
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 0;
        lights[i].g = 0;
        lights[i].b = 255;
        lights[i].updated = 1;
        lights[i].rdest = 0;
        lights[i].gdest = 0;
        lights[i].bdest = 255;
    }
    activeeffect.effect = &AllBlue;
    activeeffect.possiblelink[0] = &AllPurple;
    activeeffect.possiblelink[1] = &FadeYellow;
    activeeffect.possiblelink[2] = &FadeGreen;
    activeeffect.possiblelink[3] = &randomonnlyafew;
    dancecolor.red = 0;
    dancecolor.blue = 255;
    dancecolor.green = 0;
    activeeffect.lp[0] = 100 + 0;
    activeeffect.lp[1] = 70 - 0;
    activeeffect.lp[2] = 70 - 0;
    activeeffect.lp[3] = 100+ 0;

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllPurple()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 192;
        lights[i].g = 0;
        lights[i].b = 255;
        lights[i].updated = 1;
        lights[i].rdest = 191;
        lights[i].gdest = 0;
        lights[i].bdest = 255;
    }
    activeeffect.effect = &AllPurple;
    activeeffect.possiblelink[0] = &AllRed;
    activeeffect.possiblelink[1] = &Flash;
    activeeffect.possiblelink[2] = &FadeWhite;
    activeeffect.possiblelink[3] = &solodance;
    activeeffect.lp[0] = 60 + 0;
    activeeffect.lp[1] = 100 + 0;
    activeeffect.lp[2] = 100 - 0;
    activeeffect.lp[3] = 100+0;
    dancecolor.red = 157;
    dancecolor.blue = 255;
    dancecolor.green = 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
AllWhite()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = 255;
        lights[i].g = 255;
        lights[i].b = 255;
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 255;
        lights[i].bdest = 255;
    }
    activeeffect.effect = &AllWhite;
    activeeffect.possiblelink[0] = &solodance;
    activeeffect.possiblelink[1] = &randomonnlyafew;
    activeeffect.possiblelink[2] = &Flash;
    activeeffect.possiblelink[3] = &FadeGreen;
    activeeffect.lp[0] = 100+0;
    activeeffect.lp[1] = 95+0;
    activeeffect.lp[2] = 50+0;
    activeeffect.lp[3] = 70-0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeGreen()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].rdest = 0;
        lights[i].gdest = 255;
        lights[i].bdest = 0;
        lights[i].updated = 1;

    }
    activeeffect.effect = &FadeGreen;
    activeeffect.possiblelink[0] = &FadeBlue;
    activeeffect.possiblelink[1] = &FadeYellow;
    activeeffect.possiblelink[2] = &randomonnlyafew;
    activeeffect.possiblelink[3] = &AllRed;
    activeeffect.lp[0] = 180-0;
    activeeffect.lp[1] = 95-0;
    activeeffect.lp[2] = 120+0;
    activeeffect.lp[3] = 100+0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeBlue()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].rdest = 0;
        lights[i].gdest = 0;
        lights[i].bdest = 255;
        lights[i].updated = 1;

    }
    activeeffect.effect = &FadeBlue;
    activeeffect.possiblelink[0] = &FadePurple;
    activeeffect.possiblelink[1] = &solodance;
    activeeffect.possiblelink[2] = &FadeRed;
    activeeffect.possiblelink[3] = &AllYellow;
    activeeffect.lp[0] = 190 - 0;
    activeeffect.lp[1] = 95 + 0;
    activeeffect.lp[2] = 50 - 0;
    activeeffect.lp[3] = 199+ 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadePurple()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].rdest = 191;
        lights[i].gdest = 0;
        lights[i].bdest = 255;
        lights[i].updated = 1;

    }
    activeeffect.effect = &FadePurple;
    activeeffect.possiblelink[0] = &solodance;
    activeeffect.possiblelink[1] = &oneblink;
    activeeffect.possiblelink[2] = &FadeBlue;
    activeeffect.possiblelink[3] = &AllRed;
    activeeffect.lp[0] = 150 + 0;
    activeeffect.lp[1] = 95 + 0;
    activeeffect.lp[2] = 120 - 0;
    activeeffect.lp[3] = 120+0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeWhite()
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 255;
        lights[i].bdest = 255;
    }
    activeeffect.effect = &FadeWhite;
    activeeffect.possiblelink[0] = &FadeBlue;
    activeeffect.possiblelink[1] = &randomall;
    activeeffect.possiblelink[2] = &randomonnlyafew;
    activeeffect.possiblelink[3] = &solodance;
    activeeffect.lp[0] = 120 - 0;
    activeeffect.lp[1] = 95 + 0;
    activeeffect.lp[2] = 129 + 0;
    activeeffect.lp[3] = 70 + 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeOrange() // big todo make this orange
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 127;
        lights[i].bdest = 0;
    }
    activeeffect.effect = &FadeOrange;
    activeeffect.possiblelink[0] = &FadeYellow;
    activeeffect.possiblelink[1] = &randomall2;
    activeeffect.possiblelink[2] = &FadeYellow;
    activeeffect.possiblelink[3] = &AllBlue;
    activeeffect.lp[0] = 140 - 0;
    activeeffect.lp[1] = 50 - 0;
    activeeffect.lp[2] = 50- 0;
    activeeffect.lp[3] = 70 + 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeYellow() // TODO see above
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 255;
        lights[i].bdest = 0;
    }
    activeeffect.effect = &FadeYellow;
    activeeffect.possiblelink[0] = &FadeGreen;
    activeeffect.possiblelink[1] = &randomonnlyafew;
    activeeffect.possiblelink[2] = &FadeBlue;
    activeeffect.possiblelink[3] = &solodance;
    activeeffect.lp[0] = 190 - 0;
    activeeffect.lp[1] = 50 + 0;
    activeeffect.lp[2] = 50 - 0;
    activeeffect.lp[3] = 70 + 0;
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
FadeRed() // //////////////////
{
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].rdest = 255;
        lights[i].gdest = 255;
        lights[i].bdest = 255;
    }
    activeeffect.effect = &FadeRed;
    activeeffect.possiblelink[0] = &FadeOrange;
    activeeffect.possiblelink[1] = &FadeYellow;
    activeeffect.possiblelink[2] = &gradientp;
    activeeffect.possiblelink[3] = &AllBlue;
    activeeffect.lp[0] = 190 - 0;
    activeeffect.lp[1] = 100 - 0;
    activeeffect.lp[2] = 50- 0;
    activeeffect.lp[3] = 70+ 0;
}

//effects that set individual lights:

/**Lighting effect. Sets State table metadata and changes lights*/
void
randomall()
{

    for (i = 0; i < ActiveFixtures; i += 1) {

        lights[i].updated = 1;
        lights[i].rdest = random();
        lights[i].gdest = random();
        lights[i].bdest = random();
        activeeffect.effect = &randomall;
        activeeffect.possiblelink[0] = &randomall;
        activeeffect.possiblelink[1] = &randomall2;
        activeeffect.possiblelink[2] = &randomonnlyafew;
        activeeffect.possiblelink[3] = &AllGreen;
        activeeffect.lp[0] = 170+ 0;
        activeeffect.lp[1] = 95-0;
        activeeffect.lp[2] = 70+0;
        activeeffect.lp[3] = 70-0;

    }

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
randomall2()
{

    for (i = 0; i < ActiveFixtures; i += 1) {

        lights[i].updated = 1;
        lights[i].rdest = random();
        lights[i].gdest = random();
        lights[i].bdest = random();
        activeeffect.effect = &randomall;
        activeeffect.possiblelink[0] = &randomall2;
        activeeffect.possiblelink[1] = &Flash;
        activeeffect.possiblelink[2] = &AllRed;
        activeeffect.possiblelink[3] = &AllGreen;
        activeeffect.lp[0] = 170-0;
        activeeffect.lp[1] = 97+0;
        activeeffect.lp[2] = 70+0;
        activeeffect.lp[3] = 70+0;

    }

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
randomalllookup()
{
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
randomonnlyafew()
{

    //This part of the code creates a non zero chance of switching up the dance color every beat.
    if (random() > 110) {
        //divide by 32 to get 1 to  as an index into the color data array
        genericiunsignedchartemp = random() % 8;
        // look up the colors in the array
        dancecolor.red = ColorDataForPreferredColors[genericiunsignedchartemp].red;
        dancecolor.blue = ColorDataForPreferredColors[genericiunsignedchartemp].green;
        dancecolor.green = ColorDataForPreferredColors[genericiunsignedchartemp].blue;
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        if (random() > 69) {
            lights[i].r = dancecolor.red;
            lights[i].g = dancecolor.green;
            lights[i].b = dancecolor.blue;
            lights[i].updated = 1;
            lights[i].rdest = dancecolor.red;
            lights[i].gdest = dancecolor.green;
            lights[i].bdest = dancecolor.blue;
        }
        else {
            lights[i].r = 0;
            lights[i].g = 0;
            lights[i].b = 0;
            lights[i].updated = 1;
            lights[i].rdest = 0;
            lights[i].gdest = 0;
            lights[i].bdest = 0;
        }
    }
    activeeffect.effect = &randomonnlyafew;
    activeeffect.possiblelink[0] = &randomonnlyafew;
    activeeffect.possiblelink[1] = &Flash;
    activeeffect.possiblelink[2] = &FadeBlue;
    activeeffect.possiblelink[3] = &solodance;
    activeeffect.lp[0] = 170+0; // very likely to repeat
    // self!!! this is how
    // it's supposed to be!
    activeeffect.lp[1] = 70+0;
    activeeffect.lp[2] = 50-0;
    activeeffect.lp[3] = 70+0;

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
twocolors()
{
}

/**Lighting effect. Sets State table metadata and changes lights*/
void
threecolors()
{
}

//special effects

/**Lighting effect. Sets State table metadata and changes lights*/
void
solodance() // create one color that seems to
// dance around the lights every beat.
{

    //This part of the code creates a non zero chance of switching up the dance color every beat.
    if (random() > 100) {
        //divide by 4 to get 1 to  as an index into the color data array
        genericiunsignedchartemp = (random() % 8);
        // look up the colors in the array
        dancecolor.red = ColorDataForPreferredColors[genericiunsignedchartemp].red;
        dancecolor.blue = ColorDataForPreferredColors[genericiunsignedchartemp].green;
        dancecolor.green = ColorDataForPreferredColors[genericiunsignedchartemp].blue;
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        if (random() > 127) {
            lights[i].r = dancecolor.red;
            lights[i].g = dancecolor.green;
            lights[i].b = dancecolor.blue;
            lights[i].updated = 1;
            lights[i].rdest = lights[i].r;
            lights[i].gdest = lights[i].g;
            lights[i].bdest = lights[i].b;
        }
    }

    activeeffect.effect = &solodance;
    activeeffect.possiblelink[0] = &solodance;
    activeeffect.possiblelink[1] = &FadeBlue;
    activeeffect.possiblelink[2] = &solodance2;
    activeeffect.possiblelink[3] = &gradientp;
    activeeffect.lp[0] = 200+0; // very likely to repeat
    // self!!! this is how
    // it's supposed to be!
    activeeffect.lp[1] = 100-0;
    activeeffect.lp[2] = 170-0;
    activeeffect.lp[3] = 70-0;

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
solodance2() // create one color that seems to
// dance around the lights every beat.
{

    //This part of the code creates a non zero chance of switching up the dance color every beat.
    if (random() > 100) {
        //divide by 4 to get 1 to  as an index into the color data array
        genericiunsignedchartemp = (random() % 8);
        // look up the colors in the array
        dancecolor.red = ColorDataForPreferredColors[genericiunsignedchartemp].red;
        dancecolor.blue = ColorDataForPreferredColors[genericiunsignedchartemp].green;
        dancecolor.green = ColorDataForPreferredColors[genericiunsignedchartemp].blue;
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        if (random() > 127) {
            lights[i].rdest = dancecolor.red;
            lights[i].gdest = dancecolor.green;
            lights[i].bdest = dancecolor.blue;
            lights[i].updated = 1;

        }
    }

    activeeffect.effect = &solodance;
    activeeffect.possiblelink[0] = &solodance2;
    activeeffect.possiblelink[1] = &FadeBlue;
    activeeffect.possiblelink[2] = &Flash;
    activeeffect.possiblelink[3] = &gradientp;
    activeeffect.lp[0] = 200-0; // very likely to repeat
    // self!!! this is how
    // it's supposed to be!
    activeeffect.lp[1] = 120-0;
    activeeffect.lp[2] = 170+0;
    activeeffect.lp[3] = 70-0;

}

/**Lighting effect. Sets State table metadata and changes lights*/
void
oneblink() // create one color that seems to
// dance around the lights every beat.
{

    //This part of the code creates a non zero chance of switching up the dance color every beat.
    if (random() > 100) {
        //divide by 4 to get 1 to  as an index into the color data array
        genericiunsignedchartemp = (random() % 8);
        // look up the colors in the array
        dancecolor.red = ColorDataForPreferredColors[genericiunsignedchartemp].red;
        dancecolor.blue = ColorDataForPreferredColors[genericiunsignedchartemp].green;
        dancecolor.green = ColorDataForPreferredColors[genericiunsignedchartemp].blue;
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        if (random() < (255 / ActiveFixtures)) {
            lights[i].r = dancecolor.red;
            lights[i].g = dancecolor.green;
            lights[i].b = dancecolor.blue;
            lights[i].updated = 1;
            lights[i].rdest = lights[i].r;
            lights[i].gdest = lights[i].g;
            lights[i].bdest = lights[i].b;
            break;
        }
    }

    activeeffect.effect = &oneblink;
    activeeffect.possiblelink[0] = &oneblink;
    activeeffect.possiblelink[1] = &solodance;
    activeeffect.possiblelink[2] = &AllBlue;
    activeeffect.possiblelink[3] = &FadeBlue;
    activeeffect.lp[0] = 170 + 0; //very likely to repeat self!!! this is how it's supposed to be!
    activeeffect.lp[1] = 60 - 0;
    activeeffect.lp[2] = 50+ 0;
    activeeffect.lp[3] = 70- 0;


}

/**Lighting effect. Sets State table metadata and changes lights*/
void
gradientp()

{

    genericiunsignedchartemp = random();

    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].updated = 1;
        lights[i].rdest = genericiunsignedchartemp * 3;
        lights[i].gdest = genericiunsignedchartemp * 5;
        lights[i].bdest = genericiunsignedchartemp * 7;
        genericiunsignedchartemp + 25;
    }

    activeeffect.effect = &solodance;
    activeeffect.possiblelink[0] = &gradientp;
    activeeffect.possiblelink[1] = &Flash;
    activeeffect.possiblelink[2] = &AllPurple;
    activeeffect.possiblelink[3] = &AllBlue;
    activeeffect.lp[0] = 170; //very likely to repeat self!!! this is how it's supposed to be!
    activeeffect.lp[1] = 170;
    activeeffect.lp[2] = 100;
    activeeffect.lp[3] = 120;


}

/**Lighting effect. Sets State table metadata and changes lights*/
void
Flash()
{
    //This part of the code creates a non zero chance of switching up the dance color every beat.
    if (random() > 100) {
        //divide by 4 to get 1 to  as an index into the color data array
        genericiunsignedchartemp = (random() % 8);
        // look up the colors in the array
        dancecolor.red = ColorDataForPreferredColors[genericiunsignedchartemp].red;
        dancecolor.blue = ColorDataForPreferredColors[genericiunsignedchartemp].green;
        dancecolor.green = ColorDataForPreferredColors[genericiunsignedchartemp].blue;
    }
    for (i = 0; i < ActiveFixtures; i += 1) {
        lights[i].r = dancecolor.red;
        lights[i].g = dancecolor.green;
        lights[i].b = dancecolor.blue;
        lights[i].updated = 1;
    }
    dancecolor.red = 0;
    dancecolor.blue = 0;
    dancecolor.green = 255;
    activeeffect.effect = &Flash;
    activeeffect.possiblelink[0] = &Flash;
    activeeffect.possiblelink[1] = &randomonnlyafew;
    activeeffect.possiblelink[2] = &AllYellow;
    activeeffect.possiblelink[3] = &FadeBlue;
    activeeffect.lp[0] = 170;
    activeeffect.lp[1] = 100;
    activeeffect.lp[2] = 80;
    activeeffect.lp[3] = 150;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//TODO

/* Flash(Roy G. Biv) Fade(Roy G. Biv) AllWhite AllRandom Slide Left Slide Right slide fade left slide fade right
        randomblack_orcolor swap 2 random colors just one lit rainbow theme colorsets fire water earth air
        Diffuse where each color is the average of its neighbors All Colors to tints of one color.
copy and paste from one light to another modify one light color\ 
all lights black alternate 2 colors from existing
 */