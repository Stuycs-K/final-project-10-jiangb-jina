Circles test1;
Circles test2;
Circles test3;
Circles test4;
Circles[] map = new Circles[4];

void setup(){
  size(800,800);
  map[0] = new Circles(100,100);
  map[1] = new Circles(300,300);
  map[2] = new Circles(500,500);
  map[3] = new Circles(700,700);
}


void draw(){
  background(255);
  for(Circles c : map){
    if(c.display()){
      c.update();
    }else{
      c.cover();
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
  }
  println("mouse is clicked");
}
