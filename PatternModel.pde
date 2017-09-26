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

class Pixel {
}

// ==========================================================================
// ==========================================================================

class Line {
}

// ==========================================================================
// ==========================================================================

class Plane {
  
  
}

// ==========================================================================
// ==========================================================================

class HorizontalPlane extends Plane {
  
  private color c;
  private int position; 
  private int maxPosition = 20; // 20 = top
  private int minPosition = 1; // 1 = bottom
  private int h = (int) Constants.PANEL_HEIGHT / Constants.PIXELS_PER_PANEL_HEIGHT; // height of pixel
  private int w = Constants.MAIN_WIDTH;;
  private int topLeftX = 0; // always 0
  private boolean upwards = true;
  
  public HorizontalPlane(color c, int position, boolean upwards) {
    this.c = c;
    this.position = position;
    this.upwards = upwards;
  }
  
  /**
   * Draw rectagle at correct height across screen
   */
  public void draw() {
    int topLeftY = (maxPosition - position) * h; // determined from position
    fill(c);
    rect(topLeftX, topLeftY, w, h);
  }
  
  public void move() {
    if (position == maxPosition) {
      upwards = false; // move down
    }
    if (position == minPosition) {
      upwards = true; // move up
    }
    if (upwards) {
      // move up
      position++;
    } else {
      // move down
      position--;
    }
  }
  
}

// ==========================================================================
// ==========================================================================

/**
 * Plane that runs flat to the front
 */
class FlatVerticalPlane extends Plane {
}

// ==========================================================================
// ==========================================================================

/**
 * Plane that runs perprendicular to the front
 */
class PerpendicularVerticalPlane extends Plane {

  private color c;
  private int position; 
  private int maxPosition = 10; // 10 = right
  private int minPosition = 1; // 1 = left
  private int h = Constants.PANEL_HEIGHT * 2; // height of screen
  private int w = (int) Constants.MAIN_WIDTH / (Constants.PIXELS_PER_PANEL_WIDTH * Constants.HORIZONTAL_PANELS);
  private int topLeftY = 0; // always 0
  private boolean right = true;
  
  public PerpendicularVerticalPlane(color c, int position, boolean right) {
    this.c = c;
    this.position = position;
    this.right = right;
  }
  
  /**
   * Draw rectagle at correct height across screen
   */
  public void draw() {
    int topLeftX = (maxPosition - position) * w; // determined from position
    fill(c);
    rect(topLeftX, topLeftY, w, h);
    rect(topLeftX + Constants.PANEL_WIDTH, topLeftY, w, h);
    rect(topLeftX + (Constants.PANEL_WIDTH*2), topLeftY, w, h);
    rect(topLeftX + (Constants.PANEL_WIDTH*3), topLeftY, w, h);
  }
  
  public void move() {
    if (position == maxPosition) {
      right = false; // move left
    }
    if (position == minPosition) {
      right = true; // move right
    }
    if (right) {
      // move up
      position++;
    } else {
      // move down
      position--;
    }
  }
  
}