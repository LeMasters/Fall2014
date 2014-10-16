/**
Three goals:
First, green "cells" on a yellow field (petri dish)
Second, leave the 600x600 array as it is (i.e., the petri dish) but
on a 600x600 window, show us from column 200,row 200 to column 400,row 400.
I.e., 200 x 200 cells in a 600x600 window... so each cell should be 3x3 pixels in size.
Third, build a timer.  Make it so that every 15 seconds, the whole CA resets and starts over from the beginning.
**/


// Garrison LeMasters, etc., etc.

PImage petriDish;
boolean[][] theFuture;

void setup() {
  size(600, 600);
  petriDish=createImage(width, height, RGB);
  frameRate(3);
  smooth();

  // theFuture is what the petriDish will look like
  // during the next generation...
  theFuture=new boolean[width][height];
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      //initialize and setup our present and future...
      if ((noise(x*.01, y*.01)<0.5) && (noise(x*0.1, y*0.1)>0.5)) {
        petriDish.set(x, y, color(#000000));
        theFuture[x][y]=true;
      } else
      {
        petriDish.set(x, y, color(#FFFFFF));
        theFuture[x][y]=false;
      }
    }
  }
}

void draw() {
    circleOfLife();
    updateTheCalendar();
    image(petriDish, 0, 0, width, height);
}


void updateTheCalendar() {
  for (int x=5; x<width-5; x++) {
    for (int y = 5; y<height-5; y++) {
      if (theFuture[x][y]==false) {
        petriDish.set(x, y, color(#FFFFFF));
      } else {
        petriDish.set(x, y, color(#000000));
      }
    }
  }
}

void circleOfLife() {
  for (int x=5; x<width-5; x++) {
    for (int y=5; y<height-5; y++) {
      // perform a neighborhood census from the perspective
      // of every single cell, whether dead or alive.
      int neighbors=0;
      for (int i=-1; i<2; i++) {
        for (int j=-1; j<2; j++) {
          color cellState = petriDish.get(x+i, y+j);
          if (cellState == color(red(0))) {
            //LIFE!
            // println(millis(),neighbors);
            neighbors++;
          }
        }
      }
      // The grim reaper and the stork make a rare joint appearance
      if (petriDish.get(x, y) == color(red(0))) {
        neighbors = neighbors - 1;//don't count yourself
      }
      // First, let's copy the present into the future.

      // NB that I already had this value, but then lost it because
      // it was hyper-local (see for i, for j above).  Probably
      // should just store it earlier instead of fetching it twice...
      color cellState = petriDish.get(x, y);
      if (cellState == color(red(0))) {
        theFuture[x][y]=true;
      } else {
        theFuture[x][y]=false;
      }
      // note that we're only operating on those who may be
      // changing states.  Others are deemed irrelevant.
      if ( neighbors == 3) {
        theFuture[x][y]=true;
      } else {
        if (neighbors>=6) {
          theFuture[x][y]=false;
        } else {
          if (neighbors==0 || neighbors == 1) {
            theFuture[x][y]=false;
          }
        }
      }
    }
  }
}
