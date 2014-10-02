//
//
// plain vanilla sky
// Garrison LeMasters
// expressive computation
// georgetown CCT
// creative commons attribution license 4.0
//
// Oct 2, 2014

// choices:
// add another cloud that travels at a different speed, different height;
// make that cloud uniformly larger;
// make that cloud gradually speed up or slow down as it passes;
// give that cloud a shadow;
// add the occasional tumbleweed;
// add a static (not moving) cactus in the foreground;
// blur the background;
// add a third layer to the mountain range.

color sky;
color cloudColor;
PShape cloudSmall;
float smallX, smallY;
float smallIncX;

void setup() {
  size(800, 600);
  sky = color (#33CCEE);
  cloudColor = color(#FFDDEE);
  cloudSmall=loadShape("cloud_small.svg");
  cloudSmall.disableStyle();
  smallX = -100;
  smallY = height*0.33; // 1/3 of the way down the screen
  smallIncX = 1.0;
  strokeWeight(2);
  background(sky);
}

void draw() {
  background(sky);
  landscapeBuilder();
  shape(cloudSmall, smallX, smallY);
  smallX+=smallIncX;
  if (smallX>width) {
    smallX = 0-cloudSmall.width;
  }
}

void landscapeBuilder() {
  // backmost layer
  fill(#FFCC88); // lighter in the background, always
  noStroke();
  for (int x=0;x<width;x=x+2) { // skip every other column
    // noise = predictable random number, kinda
    // can be used as:
    
    // n = noise (x);
    // n = noise (x,y);
    // n = noise (x,y,z);
    //
    // In each case, n will be between 0.0 and 1.0.
    
    // here, I'm using the x-position of the mountains (from left to right)
    // to determine the random noise that I'll use to set the height of
    // the mountain.  So, in a way, the x axis helps to determine the 
    // y axis.  Why?  Is there a real relationship there?  NO.
    // It is convenient:  If I want the mountains to always be the same
    // height, and not randomly rise and fall, I can use x (a reliable 0-800)
    // and always get back the same number.  I.e., the mountain at
    // pixel 154 (x-axis) is 79 units high, because noise(154)*100
    // always returns 0.79 * 100 = 79.
    
    float y = height - (noise(x*0.01,200)*200);
    
    
    y=y-50; // just pushing the mountains up into the sky a bit
    // so that they're more easily distinguished from the foreground
    // mountains...
    
    rect(x,y,2,height-y); // 2 pixel-wide rectangle
    // from top of peak to bottom of screen.  Height - y
    // sets the tallness of the rectangle to be whatever the 
    // distance is from the top of the mountain to the very last
    // row of pixels on the screen.  It doesn't descend any further.
  }
  // foremost layer
  fill(#FFAA55); // darker in the foreground, always.
  noStroke();
  for (int x=0;x<width;x=x+2) {
    float y = height - (noise(x*0.01,50)*100);
    rect(x,y,2,height-y); // draw a 2-pixel wide rectangle from the
    //top of the mountain to the bottom of the screen.
  }
}
