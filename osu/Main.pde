Circles test1;

void setup(){
  size(800,800);
  test1 = new Circles(400,400);
}


void draw(){
  background(255);
  if(test1.display()){
    test1.update();
  }else{
    test1.cover();
  }
  
  delay(50);
}

void mouseClicked(){
  if (!(test1.hit) && test1.checkHit(mouseX, mouseY)) {
      test1.hit = true;
      test1.playNote();
    }
    println("mouse is clicked");
}
