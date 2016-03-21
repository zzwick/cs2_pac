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
    ellipse(position.x, position.y, pacSize, pacSize);
  }

  // If the given vector is off the screen, wrap it around to the other side
  // Modify the given vector.
  // If this were public, we probably woudn't modify the vector in place like this.
  private void wrapPosition(PVector vec) {
    if (vec.x > 900) {
      vec.x = 0;
    } else if (vec.x < 0) {
      vec.x = 900;
    } else if (vec.y > 900) {
      vec.y = 0;
    } else if (vec.y < 0) {
      vec.y = 900;
    }
  }


  // reverse the movement direction
  private void reverseDirection() {
    if (travelDirection == Dir.NORTH) {
      setDirection(Dir.SOUTH);
    } else if (travelDirection == Dir.SOUTH) {
      setDirection(Dir.NORTH);
    } else if (travelDirection == Dir.WEST) {
      setDirection(Dir.EAST);
    } else if (travelDirection == Dir.EAST) {
      setDirection(Dir.WEST);
    }
  }


  // Update the position, using the current speed & travel direction
  // If normal movement would hit a wall, find the position after bouncing off the wall.
  // The total distance travelled (before + after hitting the wall) should be the same.
  void updatePosition() {
    if (keyPressed == true) {
      if (keyCode == UP) {
        if (above == false) {
          travelDirection = Dir.NORTH;
        }
      } else if (keyCode == DOWN) {
        if (below == false) {
          travelDirection = Dir.SOUTH;
        }
      } else if (keyCode == RIGHT) {
        if (right == false) {
          travelDirection = Dir.EAST;
        }
      } else if (keyCode == LEFT) {
        if (left == false) {
          travelDirection = Dir.WEST;
        }
      }
    }
    if (travelDirection == Dir.NORTH) {
      position = new PVector (position.x, position.y - speed);
    } else if (travelDirection == Dir.SOUTH) {
      position = new PVector (position.x, position.y + speed);
    } else if (travelDirection == Dir.EAST) {
      position = new PVector (position.x + speed, position.y);
    } else if (travelDirection == Dir.WEST) {
      position = new PVector (position.x - speed, position.y);
    }
    wrapPosition(position);
    walls.collision(position);
    moveIfCollide();
  }
  void moveIfCollide () {
    if (right) {
      //    position = (position.x - wallHor, position.y);
      position.x = position.x - wallHor;
    }
    else if (left) {
      //    position = (position.x + wallHor, position.y);
      position.x = position.x + wallHor;
    }
    if (above) {
      //    position = (position.x , position.y + wallHor);
      position.y = position.y + wallHor;
    }
    else if (below) {
      //    position = (position.x , position.y - wallHor);
      position.y = position.y - wallHor;
    }
  }
}