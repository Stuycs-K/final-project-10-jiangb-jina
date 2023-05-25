void setup(){
  size(800,800);
}

void draw(){
  background(255);
  Circles test1 = new Circles(400,400);
  /*
  int oRds = 250;
  for(int i = 0; i < 20; i++){
      stroke(255);
      fill(145,30,30);
      circle(400,400,150);
      fill(255);
      circle(400,400,oRds);
      delay(1000);
      stroke(0);
      circle(400,400,oRds);
      oRds -= 5;
    }
    */
    test1.display();
}
