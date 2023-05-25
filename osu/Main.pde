void setup(){
  size(800,800);
}

void draw(){
  background(255);
  Circles test1 = new Circles(400,400);
  test1.printInner();
  test1.printOuter();
}
