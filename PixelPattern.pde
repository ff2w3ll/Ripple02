// ==========================================================================
// ==========================================================================

class PixelPattern extends Pattern {
  
  private int PIXEL_COUNT = 4;
  private int CURRENT_PANEL = 0;
  private int CURRENT_X = 1;
  private int CURRENT_Y = 2;

  private int[][] pixelArray;
  private color[] pixelColor;
  
  private int PANEL_COUNT = 4; // joined top and bottom
  private int HORIZONTAL_PIXELS = 10;
  private int VERTICAL_PIXELS = 20; // top and bottom panels
  
  private int pixelSize;
    
  public void init() {
    pixelArray = new int[PIXEL_COUNT][4];
    pixelColor = new color[PIXEL_COUNT];
    
    for (int i=0; i<PIXEL_COUNT; i++) {
      pixelArray[i][CURRENT_PANEL] = i;
      pixelArray[i][CURRENT_Y] = 0;
      pixelArray[i][CURRENT_X] = 0;
      //pixelColor[i] = color(random(255),random(255),random(255));
    }
    
    pixelColor[0] = color(255);
    pixelColor[1] = color(255, 0, 0);
    pixelColor[2] = color(0, 255, 0);
    pixelColor[3] = color(0, 0, 255);

    pixelSize = Constants.PANEL_WIDTH / HORIZONTAL_PIXELS;
  }
  
  private void shiftPixels() {
    for (int i=0; i<PIXEL_COUNT; i++) {
      pixelArray[i][CURRENT_X]++;
      // shift row
      if (pixelArray[i][CURRENT_X]>(HORIZONTAL_PIXELS-1)) {
        pixelArray[i][CURRENT_X] = 0;
        pixelArray[i][CURRENT_Y]++;
      }
      // shift panel
      if (pixelArray[i][CURRENT_Y]>(VERTICAL_PIXELS-1)) {
        pixelArray[i][CURRENT_X] = 0;
        pixelArray[i][CURRENT_Y] = 0;
        pixelArray[i][CURRENT_PANEL]++;
      }
      // flip to start
      if (pixelArray[i][CURRENT_PANEL]>(PANEL_COUNT-1)) {
        pixelArray[i][CURRENT_X] = 0;
        pixelArray[i][CURRENT_Y] = 0;
        pixelArray[i][CURRENT_PANEL] = 0;
      }
    }
  }
  
  private void drawPixels() {
    for (int i=0; i<PIXEL_COUNT; i++) {
      int panelOffset = pixelArray[i][CURRENT_PANEL] * Constants.PANEL_WIDTH;
      int pixelXOffset = pixelArray[i][CURRENT_X] * pixelSize;
      int pixelYOffset = pixelArray[i][CURRENT_Y] * pixelSize;
      noStroke();
      fill(pixelColor[i]);
      rect(panelOffset+pixelXOffset, pixelYOffset, pixelSize, pixelSize);
    }
  }
  
  public void draw() {
    // draw pixels
    drawPixels();
  }
  
  public void shift() {
    // shift position
    shiftPixels();
  }
  
  public int getDelay() {
    return 50;
  }
  
}