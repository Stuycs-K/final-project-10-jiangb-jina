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
Sliders[] tempSl = new Sliders[3];
Sliders[] tempSl2 = new Sliders[2];
Sliders[] tempSl3 = new Sliders[1];
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
Spinners sp1;
boolean startScreen = true;
boolean map1 = false;
boolean map2 = false;
boolean map3 = false;
PImage Osu;

void drawMainMenu() {
  background (255);
  Osu = loadImage("Osu.png");
  imageMode(CENTER);
  image(Osu, 500, 220, 350, 350);
  fill(0);
  rect(100, 500, 200, 100);
  rect(400, 500, 200, 100);
  rect(700, 500, 200, 100);
  textSize(70);
  fill(255);
  text("map 1", 110, 575);
  text("map 2", 410, 575);
  text("map 3", 710, 575);
}

void setup() {
  smooth();
  size(1000, 800);
  if (startScreen) {
    drawMainMenu();
  }
}

void drawMap1() {
  background(255);
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
  //mapC.add(new Bomb(300, 450, 1, 5));
  mapC.add(new Circles(100, 100, 2, 3, BLUE));
  mapC.add(new Circles(200, 150, 3, 3, BLUE));
  mapC.add(new Circles(300, 80, 4, 4, BLUE));
  mapC.add(new Circles(400, 100, 5, 5, BLUE));
  mapSl.add(new Sliders(600, 400, 700, 400, 1, 3, "curve", BLUE));
  bg = loadImage("newset.jpg");
  t1 = new Sliders(300, 400, 700, 400, 1, 3, "curve", RED);
  mapSl.add(t1);
  updateTemp();
  displayScore();
  displayCombo();
  displayClicks();
  //file = new SoundFile(this, "132.mp3");
  //file.play();
  //t1 = new Sliders(200,200,400,200,1,3, "horizontal");
  //t1 = new Sliders(200, 200, 600, 200, 1, 3, "semi");
  sp1 = new Spinners(50);
}


void draw() {
  if (startScreen) {
    if (mousePressed && 100<mouseX && 300>mouseX && 500<mouseY && 600>mouseY) {
      startScreen = false;
      map1 = true;
      drawMap1();
    }
  }
  if (!startScreen) {
    background(bg);
    boolean circleTime = true;
    boolean sliderTime = false;
    boolean spinnerTime = false;
    if (circleTime) {
      if (mapC.size()>=3) {
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
            //keyboard.get(c.pitch-1).play();
            updateTemp();
            //noLoop();
            circleTime = false;
            sliderTime = true;
          }
        }
      }
    }
    if (sliderTime) {
      fill(0);
      if (mapSl.size()>0) {
        if (!mapSl.get(0).done) {
          mapSl.get(0).display();
          if (mapSl.get(0).afterAdding==0) {
            mapSl.get(0).startT = millis();
          }
          if (millis()-mapSl.get(0).startT>6000) {
            mapSl.get(0).done=true;
          }
          //println(millis()-mapSl.get(0).startT);
          //can't start before the outer circle meets the inner
          if (millis()-mapSl.get(0).startT>1500 && millis()-mapSl.get(0).startT<=6000) {
            if (mousePressed && mapSl.get(0).checkHit(mouseX, mouseY) && mapSl.get(0).sliderFailed == false) {
              points += 5;
              keyboard.get(mapSl.get(0).pitch-1).play();
            } else {
              mapSl.get(0).sliderFailed = true;
            }
          }
          mapSl.get(0).afterAdding++;
        } else {
          mapSl.remove(mapSl.get(0));
        }
      } else {
        sliderTime = false;
        spinnerTime = true;
      }
    }
    if (spinnerTime) {
      if (sp1.currentDuration<sp1.duration) {
        sp1.draw();
        sp1.currentDuration++;
        if (sp1.checkRev()) {
          points += 1000;
        }
      }
    }








    delay(50);
    displayScore();
    displayCombo();
    displayClicks();
  }
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
