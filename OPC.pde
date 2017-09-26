// ==========================================================================
// ==========================================================================

class RippleOPC {
  
  private OPC opc;
  
  private boolean drawPoints = true;
  
  public void init(Panel[][] panels) {
   // connect to fcServer
    opc = new OPC("127.0.0.1", 7890, Constants.MAIN_WIDTH, Constants.PANEL_HEIGHT*2);
    opc.showLocations(false);
    // add screen mapping for panels
    mapPanels(panels);
  }

 private int getOffsettedIndex(int offset, int verticalPanelIndex, int horizontalPanelIndex, int index) {
    int offsettedIndex = 0;
    // calculate index between 0..799 (800 LEDs)
    offsettedIndex = offset + (verticalPanelIndex * 400) + (horizontalPanelIndex * 100) + index;
    return offsettedIndex;
  }
  
  private int getPanelGroupId(int verticalPanelIndex, int horizontalPanelIndex) {
    int groupId = 0;
    groupId = (verticalPanelIndex * 4) + (horizontalPanelIndex);
    return groupId;
  }
  
  private void mapPanels(Panel[][] panels) {
    for (int v=0; v<Constants.VERTICAL_PANELS; v++) {
      for (int h=0; h<Constants.HORIZONTAL_PANELS; h++) {
        int groupId = getPanelGroupId(v, h);
        Panel panel = panels[v][h];
        // -- upper strip
        UpperStrip upperStrip = panel.getUpperStrip();
        Point[] indexedCentres = upperStrip.getIndexedCentres();
        for (int i=0; i<indexedCentres.length; i++) {
          Point centeredPoint = indexedCentres[i];
          int offsettedIndex = getOffsettedIndex(0, v, h, i);
          println(offsettedIndex, centeredPoint.getX(), centeredPoint.getY(), groupId);
          opc.led(offsettedIndex, centeredPoint.getX(), centeredPoint.getY(), groupId);
        }
        // -- lower strip
        LowerStrip lowerStrip = panel.getLowerStrip();
        indexedCentres = lowerStrip.getIndexedCentres();
        for (int i=0; i<indexedCentres.length; i++) {
          Point centeredPoint = indexedCentres[i];
          int offsettedIndex = getOffsettedIndex(50, v, h, i);
          println(offsettedIndex, centeredPoint.getX(), centeredPoint.getY(), groupId);
          opc.led(offsettedIndex, centeredPoint.getX(), centeredPoint.getY(), groupId);
        }
      }
    }    
  }
  
  private void drawPoint(int x, int y) {
    if (drawPoints) {
      stroke(255);
      point(x, y);
    }
  }
  
  public void draw(Panel[][] panels) {
    for (int v=0; v<Constants.VERTICAL_PANELS; v++) {
      for (int h=0; h<Constants.HORIZONTAL_PANELS; h++) {
        Panel panel = panels[v][h];
        // -- upper strip
        UpperStrip upperStrip = panel.getUpperStrip();
        Point[] indexedCentres = upperStrip.getIndexedCentres();
        for (int i=0; i<indexedCentres.length; i++) {
          Point centeredPoint = indexedCentres[i];
          drawPoint(centeredPoint.getX(), centeredPoint.getY());
        }
        // -- lower strip
        LowerStrip lowerStrip = panel.getLowerStrip();
        indexedCentres = lowerStrip.getIndexedCentres();
        for (int i=0; i<indexedCentres.length; i++) {
          Point centeredPoint = indexedCentres[i];
          drawPoint(centeredPoint.getX(), centeredPoint.getY());
        }
      }
    }    
  }
  
  public void push() {
    // all panels
    PImage capture = get(0, 0, Constants.MAIN_WIDTH, Constants.PANEL_HEIGHT*2); //<>//
    //capture.save("outputImage.jpg");

    for (int v=0; v<Constants.VERTICAL_PANELS; v++) {
     for (int h=0; h<Constants.HORIZONTAL_PANELS; h++) {
       int groupId = getPanelGroupId(v, h);
       opc.capture(capture, groupId);
     }
    }    
    opc.writePixels();
  }
  
};