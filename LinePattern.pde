// ==========================================================================
// ==========================================================================

class HorizontalLinePattern extends Pattern {
  
  private HorizontalLine[] horizontalLines;
  private int LINE_COUNT = 40;
  
  private int getRandomLength() {
    return (int) random(1, 4);
  }
  
  private boolean getRandomDirection() {
    int r = (int) random(1, 100);
    return (r % 2) == 0;
  }
  
  private int getRandomXPosition(int length) {
    return (int) random(1, (Position.maxXPosition - length));
  }
  
  private int getRandomYPosition() {
    return (int) random(1, Position.maxYPosition);
  }
  
  private int getRandomZPosition() {
    return (int) random(1, Position.maxZPosition + 1);
  }
  
  public void init() {
    horizontalLines = new HorizontalLine[LINE_COUNT];
    for (int i=0; i<LINE_COUNT; i++) {
      int l = getRandomLength();
      horizontalLines[i] = new HorizontalLine(color(random(255),random(255),random(255)), getRandomXPosition(l), getRandomYPosition(), getRandomZPosition(), l, getRandomDirection());
    }
  }
  
  public void draw() {
    for (int i=0; i<LINE_COUNT; i++) {
      horizontalLines[i].draw();
    }
  }
  
  public void shift() {
    for (int i=0; i<LINE_COUNT; i++) {
      horizontalLines[i].shift();
    }
  }
  
  public int getDelay() {
    return -1;
  }

}

// ==========================================================================
// ==========================================================================

class VerticalLinePattern extends Pattern {
  
  private VerticalLine[] verticalLines;
  private int LINE_COUNT = 40;
  
  private int getRandomLength() {
    return (int) random(1, 6);
  }
  
  private boolean getRandomDirection() {
    int r = (int) random(1, 100);
    return (r % 2) == 0;
  }
  
  private int getRandomXPosition() {
    return (int) random(1, Position.maxXPosition);
  }
  
  private int getRandomYPosition(int length) {
    return (int) random(1, (Position.maxYPosition - length));
  }
  
  private int getRandomZPosition() {
    return (int) random(1, Position.maxZPosition + 1);
  }
  
  public void init() {
    verticalLines = new VerticalLine[LINE_COUNT];
    for (int i=0; i<LINE_COUNT; i++) {
      int l = getRandomLength();
      verticalLines[i] = new VerticalLine(color(random(255),random(255),random(255)), getRandomXPosition(), getRandomYPosition(l), getRandomZPosition(), l, getRandomDirection());
    }
  }
  
  public void draw() {
    for (int i=0; i<LINE_COUNT; i++) {
      verticalLines[i].draw();
    }
  }
  
  public void shift() {
    for (int i=0; i<LINE_COUNT; i++) {
      verticalLines[i].shift();
    }
  }
  
  public int getDelay() {
    return -1;
  }

}


// ==========================================================================
// ==========================================================================

class CombinationLinePattern extends Pattern {
  
  private HorizontalLinePattern horizontalLinePattern;
  private VerticalLinePattern verticalLinePattern;
  
  public void init() {
    horizontalLinePattern = new HorizontalLinePattern();
    verticalLinePattern = new VerticalLinePattern();
    
    horizontalLinePattern.init();
    verticalLinePattern.init();
  }
  
  public void draw() {
    horizontalLinePattern.draw();
    verticalLinePattern.draw();
  }
  
  public void shift() {
    horizontalLinePattern.shift();
    verticalLinePattern.shift();
  }
  
  public int getDelay() {
    return -1;
  }
  

}