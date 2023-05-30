Circles test1;
Circles test2;
Circles test3;
Circles test4;
ArrayList<Circles> map = new ArrayList<Circles>();

void setup(){
  size(800,800);
  map.add(new Circles(100,100));
  map.add(new Circles(300,300));
  map.add(new Circles(500,500));
  map.add(new Circles(700,700));
}


void draw(){
  background(255);
  for(Circles c : map){
    if(c.display()){
      c.update();
    }else{
      c.cover();
     // map.remove(map.indexOf(c));
    }
    delay(50);
  }
  /*
  for(int i = 0; i < map.length; i++){
    if(map[i].display()){
      test1.update();
    }else{
      test1.cover();
    }
    delay(50);
  }
  */
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
