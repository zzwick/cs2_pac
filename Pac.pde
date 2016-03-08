class Pac {
  private PVector position;
  final float speed = 0.1 * dotSpacing;
  private Dir travelDirection = Dir.EAST;

  // for testing purposes, don't start in the corner
  Pac() {
    position = new PVector(dotToPixel(5), dotToPixel(0));
  }

  // return a copy of the current position
  PVector getPosition() {
    return position.copy();
  }

  // set a new movement direction
  void setDirection(Dir d) {
    travelDirection = d;
  }

  // Draw the Pac, as a circle
  void render() {
    ellipseMode(CENTER);
    fill(0, 200, 0);
    ellipse(position.x, position.y, dotSpacing/2, dotSpacing/2);
  }

  // If the given vector is off the screen, wrap it around to the other side
  // Modify the given vector.
  // If this were public, we probably woudn't modify the vector in place like this.
  private void wrapPosition(PVector vec) {
    if (vec.x > 900) {
      vec = new PVector (0, vec.y);
    } else if (vec.x < 0) {
      vec = new PVector (900, vec.y);
    } else if (vec.y > 900) {
      vec = new PVector (vec.x, 0);
    } else if (vec.y < 0) {
      vec = new PVector (vec.x, 900);
    }
  }


  // reverse the movement direction
  private void reverseDirection() {
    switch(travelDirection) {
    case Dir.NORTH:
      travelDirection = setDirection(Dir.SOUTH);
      break;
    case Dir.SOUTH:
      travelDirection = setDirection(Dir.NORTH);
      break;
    case Dir.WEST:
      travelDirection = setDirection(Dir.EAST);
      break;
    case Dir.EAST:
      travelDirection = setDirection(Dir.WEST);
      break;
    }
  }


  // Update the position, using the current speed & travel direction
  // If normal movement would hit a wall, find the position after bouncing off the wall.
  // The total distance travelled (before + after hitting the wall) should be the same.
  void updatePosition(Walls walls) {
    if (keyPressed == true) {
      switch (keyCode) {
      case UP:
        travelDirection = Dir.NORTH;
        break;
      case DOWN:
        travelDirection = Dir.SOUTH;
        break;
      case RIGHT:
        travelDirection = Dir.EAST;
        break;
      case LEFT:
        travelDirection = Dir.WEST;
        break;
      }
    }
  }
}