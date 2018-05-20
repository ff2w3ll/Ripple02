// ==========================================================================
// ==========================================================================

class SquarePattern extends Pattern {
  
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
    return -1;
  }
  
}