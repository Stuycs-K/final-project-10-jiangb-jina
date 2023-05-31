Circles test1;
Circles test2;
Circles test3;
Circles test4;
ArrayList<Circles> map = new ArrayList<Circles>();
//a temporary array to make sure only 3 objects show up on the screen at the right time
Circles[] temp = new Circles[3];
Circles[] ts2 = new Circles[2];
Circles[] ts1 = new Circles[1];

void setup(){
  size(800,800);
  map.add(new Circles(100,100));
  map.add(new Circles(300,300));
  map.add(new Circles(500,500));
  map.add(new Circles(700,700));
  map.add(new Circles(50,230));
  map.add(new Circles(430,430));
  map.add(new Circles(500,500));
  map.add(new Circles(200,200));
  map.add(new Circles(700,700));
  updateTemp();
}


void draw(){
  background(255);
  if(map.size()>=3){
    for(Circles c : temp){
      if(c.display()){
        c.update();
      }else{
        map.remove(c);
        updateTemp();
      }
  }
  }else if(map.size()==2){
    for(Circles c : ts2){
      if(c.display()){
        c.update();
      }else{
        map.remove(c);
        updateTemp();
      }
    }
  }else{
    for(Circles c : ts1){
      if(c.display()){
        c.update();
      }else{
        map.remove(c);
        updateTemp();
      }
    }
  }
  delay(100);
}

void updateTemp() {
  if(map.size()>=3){
    for (int i = 0; i < 3; i++) {
      if (i < map.size()) {
        temp[i] = map.get(i);
      } else {
        temp[i] = null;
      }
    }
  }else if(map.size()==2){
    ts2[0] = map.get(0);
    ts2[1] = map.get(1);
  }else if(map.size()==1){
    ts1[0] = map.get(0);
  }else{
  }
}

void mouseClicked(){
  for(Circles c : map){
    if (!(c.hit) && c.checkHit(mouseX, mouseY)) {
      c.hit = true;
      c.playNote();
    }
    c.timeEnd = millis();
    //make the circle disappear, seems to only work when the outer circle is actually bigger right now?
    println(c.getTime());
  }
}
