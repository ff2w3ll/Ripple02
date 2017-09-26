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
      horizontalPlanes[i].move();
    }
  }
  
  public int getDelay() {
    int delay = 100;
    return delay;
  }
  
}

// ==========================================================================
// ==========================================================================

class PerpendicularVerticalPattern extends Pattern {
  
  private PerpendicularVerticalPlane[] perpendicularVerticalPlanes;
  private int PLANE_COUNT = 2;
  
  public void init() {
    perpendicularVerticalPlanes = new PerpendicularVerticalPlane[PLANE_COUNT];
    for (int i=0; i<PLANE_COUNT; i++) {
      color c = color(random(255),random(255),random(255));
      perpendicularVerticalPlanes[i] = new PerpendicularVerticalPlane(c, i*(10/PLANE_COUNT), true);  
    }
  }
  
  public void draw() {
    for (int i=0; i<PLANE_COUNT; i++) {
      perpendicularVerticalPlanes[i].draw();
    }
    count++;
  }
  
  public void shift() {
    for (int i=0; i<PLANE_COUNT; i++) {
      perpendicularVerticalPlanes[i].move();
    }
  }
  
  public int getDelay() {
    int delay = 100;
    return delay;
  }
  
}