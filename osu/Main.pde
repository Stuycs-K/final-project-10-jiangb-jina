Circles test1;

void setup(){
  size(800,800);
  test1 = new Circles(400,400);
}


void draw(){
  background(255);
  test1.update();
  test1.display();
  delay(50);
}
