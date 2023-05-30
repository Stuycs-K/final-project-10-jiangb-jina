import ddf.minim.*;

public class Circles{
  int xLoc;
  int yLoc;
  int innerRadius;
  int outerRadius;
  int timeStart;
  int timeEnd;
  int expectedEnd;
  Minim minim;
  AudioOutput out;
  AudioSample sample;
  float frequency;
  boolean hit;
  int AR; //approach rate
 
  public Circles(int x, int y){
    xLoc = x;
    yLoc = x;
    outerRadius = 250;
    innerRadius = 150;
    timeStart = millis();
    //println(timeStart);
    //need to make sure that timeEnd and expectedEnd won't ever give a false positive result
    timeEnd = 0;
    /*expectedEnd depends on the rate at which the approaching circle is closing in, which depends on how many milliseconds 
    each frame takes..
    */
    //for now i will just put a fake value
    expectedEnd = timeStart + 1550;
    frequency = 200;
    AR = 5;
    hit = false;
  }
  
  public boolean display(){
    strokeWeight(1);
    noFill();
    if(!hit){
      stroke(0);
    }else{
      stroke(255);
      return false;
    }
    circle(xLoc,yLoc,innerRadius);
    circle(xLoc,yLoc,outerRadius);
    return true;
  }
  
  public void cover(){
    fill(255);
    circle(xLoc,yLoc,outerRadius);
  }
  
  public void update(){
    if(!hit && outerRadius > innerRadius){
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
  
  /*
  public void mouseClicked() {
    if (!hit && checkHit(mouseX, mouseY)) {
      hit = true;
      playNote();
    }
    println("mouse is clicked");
  }
  */
  
 //PRINTOUTER AND PRINTINNER SHOULD NOT BE USED
 //should be something added here: if(success) -> playNote(), break();, timeEnd = second();
  public void printOuter(){
    /*
    for(int i = 0; i < 20; i++){
      stroke(255);
      fill(145,30,30);
      circle(xLoc,yLoc,innerRadius);
      fill(255);
      circle(xLoc,yLoc,outerRadius);
      delay(100);
      stroke(0);
      circle(xLoc,yLoc,outerRadius);
      outerRadius -= 5;
    }
    */
    timeEnd = second();
  }
  
  public void printInner(){
  }
 
  public float getTime(){
    //return timeEnd-timeStart; (used to write a fake value for expectedEnd)
    return abs(expectedEnd-timeEnd);
  }
 
 /*
  public void playSound(){
    sample = new AudioSample(this, 100000);
    sample.write(10, random(-100,100));
    sample.play();
  }
  */
 
  void playNote() {
    minim = new Minim(this);
    out = minim.getLineOut();
    out.playNote(frequency, 1.0);
  }

}
