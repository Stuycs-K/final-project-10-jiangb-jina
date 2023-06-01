public class Score {
  //unique to circle
  float timeDiff;
  int add;
  //global
  int points;
  int combo;
  int boost;
  int taps;

  public Score(float diff) {
    //score here is single object, unique to each circle 
    timeDiff = diff;
    points += calculatePoints();
  }

  public int calculatePoints() {
    //timediff based off of expected time hit vs actual time, which depends on the rate
    //depends on delay
    if (timeDiff<=120) {
      add = 300;
    } else if (timeDiff<=300) {
      add = 100;
    } else {
      add = 50;
    }
    add = add*(1+boost);
    //implicitely, get 0 if missed = no time difference
    points += add;
    //update scoreboard
    return points;
  }

  public int calculateCombo() {
    //add to combo when tapped
    if (combo>=10) {
      boost = int(0.2 + 0.05*(combo-10));
    }
    //do we want strings
    return boost;
  }

  public int countTaps() {
    taps++;
    //update scoreboard
    return taps;
  }
}
