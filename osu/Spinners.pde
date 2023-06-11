public class Spinners{
  boolean c1,c2,c3,c4; //four checkpoints
  int rev; //total number of revolutions
  int duration; //how long would it be appearing for, in frames
  int currentDuration; //current frames accumulated
  
  public Spinners(int duration){
    c1 = false;
    c2 = false;
    c3 = false;
    c4 = false;
    rev = 0;
    this.duration = duration; 
  }
  
  public void draw(){
    fill(#4D78EC);
    circle(width/2, height/2, 100);
    if(mouseX < width/2 && mouseY < height/2){
      c1 = true;
    }
    if(mouseX > width/2 && mouseY > height/2){
      c3 = true;
    }
    if(mouseX > width/2 && mouseY < height/2){
      c2 = true;
    }
    if(mouseX < width/2 && mouseY > height/2){
      c4 = true;
    }
  }
  
  public boolean checkRev(){
    if(c1&&c2&&c3&&c4){
      rev++;
      c1 = false;
      c2 = false;
      c3 = false;
      c4 = false;
      println("" + rev + " revs");
      return true;
    }else{
      return false;
    }
  }
  
  
}
