SoundFile s1, s2, s3, s4, s5, s6, s7;
ArrayList<SoundFile> keyboard = new ArrayList<SoundFile>();
ArrayList<Circles> mapC = new ArrayList<Circles>();
ArrayList<Sliders> mapSl = new ArrayList<Sliders>();
ArrayList<Spinners> mapSp = new ArrayList<Spinners>();
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
Sliders t1, t2;
boolean bomb = false;
boolean sliderFailed = false;
int numOb = mapC.size()+mapSl.size()+mapSp.size();

void setup() {
  smooth();
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
  //update numOb later
  mapC.add(new Bomb(300, 450, 1, 5));
  mapC.add(new Circles(100, 100, 2, 3, BLUE));
  mapC.add(new Circles(200, 150, 3, 3, BLUE));
  mapC.add(new Circles(300, 80, 4, 4, BLUE));
  mapC.add(new Circles(400, 100, 5, 5, BLUE));
  mapSl.add(new Sliders(300, 400, 700, 400, 1, 3, "curve"));
  /*
  mapC.add(new Bomb(500, 200, 1, 5));
   mapC.add(new Circles(600, 200, 2, 4, #32a6cd));
   mapC.add(new Circles(700, 200, 3, 3, #32a6cd));
   mapC.add(new Circles(800, 200, 4, 2, #32a6cd));
   mapC.add(new Circles(400, 400, 1, 1, #32a6cd));
   mapC.add(new Circles(300, 400, 2, 1, RED));
   mapC.add(new Circles(200, 400, 3, 2, RED));
   mapC.add(new Circles(100, 400, 4, 3, RED));
   mapC.add(new Circles(500, 600, 1, 3, RED));
   mapC.add(new Circles(600, 600, 2, 2, RED));
   mapC.add(new Circles(700, 600, 3, 2, RED));
   */
  numOb = mapC.size()+mapSl.size()+mapSp.size();
  updateTemp();
  bg = loadImage("newset.jpg");
  displayScore();
  displayCombo();
  displayClicks();
  //file = new SoundFile(this, "132.mp3");
  //file.play();
  //t1 = new Sliders(200,200,400,200,1,3, "horizontal");
  //t1 = new Sliders(200, 200, 600, 200, 1, 3, "semi");
  //t1 = new Sliders(300, 400, 700, 400, 1, 3, "curve");
}


void draw() {
  background(bg);
  if (!t1.done) {
    t1.display();
    //can't start before the outer circle meets the inner
    if (mousePressed && t1.checkHit(mouseX, mouseY) && sliderFailed == false && millis()-t1.startT>1500) {
      points += 5;
      keyboard.get(t1.pitch-1).play();
    } else {
      t1.done = false;
      //once you miss you can't get points from it anymore
      if (millis()-t1.startT>1500) {
        sliderFailed = true;
      }
    }
  }
  if (numOb>=3) {
    for (Circles c : temp) {
      if (c.display()) {
        c.update();
      } else {
        mapC.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
      }
    }
  } else if (mapC.size()==2) {
    for (Circles c : ts2) {
      if (c.display()) {
        c.update();
      } else {
        mapC.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
      }
    }
  } else {
    for (Circles c : ts1) {
      if (c.display()) {
        c.update();
      } else {
        mapC.remove(c);
        keyboard.get(c.pitch-1).play();
        updateTemp();
        noLoop();
      }
    }
  }
  */
    delay(50);
  displayScore();
  displayCombo();
  displayClicks();
}

void updateTemp() {
  if (mapC.size()>=3) {
    for (int i = 0; i < 3; i++) {
      if (i < mapC.size()) {
        temp[i] = mapC.get(i);
      } else {
        temp[i] = null;
      }
    }
  } else if (mapC.size()==2) {
    ts2[0] = mapC.get(0);
    ts2[1] = mapC.get(1);
  } else if (mapC.size()==1) {
    ts1[0] = mapC.get(0);
  } else {
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    leftClick++;
  }
  if (mouseButton == RIGHT) {
    rightClick++;
  }
  if (mapC.size()>=3) {
    if (!(temp[0].hit) && temp[0].checkHit(mouseX, mouseY)) {
      temp[0].hit = true;
      temp[0].timeEnd = millis();
      float setUp = temp[0].getTime();
      println(setUp);
      if (temp[0].isBomb()==1) {
        //should taps add if bomb
        combo = 0;
        Score temp = new Score(setUp, true, combo);
        points += temp.points;
      } else {
        combo++;
        Score temp = new Score(setUp, false, combo);
        taps++;
        points += temp.points;
      }
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  } else if (mapC.size()==2) {
    if (!(ts2[0].hit) && ts2[0].checkHit(mouseX, mouseY)) {
      ts2[0].hit = true;
      ts2[0].timeEnd = millis();
      float setUp = ts2[0].getTime();
      if (ts2[0].isBomb()==1) {
        combo = 0;
        Score temp = new Score(setUp, true, combo);
        points += temp.points;
      } else {
        combo++;
        Score temp = new Score(setUp, false, combo);
        taps++;
        points += temp.points;
      }
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  } else if (mapC.size()==1) {
    if (!(ts1[0].hit) && ts1[0].checkHit(mouseX, mouseY)) {
      ts1[0].hit = true;
      ts1[0].timeEnd = millis();
      float setUp = ts1[0].getTime();
      if (temp[0].isBomb()==1) {
        combo = 0;
        Score temp = new Score(setUp, true, combo);
        points += temp.points;
      } else {
        combo++;
        Score temp = new Score(setUp, false, combo);
        taps++;
        points += temp.points;
      }
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
  } else {
  }
}

void displayScore() {
  fill(0);
  textSize(45);
  String textV = ""+abs(points);
  int length = textV.length();
  int addZero = 8-length;
  if (points>=0) {
    display = "";
  } else {
    display = "-";
  }
  for (int i = 0; i < addZero; i++) {
    display += "0";
  }
  display += abs(points);
  if (points>=0) {
    text(display, width-220, 50);
  } else {
    text(display, width-247, 50);
  }
}

void displayCombo() {
  fill(0);
  textSize(30);
  dcombo = "";
  dcombo = combo + "x";
  text(dcombo, 10, height-17);
}

void displayClicks() {
  fill(255);
  textSize(30);
  text("" + leftClick, width-35, height-400);
  text("" + rightClick, width-35, height-350);
}
