public class Circles extends Interactables{
  float xLoc;
  float yLoc;
  int innerRadius;
  int outerRadius;
  float timeStart;
  float timeEnd;
  SoundObject hitSound;
 
  public Circles(int x, int y){
    xLoc = x;
    yLoc = y;
  }
 
 
  public void printOuter(){
    circle(xLoc,yLoc,outerRadius);
  }
 
  public void printInner(){
    circle(xLoc,yLoc,innerRadius);
  }
 
  public float getTime(){
    return timeEnd-timeStart;
  }
 
  public void playSound(){
    sample = new AudioSample(this, 100000);
    sample.write(10, random(-100,100));
    sample.play();
  }
 
 
}
