Circles test1;
Circles test2;
Circles test3;
Circles test4;
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
void setup() {
  size(1000, 800);
  map.add(new Circles(100, 100, 1));
  map.add(new Circles(300, 300, 2));
  map.add(new Circles(500, 500, 3));
  map.add(new Circles(700, 700, 4));
  map.add(new Circles(400, 900, 1));
  map.add(new Circles(900, 400, 2));
  map.add(new Circles(100, 100, 3));
  map.add(new Circles(900, 900, 4));
  map.add(new Circles(450, 450, 5));
  updateTemp();
  bg = loadImage("newset.jpg");
  displayScore();
  displayCombo();
  //file = new SoundFile(this, "132.mp3");
  //file.play();
}


void draw() {
  background(bg);
  if (map.size()>=3) {
    for (Circles c : temp) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        updateTemp();
      }
    }
  } else if (map.size()==2) {
    for (Circles c : ts2) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        updateTemp();
      }
    }
  } else {
    for (Circles c : ts1) {
      if (c.display()) {
        c.update();
      } else {
        map.remove(c);
        updateTemp();
      }
    }
  }
  delay(100);
  displayScore();
  displayCombo();
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
  for (Circles c : map) {
    if (!(c.hit) && c.checkHit(mouseX, mouseY)) {
      c.hit = true;
      c.playNote();
      c.timeEnd = millis();
      Score temp = new Score(c.getTime());
      taps++;
      combo = temp.combo;
      points += temp.points;
    } else {
      //display score and taps, 0 added
      //combo returns to 0
      combo = 0;
    }
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
  text(display, width-190, 50);
}

void displayCombo() {
  fill(0);
  textSize(30);
  dcombo = "";
  println(combo);
  dcombo = combo + "x";
  text(dcombo, 10, height-17);
}
