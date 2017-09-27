RippleOPC opc;
Pattern pattern;
Screen screen;

Pattern patterns[];
int patternCounter = -1;
int PATTERN_COUNT = 1;
int pauseCount = 1;

boolean timerTriggered, timerEnabled = true;

void settings() {
  size(Constants.MAIN_WIDTH, Constants.MAIN_HEIGHT);
  thread("stateFlipper");
}

void initPatterns() {
  PATTERN_COUNT = 6;

  patterns = new Pattern[PATTERN_COUNT];
  
  patterns[0] = new HorizontalLinePattern();
  patterns[1] = new VerticalLinePattern();
  patterns[2] = new CombinationLinePattern();
  
  patterns[3] = new HorizontalPlanePattern();
  patterns[4] = new VerticalPlanePattern();
  patterns[5] = new CombinationPlanePattern();
  
  //patterns[6] = new TextPattern();

  for (int i=0; i<PATTERN_COUNT; i++) {
    patterns[i].init();
  }
}

void setup() {
  // setup screen elements
  screen = new Screen();
  screen.init();
  
  // setup OPC connection and mapping
  opc = new RippleOPC();
  opc.init(screen.getPanels());
  
  // default pattern
  initPatterns();
}

private Pattern getNextPattern() {
  patternCounter++;
  if (patternCounter+1 > PATTERN_COUNT) {
    // create new patterns
    initPatterns();
    patternCounter= 0;
  }
  return patterns[patternCounter];
}

void draw() {
  if (timerTriggered) {
    // move to next pattern
    getNextPattern();
    // reset count
    pauseCount = 1;
    // reset trigger
    timerTriggered = false;
  }
  
  pauseCount++;
  background(0);
  
  screen.draw();
  
  patterns[patternCounter].draw();
  patterns[patternCounter].shift();

  opc.push();
  opc.draw(screen.getPanels());
  
  if (patterns[patternCounter].getDelay() == -1) {
    // don't use pattern delay
    int delay = 100;
    if (pauseCount == 50) {
       delay = 2000;
       pauseCount = 1;
    }
    delay(delay);
  } else {
    delay(patterns[patternCounter].getDelay());
  }
}

void stateFlipper() {
  while (timerEnabled) {
    timerTriggered = true;
    delay(Constants.TIMER_DELAY);
  }
}