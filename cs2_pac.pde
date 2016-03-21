final int boardWidth = 30; // number of dots across
final int boardHeight = 30; // number of dots down
final int dotSpacing = 30; // pixels between dot centers
final int dotRadius = 3; // pixels
float pacSize = dotSpacing/1.5;
int wallVert = dotSpacing;
int wallHor = dotSpacing/10;
int score = 0;
boolean above = false;
boolean below = false;
boolean right = false;
boolean left = false;
boolean aboveG = false;
boolean belowG = false;
boolean rightG = false;
boolean leftG = false;
boolean killed = false;
int numGhosts = 1;

boolean hit = false;

Dots dots;
Pac pac;
Walls walls;
Ghosts ghosts;

// It's convenient to refer to two coordinate systems
// Pixel coordinates are the usual Processing coordinates
// Dot coordinates describe the screen as a grid of boxes.
// Each box has an integer x & y coordinate.  At the start of the game,
// there is a dot in the *center* of each box.

// dotToPixel gives the pixel coordinate in the *center* of the corresponding box
float dotToPixel(int x) {
  return (0.5 + x) * dotSpacing;
}

// pixelToDot finds the box in which the pixel is contained
int pixelToDot(float x) {
  if (x > boardWidth * dotSpacing) {
    println(x);
  }
  return floor(x / dotSpacing);
}

void setup() {
  size(900, 900);
  dots = new Dots();
  pac = new Pac();
  walls = new Walls();
  ghosts = new Ghosts();
  dots.count = 0;
  killed = false;
  numGhosts = 1;
}

void draw() {
  clear();
  dots.render();
  pac.render();
  walls.render();
  dots.printScore();
  pac.updatePosition();
  dots.remove(pac.position);
  ghosts.updatePositionG();
  ghosts.render();
//  newGhosts();  
}

void lose () {
  if (killed == true) {
    println(ghosts.position);
    println(pac.position);
    setup();
  }
}

void newGhosts () {
  if (dots.count > 50 && numGhosts <2) {
    ghosts = new Ghosts();
  }
  if (dots.count > 100 && numGhosts <3) {
    ghosts = new Ghosts();
  }
    if (dots.count > 150 && numGhosts <3) {
    ghosts = new Ghosts();
  }
}