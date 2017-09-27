// ==========================================================================
// ==========================================================================

abstract class Pattern {
  
  public abstract void init();
  public abstract void draw();
  public abstract void shift();
  public abstract int getDelay();
  
}

// ==========================================================================
// ==========================================================================

class Position {
  
  public static final int minXPosition = 1;
  public static final int maxXPosition = 10;
  public static final int minYPosition = 1;
  public static final int maxYPosition = 20;
  public static final int minZPosition = 1;
  public static final int maxZPosition = 4;

}

// ==========================================================================
// ==========================================================================

abstract class ScreenElement {

  public abstract void draw();
  public abstract void shift();

}

// ==========================================================================
// ==========================================================================

class Pixel {
}

// ==========================================================================
// ==========================================================================

abstract class Line extends ScreenElement {
  
  int xPosition; 
  int yPosition; 
  int zPosition; 
  int length; 
  
  color c;
  
}

// ==========================================================================
// ==========================================================================

class HorizontalLine extends Line {

  private int h = (int) Constants.PANEL_HEIGHT / Constants.PIXELS_PER_PANEL_HEIGHT; // height of pixel
  private int w = (int) Constants.PANEL_WIDTH / Constants.PIXELS_PER_PANEL_WIDTH; // width of pixel
  private boolean right = true; // moving right
  
  public HorizontalLine(color c, int xPosition, int yPosition, int zPosition, int length, boolean right) {
    this.c = c;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    this.zPosition = zPosition;
    this.length = length;
    this.right = right;
  }

  public void draw() {
    int topLeftX = ((zPosition - 1) * Constants.PANEL_WIDTH) + ((xPosition - 1) * w);
    int topLeftY = (Position.maxYPosition - yPosition) * h; // determined from position
    int lineWidth = w * length;
    fill(c);
    rect(topLeftX, topLeftY, lineWidth, h);
  }
  
  public void shift() {
    if ((xPosition + (length - 1)) == Position.maxXPosition) {
      right = false; // move left
    }
    if (xPosition == Position.minXPosition) {
      right = true; // move right
    }
    if (right) {
      // move right
      xPosition++;
    } else {
      // move left
      xPosition--;
    }
  }

}

// ==========================================================================
// ==========================================================================

class VerticalLine extends Line {

  private int h = (int) Constants.PANEL_HEIGHT / Constants.PIXELS_PER_PANEL_HEIGHT; // height of pixel
  private int w = (int) Constants.PANEL_WIDTH / Constants.PIXELS_PER_PANEL_WIDTH; // width of pixel
  private boolean upwards = true; // moving right
  
  public VerticalLine(color c, int xPosition, int yPosition, int zPosition, int length, boolean upwards) {
    this.c = c;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    this.zPosition = zPosition;
    this.length = length;
    this.upwards = upwards;
  }

  public void draw() {
    int topLeftX = ((zPosition - 1) * Constants.PANEL_WIDTH) + ((xPosition - 1) * w);
    int topLeftY = yPosition * h; // determined from position
    int lineHeight = h * length;
    fill(c);
    rect(topLeftX, topLeftY, w, lineHeight);
  }
  
  public void shift() {
    if ((yPosition + length) == Position.maxYPosition) {
      upwards = true; // move up
    }
    if (yPosition == (Position.minYPosition - 1)) {
      upwards = false; // move down
    }
    if (upwards) {
      // move up
      yPosition--;
    } else {
      // move down
      yPosition++;
    }
  }

}

// ==========================================================================
// ==========================================================================

abstract class Plane extends ScreenElement {

  color c;
  
}

// ==========================================================================
// ==========================================================================

/**
 * Plane runs horizontal to floor
 */
class HorizontalPlane extends Plane {
  
  private int yPosition; // height 
  private int h = (int) Constants.PANEL_HEIGHT / Constants.PIXELS_PER_PANEL_HEIGHT; // height of pixel
  private int w = Constants.MAIN_WIDTH;;
  private int topLeftX = 0; // always 0
  private boolean upwards = true;
  
  public HorizontalPlane(color c, int yPosition, boolean upwards) {
    this.c = c;
    this.yPosition = yPosition;
    this.upwards = upwards;
  }
  
  /**
   * Draw rectagle at correct height across screen
   */
  public void draw() {
    int topLeftY = (Position.maxYPosition - yPosition) * h; // determined from position
    fill(c);
    rect(topLeftX, topLeftY, w, h);
  }
  
  public void shift() {
    if (yPosition == Position.maxYPosition) {
      upwards = false; // move down
    }
    if (yPosition == Position.minYPosition) {
      upwards = true; // move up
    }
    if (upwards) {
      // move up
      yPosition++;
    } else {
      // move down
      yPosition--;
    }
  }
  
}

// ==========================================================================
// ==========================================================================

/**
 * Plane that runs perprendicular to the front
 */
class VerticalPlane extends Plane {

  private int xPosition; 
  private int h = Constants.PANEL_HEIGHT * 2; // height of screen
  private int w = (int) Constants.MAIN_WIDTH / (Constants.PIXELS_PER_PANEL_WIDTH * Constants.HORIZONTAL_PANELS);
  private int topLeftY = 0; // always 0
  private boolean right = true;
  
  public VerticalPlane(color c, int xPosition, boolean right) {
    this.c = c;
    this.xPosition = xPosition;
    this.right = right;
  }
  
  /**
   * Draw rectagle at correct height across screen
   */
  public void draw() {
    int topLeftX = (Position.maxXPosition - xPosition) * w; // determined from position
    fill(c);
    rect(topLeftX, topLeftY, w, h);
    rect(topLeftX + Constants.PANEL_WIDTH, topLeftY, w, h);
    rect(topLeftX + (Constants.PANEL_WIDTH*2), topLeftY, w, h);
    rect(topLeftX + (Constants.PANEL_WIDTH*3), topLeftY, w, h);
  }
  
  public void shift() {
    if (xPosition == Position.maxXPosition) {
      right = false; // move left
    }
    if (xPosition == Position.minXPosition) {
      right = true; // move right
    }
    if (right) {
      // move right
      xPosition++;
    } else {
      // move left
      xPosition--;
    }
  }
  
}