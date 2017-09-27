// ==========================================================================
// ==========================================================================

class HorizontalPlanePattern extends Pattern {
  
  private HorizontalPlane[] horizontalPlanes;
  private int PLANE_COUNT = 3;
  
  public void init() {
    horizontalPlanes = new HorizontalPlane[PLANE_COUNT];
    for (int i=0; i<PLANE_COUNT; i++) {
      color c = color(random(255),random(255),random(255));
      horizontalPlanes[i] = new HorizontalPlane(c, i*(20/PLANE_COUNT), true);  
    }
  }
  
  public void draw() {
    for (int i=0; i<PLANE_COUNT; i++) {
      horizontalPlanes[i].draw();
    }
  }
  
  public void shift() {
    for (int i=0; i<PLANE_COUNT; i++) {
      horizontalPlanes[i].shift();
    }
  }
  
  public int getDelay() {
    int delay = 100;
    return delay;
  }
  
}

// ==========================================================================
// ==========================================================================

class VerticalPlanePattern extends Pattern {
  
  private VerticalPlane[] verticalPlanes;
  private int PLANE_COUNT = 2;
  
  public void init() {
    verticalPlanes = new VerticalPlane[PLANE_COUNT];
    for (int i=0; i<PLANE_COUNT; i++) {
      color c = color(random(255),random(255),random(255));
      verticalPlanes[i] = new VerticalPlane(c, i*(10/PLANE_COUNT), true);  
    }
  }
  
  public void draw() {
    for (int i=0; i<PLANE_COUNT; i++) {
      verticalPlanes[i].draw();
    }
  }
  
  public void shift() {
    for (int i=0; i<PLANE_COUNT; i++) {
      verticalPlanes[i].shift();
    }
  }
  
  public int getDelay() {
    int delay = 100;
    return delay;
  }
  
}

// ==========================================================================
// ==========================================================================

class CombinationPlanePattern extends Pattern {
  
  private HorizontalPlanePattern horizontalPlanePattern;
  private VerticalPlanePattern verticalPlanePattern;
  
  public void init() {
    horizontalPlanePattern = new HorizontalPlanePattern();
    verticalPlanePattern = new VerticalPlanePattern();

    horizontalPlanePattern.init();
    verticalPlanePattern.init();
  }
  
  public void draw() {
    horizontalPlanePattern.draw();
    verticalPlanePattern.draw();
  }
  
  public void shift() {
    horizontalPlanePattern.shift();
    verticalPlanePattern.shift();
  }
  
  public int getDelay() {
    int delay = 100;
    return delay;
  }
  
}