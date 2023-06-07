public class Score {
  //unique to circle
  float timeDiff;
  int add;
  //global
  int points;
  int combo = 0;

  public Score(float timeDiff, boolean bomb) {
    //or do we want a single object, so the points add up?
    if (!bomb){
      points = int(calculatePoints(timeDiff));
      combo++;
      calculateBoost();
    }
    else{
      points = -100;
      combo = 0;
    }
  }

  public float calculatePoints(float timeDiff) {
    //timediff based off of expected time hit vs actual time, which depends on the rate
    //depends on delay
    float add = 0;
    if (timeDiff<=300) {
      add = 300;
    } else if (timeDiff<=500) {
      add = 100;
    } else {
      add = 50;
    }
    add = add*(1+calculateBoost());
    //implicitely, get 0 if missed = no time difference
    points += add;
    //update scoreboard
    return points;
  }
  public float calculateBoost() {
    //consecutive taps, displayed in lower left
    float boost = 0;
    if (combo>=10) {
      boost = 0.2 + 0.05*(combo-10);
    }
    //do we want strings
    return boost;
  }
}
