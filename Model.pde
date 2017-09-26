// ==========================================================================
// ==========================================================================

class Screen {
  
  private Panel[][] panels;
  
  public void init() {
    panels = new PanelFactory().createPanels();
  }
  
  public void drawPanels() {
    noFill();
    stroke(255);
    for (int v=0; v<Constants.VERTICAL_PANELS; v++) {
      for (int h=0; h<Constants.HORIZONTAL_PANELS; h++) {
        Panel panel = panels[v][h];
        Rect rect = panel.getRect();
        rect(rect.getTopLeft().getX(), rect.getTopLeft().getY(), rect.getWidth(), rect.getHeight());
      }
    }
  }
  
  public void draw() {
    drawPanels();
  }
  
  public Panel[][] getPanels() {
    return panels;
  }
  
}

// ==========================================================================
// ==========================================================================

public class Panel {

    private Rect rect;
    private UpperStrip upperStrip;
    private LowerStrip lowerStrip;

    public Panel() {
    }

    public Rect getRect() {
        return rect;
    }

    public void setRect(Rect rect) {
        this.rect = rect;
    }

    public Rect getUpperStripRect() {
      // upper half of panel
      int topLeftX = rect.getTopLeft().getX();
      int topLeftY = rect.getTopLeft().getY();
      Point topLeft = new Point(topLeftX, topLeftY);
      int bottomRightX = rect.getBottomRight().getX();
      int bottomRightY = rect.getCentreY();
      Point bottomRight = new Point(bottomRightX, bottomRightY);
      return new Rect(topLeft, bottomRight);
    }
    
    public Rect getLowerStripRect() {
      // upper half of panel
      int topLeftX = rect.getTopLeft().getX();
      int topLeftY = rect.getCentreY();
      Point topLeft = new Point(topLeftX, topLeftY);
      int bottomRightX = rect.getBottomRight().getX();
      int bottomRightY = rect.getBottomRight().getY();
      Point bottomRight = new Point(bottomRightX, bottomRightY);
      return new Rect(topLeft, bottomRight);
    }
    
    public UpperStrip getUpperStrip() {
        return upperStrip;
    }

    public void setUpperStrip(UpperStrip upperStrip) {
        this.upperStrip = upperStrip;
    }

    public LowerStrip getLowerStrip() {
        return lowerStrip;
    }

    public void setLowerStrip(LowerStrip lowerStrip) {
        this.lowerStrip = lowerStrip;
    }

    @Override
    public String toString() {
        return "Panel{" + "rect=" + rect + ", upperStrip=" + upperStrip + ", lowerStrip=" + lowerStrip + '}';
    }
    
}

// ==========================================================================
// ==========================================================================

public class Rect {

    private Point topLeft;
    private Point bottomRight;
    private Point centre;

    public Rect(Point topLeft, Point bottomRight) {
        this.topLeft = topLeft;
        this.bottomRight = bottomRight;
    }

    public Point getTopLeft() {
        return topLeft;
    }

    public Point getBottomRight() {
        return bottomRight;
    }

    public int getCentreX() {
        int sizeX = (int) (getWidth() / 2);
        return topLeft.getX() + sizeX;
    }

    public int getCentreY() {
        int sizeY = (int) (getHeight() / 2);
        return topLeft.getY() + sizeY;
    }

    public Point getCentre() {
        if (centre==null) {
            int x = getCentreX();
            int y = getCentreY();
            centre = new Point(x, y);
        }
        return centre;
    }

    public int getWidth() {
        return bottomRight.getX() - topLeft.getX();
    }

    public int getHeight() {
        return bottomRight.getY() - topLeft.getY();
    }

    @Override
    public String toString() {
        return "Rect{" + "topLeft=" + topLeft + ", bottomRight=" + bottomRight + ", centre=" + centre + '}';
    }
    
}

// ==========================================================================
// ==========================================================================

public class Point {

    private int x;
    private int y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }


    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }

}

// ==========================================================================
// ==========================================================================
public class StripRect {

    private Rect rect;
    private int index;
    
    public StripRect(Rect rect) {
        this.rect = rect;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public Rect getRect() {
        return rect;
    }

    @Override
    public String toString() {
        return "StripRect{" + "rect=" + rect + ", index=" + index + '}';
    }
    
}


// ==========================================================================
// ==========================================================================

public abstract class Strip {

    public StripRect[][] stripRects;
    public Point[] indexedCentres; // flattened array

    public StripRect[][] getStripRects() {
        return stripRects;
    }

    public void setStripRects(StripRect[][] stripRects) {
        this.stripRects = stripRects;
    }

    public Point[] getIndexedCentres() {
        return indexedCentres;
    }

    public void setIndexedCentres(Point[] indexedCentres) {
        this.indexedCentres = indexedCentres;
    }

    @Override
    public String toString() {
        return "Strip{" + "stripRects=" + stripRects + ", indexedCentres=" + indexedCentres + '}';
    } 
    
}

public class UpperStrip extends Strip {
    
}

public class LowerStrip extends Strip {
    
}