public class Score{
  int points;
  int combo;
  
  public Score(float timeDiff){
    //or do we want a single object, so the points add up?
    points = int(calculatePoints(timeDiff));
    combo++;
    calculateBoost();
  }
  
  public float calculatePoints(float timeDiff){
    //timediff based off of expected time hit vs actual time, which depends on the rate
    //depends on delay
    float add = 0;
    if (timeDiff<=120){
      add = 300;
    }
    else if (timeDiff<=300){
      add = 100;
    }
    else{
      add = 50;
    }
    add = add*(1+calculateBoost());
    //implicitely, get 0 if missed = no time difference
    points += add;
    //update scoreboard
    return points;
  }
  
  public float calculateBoost(){
    //consecutive taps, displayed in lower left
    float boost = 0;
    if (combo>=10){
      boost = 0.2 + 0.05*(combo-10);  
    }
    //do we want strings 
    return boost;
  }
}
