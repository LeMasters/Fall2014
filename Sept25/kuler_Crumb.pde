/** Crumb, via adobe kuler
 http://adobe.ly/1s8jYJH
 **/
 
// instead of void setKuler(), I've used color[] setKuler().
// This means that when this custom function is finished,
// Processing expects it to RETURN a value -- or, in this case,
// 5 values:  5 different hex codes that comprise a single
// palette.  Because of the code that called this custom function,
// we will stuff those 5 values into a color array.
// So, here are all the steps, mashed together (and with better
// names to avoid confusion).

// color[] myKuler;
// myKuler = setPalette();

// color[] setPalette() {
//    color[] temp = { #000000,#111111,#222222,#333333,#444444 };
//    return temp;

// int c = int(random(1)*myKuler.length);
// fill(myKuler[c]);

// There is a lot here, so don't panic if it isn't immediately
// clear.  The other file has notes about each of these lines;
// Finally:  Notice that I initially refer to myKuler without
// a set of brackets []... same deal with the color array called
// temp:  Why do I say "return temp;" if temp is actually
// temp[0],temp[1],temp[2],temp[3], and temp[4]?

// First, you ask a lot of questions.  Seems kinda pushy, if
// you don't mind my saying.  

// Second, because there are many situations where you RETURN
// or PASS (basically transfer) the WHOLE ARRAY, not just one
// element of the array.  In this case, I'm picking from
// among three different palettes, and then returning all five
// colors from one of those palettes.  At some point later
// in the code, I then pick a random color from that palette.
// But in this section, I'm handing over 5 colors, not just one.
// So myKuler (in this context) really kinda means:
// {myKuler[0],myKuler[1],myKuler[2],myKuler[3],myKuler[4]}
//
// If you recall set theory from mathematics, that's what we're
// really up to here:  note the curly braces, just like conventional
// maths.
 
color[] setKuler() {
  if (random(1)>0.66) {
    color[] tempPalette= {
      #F75674, #FFCED6, #E7F8FF, #98B0CC, #122742
    };
    return tempPalette;
  } else {
    if (random(1)>.5) {
      color[] tempPalette= {
        #FFBC67, #DA727E, #AC6C79, #685C79, #455C7B
      };
      return tempPalette;
    } else {
      color[] tempPalette= {
        #23A38F, #B7C11E, #EFF1C2, #F0563D, #2E313D
      };
      return tempPalette;
    }
  }
}

  // Also using:
  // QBStudio, cxCedar
  //http://adobe.ly/1BYmPae
