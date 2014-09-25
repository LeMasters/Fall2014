// Garrison LeMasters
// popMATRIXart
// simple demo:  
//   randomization; 
//   nested for() loops
//  ADD:  Arrays?
// Sept 2014

int columns, rows;
int unitWide, unitHigh;
int nUnitsW, nUnitsH;
int xOffset, yOffset;
int minD;
float odds;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  noLoop();
  odds=0.675;
  nUnitsW = 10;
  nUnitsH = 10;
  unitWide = width/nUnitsW;
  unitHigh = height/nUnitsH;
  xOffset=int(unitWide*0.5);
  yOffset=int(unitHigh*0.5);
  minD = int(unitWide*0.333);
  noStroke();
}

void draw() {
  for (int x=0; x<nUnitsW; x++) {
    for (int y=0; y<nUnitsH; y++) {
      float cX = (x*unitWide)+xOffset;
      float cY = (y*unitHigh)+yOffset;
      pushMatrix();
      translate(cX, cY);
      fill(int(random(1)*25)*10);
      rect(0,0,unitWide,unitHigh);
      for (int z=unitWide;z>minD; z--) {
        if (random(1)>odds) {
          fill(int(random(1)*25)*10);
          ellipse(0, 0, z, z);
        }
      }
      popMatrix();
    }
  }
}
