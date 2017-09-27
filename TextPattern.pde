
// ==========================================================================
// ==========================================================================

class TextPattern extends Pattern {

  private int step = 0;
  
  public void init() {
  }
  
  private String getString(int step) {
    if (step == 0) return "Y";
    if (step == 1) return "E";
    if (step == 2) return "S";
    return "";
  }
  
  public void draw() {
    fill(color(random(255),random(255),random(255)));
    textSize(200);
    text(getString(step), 10, (Constants.PANEL_HEIGHT - 20));    
    text(getString(step), 10 + (Constants.PANEL_WIDTH), (Constants.PANEL_HEIGHT - 20));    
    text(getString(step), 10 + (Constants.PANEL_WIDTH * 2), (Constants.PANEL_HEIGHT - 20));    
    text(getString(step), 10  + (Constants.PANEL_WIDTH * 3), (Constants.PANEL_HEIGHT - 20));
  }
  
  public void shift() {
    step++;
    if (step > 2) {
      step = 0;
    }
  }
  
  public int getDelay() {
    return 1000;
  }
  
}