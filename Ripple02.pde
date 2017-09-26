RippleOPC opc;
Pattern pattern;
Screen screen;

Pattern patterns[];
int PATTERN_COUNT = 2;
int count = 1;

void settings() {
  size(Constants.MAIN_WIDTH, Constants.MAIN_HEIGHT);
}

void setup() {
  // setup screen elements
  screen = new Screen();
  screen.init();
  
  // setup OPC connection and mapping
  opc = new RippleOPC();
  opc.init(screen.getPanels());
  
  // default pattern
  patterns = new Pattern[PATTERN_COUNT];
  patterns[0] = new HorizontalPlanePattern();
  patterns[1] = new PerpendicularVerticalPattern();
  
  for (int i=0; i<PATTERN_COUNT; i++) {
    patterns[i].init();
  }
}

void draw() {
  count++;
  background(0);
  
  screen.draw();
  
  for (int i=0; i<PATTERN_COUNT; i++) {
    patterns[i].draw();
    patterns[i].shift();
  }

  opc.push();
  opc.draw(screen.getPanels());
  
  int delay = 100;
  if (count % 49 == 0) {
   delay = 2000;
  }
  delay(delay);
}