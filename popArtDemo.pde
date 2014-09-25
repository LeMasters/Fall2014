// Garrison LeMasters
// popMATRIXart
// simple demo:  
//   randomization; 
//   nested for() loops
//   and some arrays for good measure.
// Sept 2014

int columns, rows;
int unitWide, unitHigh;
int nUnitsW, nUnitsH;
int xOffset, yOffset;
int minD;
float odds;
boolean handMade; // I'll use this flag to tell the computer
                  // whether or not to add some random noise
                  // to positions and rotation of objects,
                  // which makes things look a bit less "computational."
                  // Note that the effect is interesting, but
                  // I'm relatively sure there is nothing gained
                  // by pretending that this was made by hand, or by
                  // trying to conceal its digital source.
color[] kuler;    // This little line is the first of a few new things.
                  // Here, I'm DECLARING a variable of the type COLOR,
                  // but I'm saying that the variable (kuler) will be
                  // not just a color, but a color array.
                  // You'll see soon enough, but this means that
                  // I can have hundreds of different kulers saved
                  // in memory, rather than just one.
                  // A quick example with simpler INT instead of COLOR
                  // Regular approach:
                  // int athleteNumber;
                  // athleteNumber = 34;
                  // Array'd approach:
                  // int[] athleteNumber; // note the closed, empty brackets
                  // athleteNumber = new int[20]; // a new step!
                  // athleteNumber[0] = 32;
                  // athleteNumber[1] = 47;
                  // athleteNumber[2] = 22; // we now have 20 (0 - 19)
                  // versions of athleteNumber -- each is completely
                  // autonomous from the rest.  These work especially
                  // well with for() loops:
                  //   for(int i=0;i<20;i++) {
                  //       athleteNumber[i] = int(random(1)*99);
                  //   }

void setup() {
  size(800, 800);
  rectMode(CENTER);
  frameRate(.25);
  handMade = false;
  noStroke();

}

void draw() {
  background(255); // clear screen
  kuler = setKuler(); // chance of a new palette with every redraw
  // remember that kuler is actually an array... that's tricky here,
  // because I've left the empty brackets off (kuler[]).  The
  // reason for that is complicated, and we'll save it for later.
  // For now, though, here's the other new aspect we've uncovered:
  // setKuler() is a "custom function."  It is basically a way of
  // adding to Processing's language itself.  In this case,
  // setKuler() will RETURN a random color drawn from a random
 // palette (see kulerColor_Crumb.pde). 
  odds=0.875;
  nUnitsW = int(random(5,15)); // randomizing columns, rows
  nUnitsH = nUnitsW;
  unitWide = width/nUnitsW;
  unitHigh = height/nUnitsH;
  xOffset=int(unitWide*0.5);
  yOffset=int(unitHigh*0.5);
  minD = int(unitWide*0.333);  
  for (int x=0; x<nUnitsW; x++) {
    for (int y=0; y<nUnitsH; y++) {
      float cX = (x*unitWide)+xOffset; // offsets are half of unit width
      float cY = (y*unitHigh)+yOffset;
      pushMatrix();
      translate(cX, cY);
      int shadeNumber = int(random(1)*kuler.length);
      // kuler.length (or athleteNumber.length, for example)
      // is a way of learning how many "cells" that the array kuler
      // contains.  In this case, 5 (see other file).
      fill(kuler[shadeNumber]); // now choose that color
      if (handMade==true) { // handmade?
        rotate(radians(random(-2.25,2.25))); // spin a random amount
      }
      rect(0,0,unitWide,unitHigh);
      for (int z=unitWide;z>minD; z--) {
        if (random(1)>odds) {
          if (handMade == true) { // check to see if I want handmade used
            translate(random(-1,1),random(-1,1)); // jumble things a bit
          }
          shadeNumber = int(random(1)*kuler.length);
          // kuler.length is a way of finding out how many different
          // versions of kuler[] there are.  Here, it would return 5
          // (0 - 4).
          fill(kuler[shadeNumber]); // e.g, kuler[0] - kuler[4]
          ellipse(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
}
