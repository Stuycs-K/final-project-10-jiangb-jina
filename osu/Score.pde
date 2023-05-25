public class Score{
  int points;
  int combo;
  int taps;
  
  public Score(float timeDiff){
    //or do we want a singel object, so the points add up?
    points = calculatePoints(timeDiff);
  }
  
  public int calculatePoints(float timeDiff){
    //formula
  }
  
  public String calculateCombo(float timeDiff){
  }
}
