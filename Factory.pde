public class PanelFactory {

    /**
     *
     * @param parentRect - containing rectangle
     * @return
     */
    private StripRect[][] createStripRects(Rect parentRect) {
        int sizeX = (int) parentRect.getWidth() / Constants.STRIP_HORIZONTAL_PIXELS;
        int sizeY = (int) parentRect.getHeight() / Constants.STRIP_VERTICAL_PIXELS;

        StripRect[][] stripRects = new StripRect[Constants.STRIP_VERTICAL_PIXELS][Constants.STRIP_HORIZONTAL_PIXELS];

        for (int v=0; v<Constants.STRIP_VERTICAL_PIXELS; v++) {
            for (int h=0; h<Constants.STRIP_HORIZONTAL_PIXELS; h++) {
                // calculate values for points
                int topLeftX = parentRect.getTopLeft().getX() + (h * sizeX);
                int topLeftY = parentRect.getTopLeft().getY() + (v * sizeY);
                int bottomRightX = topLeftX + sizeX;
                int bottomRightY = topLeftY + sizeY;

                // set values
                Point topLeft = new Point(topLeftX, topLeftY);
                Point bottomRight = new Point(bottomRightX, bottomRightY);
                Rect rect = new Rect(topLeft, bottomRight);
                stripRects[v][h] = new StripRect(rect);
            }
        }

        return stripRects;

    }

    private UpperStrip createUpperStrip(Rect rect) {
        UpperStrip upperStrip = new UpperStrip();

        // create strip rects
        StripRect[][] stripRects = createStripRects(rect);
        upperStrip.setStripRects(stripRects);

        // index strip rects
        // upper strip starts left bottom and runs backwards then forwards
        Point[] indexedCentres = new Point[Constants.STRIP_HORIZONTAL_PIXELS * Constants.STRIP_VERTICAL_PIXELS];
        boolean forwards = false;
        int index = 0;
        for (int v=(Constants.STRIP_VERTICAL_PIXELS-1); v>=0; v--) {
            if (forwards) {
                // run forwards
                for (int h=0; h<Constants.STRIP_HORIZONTAL_PIXELS; h++) {
                    StripRect stripRect = stripRects[v][h];
                    stripRect.setIndex(index);
                    indexedCentres[index] = stripRect.getRect().getCentre();
                    index++;
                }
            } else {
                // run backwards
                for (int h=Constants.STRIP_HORIZONTAL_PIXELS-1; h>=0; h--) {
                    StripRect stripRect = stripRects[v][h];
                    stripRect.setIndex(index);
                    indexedCentres[index] = stripRect.getRect().getCentre();
                    index++;
                }
            }
            forwards = !forwards;
        }
        upperStrip.setIndexedCentres(indexedCentres);

        return upperStrip;
    }

    private LowerStrip createLowerStrip(Rect rect) {
        LowerStrip lowerStrip = new LowerStrip();

        // create strip rects
        StripRect[][] stripRects = createStripRects(rect);
        lowerStrip.setStripRects(stripRects);

        // index strip rects
        // upper strip starts left bottom and runs backwards then forwards
        Point[] indexedCentres = new Point[Constants.STRIP_HORIZONTAL_PIXELS * Constants.STRIP_VERTICAL_PIXELS];
        boolean forwards = false;
        int index = 0;
        for (int v=0; v<Constants.STRIP_VERTICAL_PIXELS; v++) {
            if (forwards) {
                // run forwards
                for (int h=0; h<Constants.STRIP_HORIZONTAL_PIXELS; h++) {
                    StripRect stripRect = stripRects[v][h];
                    stripRect.setIndex(index);
                    indexedCentres[index] = stripRect.getRect().getCentre();
                    index++;
                }
            } else {
                // run backwards
                for (int h=Constants.STRIP_HORIZONTAL_PIXELS-1; h>=0; h--) {
                    StripRect stripRect = stripRects[v][h];
                    stripRect.setIndex(index);
                    indexedCentres[index] = stripRect.getRect().getCentre();
                    index++;
                }
            }
            forwards = !forwards;
        }
        lowerStrip.setIndexedCentres(indexedCentres);

        return lowerStrip;
    }

    public Panel createPanel(int verticalPosition, int horizontalPosition) {
        Panel panel = new Panel();

        // create Rect ===
        // -- top left
        int topLeftX = horizontalPosition * Constants.PANEL_WIDTH;
        int topLeftY = verticalPosition * Constants.PANEL_HEIGHT;
        Point topLeft = new Point(topLeftX, topLeftY);
        // -- bottom right
        int bottomRightX = topLeftX + Constants.PANEL_WIDTH;
        int bottomRightY = topLeftY + Constants.PANEL_HEIGHT;
        Point bottomRight = new Point(bottomRightX, bottomRightY);
        // -- add rect
        panel.setRect(new Rect(topLeft, bottomRight));

        // create UpperStrip ===
        panel.setUpperStrip(createUpperStrip(panel.getUpperStripRect()));

        // create LowerStrip ===
        panel.setLowerStrip(createLowerStrip(panel.getLowerStripRect()));

        return panel;
    }

    public Panel[][] createPanels() {
        Panel[][] panels = new Panel[Constants.VERTICAL_PANELS][Constants.HORIZONTAL_PANELS];
        for (int v=0; v<Constants.VERTICAL_PANELS; v++) {
            for (int h=0; h<Constants.HORIZONTAL_PANELS; h++) {
                panels[v][h] = createPanel(v, h);
            }
        }
        return panels;
    }
}