public class Sliders{
  int startX;
  int startY;
  int endX;
  int endY;
  int outerRadius = 250;
  int innerRadius = 150;
  int AR;
  int comboNumber;
  PFont mono;
  int comboColor;
  boolean hit;
  boolean shouldMove;
  
  public Sliders(int x, int y, int eX, int eY, int comboNumber){
    startX = x;
    startY = y;
    endX = eX;
    endY = eY;
    AR = 5;
    mono = createFont("andalemo.ttf", 72);
    this.comboNumber = comboNumber;
  }
  
  public boolean display(){
    if (innerRadius == outerRadius) {
      shouldMove = true;
    } else{
      if(!hit){
        
      }else{
      
      }
    }
    strokeWeight(1);
    noFill();
    circle(startX, startY, outerRadius);
    fill(comboColor);
    circle(startX, startY, innerRadius);
    fill(#32CD32);
    textFont(mono);
    text("" + comboNumber,startX-25, startY+25);
    
    
    return true;
  }
  
  public boolean checkHit(float cx, float cy) {
    if (!hit && outerRadius > innerRadius) {
      float d = dist(cx, cy, startX, startY);
      if (d < innerRadius) {
        return true;
      }
    }
    return false;
  }
}
