import ddf.minim.*;

public class Circles{
  int xLoc;
  int yLoc;
  int innerRadius;
  int outerRadius;
  int timeStart;
  int timeEnd;
  Minim minim;
  AudioOutput out;
  AudioSample sample;
  float frequency;
  boolean hit;
  float AR; //approach rate
 
  public Circles(int x, int y){
    xLoc = x;
    yLoc = x;
    outerRadius = 250;
    innerRadius = 150;
    timeStart = 0;
    timeEnd = 0;
    frequency = 200;
    AR = 5;
    hit = false;
  }
  
  public void display(){
    noFill();
    if(!hit){
      stroke(0);
    }else{
      stroke(255);
    }
    circle(xLoc,yLoc,innerRadius);
    circle(xLoc,yLoc,outerRadius);
  }
  
  public void update(){
    if(!hit && outerRadius > innerRadius){
      outerRadius -= AR;
    }
  }
  
 
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
    return timeEnd-timeStart;
  }
 
 /*
  public void playSound(){
    sample = new AudioSample(this, 100000);
    sample.write(10, random(-100,100));
    sample.play();
  }
  */
 
  void playNote() {
    out.playNote(frequency, 1.0);
  }

}
