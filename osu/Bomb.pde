import ddf.minim.*;
import processing.sound.*;

public class Bomb extends Circles{
  public Bomb(int x, int y, int CN, int p){
    super(x, y, CN, p);
  }
  public int isBomb(){
    return 1;
  }
}
