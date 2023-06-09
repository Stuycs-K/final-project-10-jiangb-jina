public class Sliders{
  int startX;
  int startY;
  int endX;
  int endY;
  int tempX;
  int tempY;
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
    tempX = x;
    tempY = y;
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
    curveVertex(endX+innerRadius,startY-0.5*innerRadius);
    vertex(endX,startY+0.5*innerRadius);
    vertex(startX,startY+0.5*innerRadius);
    endShape(CLOSE);
    
    circle(startX,startY,innerRadius);
    if (innerRadius == outerRadius) {
      if(tempX!=endX){
        updateMove();
        circle(tempX,tempY,innerRadius);
      }else{
        coverSlider();
      }
    } else{
      updateShrink();
      coverCircle();
      circle(startX, startY, outerRadius);
      fill(comboColor);
      circle(startX, startY, innerRadius);
      fill(#32CD32);
    }
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
  
  public void updateShrink() {
    if (!hit && outerRadius > innerRadius) {
      outerRadius -= AR;
    }
  }
  
  public void updateMove(){
    tempX += AR;
  }
  
  public void coverCircle() {
    fill(255);
    circle(startX, startY, outerRadius);
  }
  
  public void coverSlider(){
    fill(255);
    rect(startX-300,startY-300,endX-startX+2*innerRadius,2*innerRadius);
  }
}
