Circles test1;

void setup(){
  size(800,800);
  test1 = new Circles(400,400);
}


void draw(){
  background(255);
  if(test1.display()){
    test1.update();
    test1.mouseClicked();
  }else{
    test1.cover();
  }
  
  delay(50);
}
