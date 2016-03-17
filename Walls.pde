class Walls {
  // vertical walls.
  // This array is true for a given square if there is a wall to the right of that square
  private boolean[][] vertical;
  // horizontal - true if there is a wall below that square.
  private boolean[][] horizontal;

  // A new set of walls, for testing purposes
  // eventually, we'll want some particular levels
  Walls() {
    this.vertical = new boolean[boardHeight][boardWidth];
    this.horizontal = new boolean[boardHeight][boardWidth];
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardWidth; j++) {
        if (i == j) {
          vertical[i][j] = true;
          horizontal[i][j] = true;
        } else {
          vertical[i][j] = false;
          horizontal[i][j] = false;
        }
      }
    }
  }


  // Make a new Walls object from two arrays:
  // Horizontal & Vertical walls.
  // WISH check that dimensions are correct.
  Walls(boolean[][] h, boolean[][] v) {
    this.horizontal = h;
    this.vertical = v;
  }

  // If there is a wall between the two given positions, return the point of collision.
  // Otherwise, return some value that can never be a collision.
  // Input & Output are in pixel coordinates
  void collision(PVector fromPosition/*,PVector toPosition*/) {
    right = false;
    left = false;
    above = false;
    below = false;
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          if (((dotToPixel (i)) - fromPosition.x) < ((pacSize/2)+(wallHor/2))) {
            if (((dotToPixel (i)) - fromPosition.x) > (-((pacSize/2)+(wallHor/2))))
              if (((dotToPixel (j)+dotSpacing/2) - fromPosition.y) < ((pacSize/2)+(wallVert/2))) {
                if (((dotToPixel (j)+dotSpacing/2) - fromPosition.y) > (-((pacSize/2)+(wallVert/2)))) {
                  if (((dotToPixel (i)) - fromPosition.x) >= 0) {
                    pac.reverseDirection();
                    right = true;
                    hit = true;
                  } 
                  if (((dotToPixel (i)) - fromPosition.x) < 0) {
                    pac.reverseDirection();
                    left = true;
                    hit = true;
                  if (((dotToPixel (i)) - fromPosition.x) == 0) {
                    if (pac.travelDirection == Dir.NORTH) {
                      above = true;
                      hit = true;
                      pac.reverseDirection();
                    } else if (pac.travelDirection == Dir.SOUTH) {
                      below = true;
                      hit = true;
                      pac.reverseDirection();
                    }
                  } 
                  }
                }
              }
          }
        }
        if (horizontal [i] [j]) {
          if (((dotToPixel (i)+dotSpacing/2) - fromPosition.x) < ((pacSize/2)+(wallVert/2))) {
            if (((dotToPixel (i)+dotSpacing/2) - fromPosition.x) > (-((pacSize/2)+(wallVert/2))))
              if (((dotToPixel (j)) - fromPosition.y) < ((pacSize/2)+(wallHor/2))) {
                if (((dotToPixel (j)) - fromPosition.y) > (-((pacSize/2)+(wallHor/2)))) {
                  if (((dotToPixel (j)) - fromPosition.y) > 0) {
                    pac.reverseDirection();
                    below = true;
                    hit = true;
                  } 
                  if (((dotToPixel (j)) - fromPosition.y) == 0) {
                    if (pac.travelDirection == Dir.WEST) {
                      left = true;
                      hit = true;
                      pac.reverseDirection();
                    } else if (pac.travelDirection == Dir.EAST) {
                      right = true;
                      hit = true;
                      pac.reverseDirection();
                    }
                  } 
                  if (((dotToPixel (j)) - fromPosition.y) < 0) {
                    pac.reverseDirection();
                    above = true;
                    hit = true;
                  }
                }
              }
          }
        }
      }
    }
  }

//makes a wall for vertical oriented with vertically and shifter up dotspacing/2
//makes a wall for horizontal oriented horizontally it shifts it + dotspacing/2
  void render() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          fill(110, 232, 255);
          rect(dotToPixel(i), dotToPixel(j)+dotSpacing/2, wallHor, wallVert);
        }
        if (horizontal [i] [j]) {
          rectMode(CENTER);
          fill(110, 232, 255);
          rect(dotToPixel(i)+dotSpacing/2, dotToPixel(j), wallVert, wallHor);
        }
      }
    }
  }
}