public class Circles{
  int xLoc;
  int yLoc;
  int innerRadius;
  int outerRadius;
  float timeStart;
  float timeEnd;
 //SoundObject hitSound;
 
  public Circles(int x, int y){
    xLoc = 400;
    yLoc = 400;
    outerRadius = 250;
    innerRadius = 150;
  }
 
 
  public void printOuter(){
    for(int i = 0; i < 20; i++){
      fill(145,30,30);
      circle(xLoc,yLoc,innerRadius);
      fill(255);
      circle(xLoc,yLoc,outerRadius);
      delay(100);
      outerRadius -= 5;
    }
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
 
 
}
