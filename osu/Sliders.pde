public class Sliders {
  float startX, startY;
  float endX, endY;
  float tempX, tempY;
  int outerRadius = 200;
  int innerRadius = 100;
  int AR;
  int comboNumber;
  PFont mono;
  int comboColor;
  boolean done;
  int pitch;
  int startT;
  //horizontal, semi, curve
  String type;
  //for curvePoints
  int step = 1;
  boolean sliderFailed;
  int afterAdding = 0;
  int combo;

  public Sliders(int x, int y, int eX, int eY, int comboNumber, int p, String s, int c) {
    startX = x;
    endX = eX;
    startY = y;
    endY = eY;
    tempX = x;
    tempY = y;
    AR = 5;
    mono = createFont("andalemo.ttf", 72);
    this.comboNumber = comboNumber;
    done = false;
    pitch = p;
    type = s;
    comboColor = c;
    if (type.equals("curve")) {
      endX = bezierPoint(startX, startX-240, startX+20, startX-280, 1);
      endY = bezierPoint(startY, startY-10, startY+280, startY+240, 1);
    }
    sliderFailed = false;
    combo = 0;
  }

  public boolean display() {
    noFill();
    stroke(0);
    strokeWeight(3);
    if (type.equals("horizontal")) {
      line(startX, startY, endX, endY);
    } else if (type.equals("semi")) {
      arc(endX-200, startY, endX-startX, endX-startX, 0, PI);
    } else {
      beginShape();
      bezier(startX, startY, startX-240, startY-10, startX+20, startY+280, startX-280, startY+240);
      endShape();
    }
    fill(comboColor);
    strokeWeight(1);
    circle(startX, startY, innerRadius);
    fill(0);
    circle(endX, endY, 10);
    fill(comboColor);
    text(comboNumber, startX, startY);
    if (innerRadius == outerRadius) {
      if (tempX!=endX) {
        updateMove();
        circle(tempX, tempY, innerRadius);
      } else {
        combo++;
        done = true;
      }
    } else {
      updateShrink();
      coverCircle();
      noFill();
      circle(startX, startY, outerRadius);
      fill(comboColor);
      circle(startX, startY, innerRadius);
    }
    return true;
  }

  public boolean checkHit(float cx, float cy) {
    float d = dist(cx, cy, tempX, tempY);
    if (d < innerRadius) {
      //println("hit");
      return true;
    }
    return false;
  }



  public void updateShrink() {
    if (outerRadius > innerRadius) {
      outerRadius -= AR;
    }
  }

  public void updateMove() {
    if (type.equals("horizontal")) {
      tempX += AR;
    } else if (type.equals("semi")) {
      float x0 = (endX+startX)/2;
      float r = (endX-startX)/2;
      tempY = startY+sqrt(sq(r)-sq(tempX-x0));
    } else {
      tempX = bezierPoint(startX, startX-240, startX+20, startX-280, step*(1.0/50));
      tempY = bezierPoint(startY, startY-10, startY+280, startY+240, step*(1.0/50));
      step++;
    }
  }

  public void coverCircle() {
    fill(255);
    circle(startX, startY, outerRadius);
  }
  //can replace this with just removing the slider from the arraylist?
  public void coverSlider() {
    fill(255);
    rect(startX-0.5*innerRadius, startY-0.5*innerRadius, endX-startX+innerRadius, innerRadius);
  }
}
