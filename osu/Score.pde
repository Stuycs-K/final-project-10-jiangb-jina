public class Score{
  int points;
  int add ;
  int combo;
  int boost;
  int taps;
  
  public Score(float timeDiff){
    //or do we want a single object, so the points add up?
    points = calculatePoints(timeDiff);
  }
  
  public int calculatePoints(float timeDiff){
    if (timeDiff<=23){
      add = 300;
    }
    if else (timeDiff<=1000){
      add = 100;
    }
    else{
      add = 50;
    }
    add = add(1+boost);
    //implicitely, get 0 if missed = no time difference
    points += add;
    //update scoreboard
  }
  
  public float calculateCombo(){
    //add to combo when tapped
    if (combo>=10){
      boost = 0.2 + 0.05*(combo-10);  
    }
  }
  
  public int countTaps(){
    
  }
}
