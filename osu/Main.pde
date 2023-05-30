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
    test1.timeEnd = millis();
    println("mouse is clicked");
    //make the circle disappear, seems to only work when the outer circle is actually bigger right now?
    println(test1.getTime());
}
