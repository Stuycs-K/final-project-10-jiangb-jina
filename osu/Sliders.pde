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
    fill(145);
    beginShape();
    vertex(startX,startY-0.5*innerRadius);
    vertex(endX,startY-0.5*innerRadius);
    curveVertex(endX-innerRadius,startY);
    curveVertex(endX,startY-0.5*innerRadius);
    curveVertex(endX+0.5*innerRadius,startY);
    curveVertex(endX,startY+0.5*innerRadius);
    curveVertex(endX+innerRadius,startY);
    vertex(endX,startY+0.5*innerRadius);
    vertex(startX,startY+0.5*innerRadius);
    endShape(CLOSE);
    
    circle(startX,startY,innerRadius);
    return true;
    /*
    if (innerRadius == outerRadius) {
      
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
    */
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
