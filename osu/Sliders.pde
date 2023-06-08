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
  
  public Sliders(int x, int y, int eX, int eY, int comboNumber){
    startX = x;
    startY = y;
    endX = eX;
    endY = eY;
    AR = 5;
    this.comboNumber = comboNumber;
  }
}
