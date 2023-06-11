public class Spinners{
  boolean c1,c2,c3,c4; //four checkpoints
  int rev; //total number of revolutions
  
  public Spinners{
    c1 = false;
    c2 = false;
    c3 = false;
    c4 = false;
    rev = 0;
  }
  
  public void draw(){
    if(mouseX == width/2 && mouseY < height/2){
      c1 = true;
    }
    if(mouseX == width/2 && mouseY > height/2){
      c3 = true;
    }
    if(mouseX > width/2 && mouseY == height/2){
      c2 = true;
    }
    if(mouseX < width/2 && mouseY == height/2){
      c4 = true;
    }
    if(c1&&c2&&c3&&c4){
      rev++;
      c1 = false;
      c2 = false;
      c3 = false;
      c4 = false;
    }
  }
}
