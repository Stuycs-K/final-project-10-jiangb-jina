SoundFile s1;
SoundFile s2;
SoundFile s3;
SoundFile s4;
SoundFile s5;
SoundFile s6;
SoundFile s7;
ArrayList<SoundFile> keyboard = new ArrayList<SoundFile>();
ArrayList<Circles> map = new ArrayList<Circles>();
//a temporary array to make sure only 3 objects show up on the screen at the right time
//ts2 and ts1 is for when map has less than 3 objects left
Circles[] temp = new Circles[3];
Circles[] ts2 = new Circles[2];
Circles[] ts1 = new Circles[1];
SoundFile file;
int taps = 0;
int combo = 0;
int points = 0;
String display = "00000000";
String dcombo = "0x";
PImage bg;
PFont font;
int leftClick;
int rightClick;
int RED = #cd3232;
int BLUE = #0000FF;
Sliders t1;

void setup() {
  frameRate(80);
  size(1000, 800);
  s1 = new SoundFile(this, "do.wav");
  s2 = new SoundFile(this, "re.wav");
  s3 = new SoundFile(this, "mi.wav");
  s4 = new SoundFile(this, "fa.wav");
  s5 = new SoundFile(this, "sol.wav");
  s6 = new SoundFile(this, "la.wav");
  s7 = new SoundFile(this, "si.wav");
  keyboard.add(s1);
  keyboard.add(s2);
  keyboard.add(s3);
  keyboard.add(s4);
  keyboard.add(s5);
  keyboard.add(s6);
  keyboard.add(s7);
  map.add(new Circles(100, 100, 1, 3, BLUE));
  map.add(new Circles(200, 150, 2, 3, BLUE));
  map.add(new Circles(300, 80, 3, 4, BLUE));
  map.add(new Circles(400, 100, 4, 5, BLUE));
  map.add(new Circles(500, 200, 1, 5, #32a6cd));
  map.add(new Circles(600, 200, 2, 4, #32a6cd));
  map.add(new Circles(700, 200, 3, 3, #32a6cd));
  map.add(new Circles(800, 200, 4, 2, #32a6cd));
  map.add(new Circles(400, 400, 1, 1, RED));
  map.add(new Circles(300, 400, 2, 1, RED));
  map.add(new Circles(200, 400, 3, 2, RED));
  map.add(new Circles(100, 400, 4, 3, RED));
  map.add(new Circles(500, 600, 1, 3, RED));
  map.add(new Circles(600, 600, 2, 2, RED));
  map.add(new Circles(700, 600, 3, 2, RED));
  updateTemp();
  bg = loadImage("newset.jpg");
  displayScore();
  displayCombo();
  displayClicks();
  //file = new SoundFile(this, "132.mp3");
  //file.play();
  t1 = new Sliders(200,200,400,200,1);
}


void draw() {
  t1.display();
  /*
  background(bg);
  if (map.size()>=3) {
    for (Circles c : temp) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
      }
    }
  } else if (map.size()==2) {
    for (Circles c : ts2) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
      }
    }
  } else {
    for (Circles c : ts1) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
        noLoop();
      }
    }
  }
  delay(100);
  displayScore();
  displayCombo();
  displayClicks();
  */
}

void updateTemp() {
  if (map.size()>=3) {
    for (int i = 0; i < 3; i++) {
      if (i < map.size()) {
        temp[i] = map.get(i);
      } else {
        temp[i] = null;
      }
    }
  } else if (map.size()==2) {
    ts2[0] = map.get(0);
    ts2[1] = map.get(1);
  } else if (map.size()==1) {
    ts1[0] = map.get(0);
  } else {
  }
}

void mouseClicked() {
  if(mouseButton == LEFT){
    leftClick++;
  }
  if(mouseButton == RIGHT){
    rightClick++;
  }
  if (map.size()>=3){
    if (!(temp[0].hit) && temp[0].checkHit(mouseX, mouseY)) {
      temp[0].hit = true;
      temp[0].timeEnd = millis();
      float setUp = temp[0].getTime();
      Score temp = new Score(setUp);
      taps++;
      combo++;
      points += temp.points;
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  }else if(map.size()==2){
    if (!(ts2[0].hit) && ts2[0].checkHit(mouseX, mouseY)) {
      ts2[0].hit = true;
      ts2[0].timeEnd = millis();
      float setUp = ts2[0].getTime();
      Score temp = new Score(setUp);
      taps++;
      combo++;
      points += temp.points;
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  }else if(map.size()==1){
    if (!(ts1[0].hit) && ts1[0].checkHit(mouseX, mouseY)) {
      ts1[0].hit = true;
      ts1[0].timeEnd = millis();
      float setUp = ts1[0].getTime();
      Score temp = new Score(setUp);
      taps++;
      combo++;
      points += temp.points;
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  }else{
  }
}

void displayScore() {
  fill(0);
  textSize(45);
  String textV = ""+points;
  int length = textV.length();
  int addZero = 8-length;
  display = "";
  for (int i = 0; i < addZero; i++) {
    display += "0";
  }
  display += points;
  text(display, width-220, 50);
}

void displayCombo() {
  fill(0);
  textSize(30);
  dcombo = "";
  dcombo = combo + "x";
  text(dcombo, 10, height-17);
}

void displayClicks(){
  fill(255);
  textSize(30);
  text("" + leftClick, width-35, height-400);
  text("" + rightClick, width-35, height-350);
}
