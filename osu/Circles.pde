import ddf.minim.*;
import processing.sound.*;

public class Circles {
  int xLoc;
  int yLoc;
  int innerRadius;
  int outerRadius;
  int timeStart;
  int timeEnd;
  int expectedEnd;
  Minim minim;
  SoundFile file;
  float frequency;
  boolean hit;
  int AR; //approach rate
  int comboNumber;
  PFont mono;
  int pitch;
  int comboColor;

  public Circles(int x, int y, int CN, int p, int cColor) {
    xLoc = x;
    yLoc = y;
    comboNumber = CN;
    pitch = p;
    outerRadius = 200;
    innerRadius = 100;
    timeStart = millis();
    //println(timeStart);
    //need to make sure that timeEnd and expectedEnd won't ever give a false positive result
    timeEnd = 0;
    /*expectedEnd depends on the rate at which the approaching circle is closing in, which depends on how many milliseconds
     each frame takes..
     */
    //for now i will just put a fake value
    expectedEnd = timeStart + 2720;
    frequency = 200;
    AR = 5;
    hit = false;
    mono = createFont("andalemo.ttf", 72);
    comboColor = cColor;
  }

  public boolean display() {
    if (innerRadius == outerRadius) {
      return false;
    }
    strokeWeight(1);
    noFill();
    if (!hit) {
      stroke(0);
    } else {
      stroke(255);
      return false;
    }
    circle(xLoc, yLoc, outerRadius);
    fill(comboColor);
    circle(xLoc, yLoc, innerRadius);
    fill(#32CD32);
    textFont(mono);
    text("" + comboNumber, xLoc-25, yLoc+25);
    return true;
  }

  public void cover() {
    fill(255);
    circle(xLoc, yLoc, outerRadius);
  }

  public void update() {
    if (!hit && outerRadius > innerRadius) {
      outerRadius -= AR;
    }
  }

  public boolean checkHit(float cx, float cy) {
    if (!hit && outerRadius > innerRadius) {
      float d = dist(cx, cy, xLoc, yLoc);
      if (d < innerRadius) {
        return true;
      }
    }
    return false;
  }
  
  public float getTime() {
    //return timeEnd-timeStart; (used to write a fake value for expectedEnd)
    return abs(expectedEnd-timeEnd);
  }
  
  public int isBomb(){
    return 0;
  }
}
