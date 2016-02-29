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
    }

    // set a new movement direction
    void setDirection(Dir d) {
    }

    // Draw the Pac, as a circle
    void render() {
    }

    // If the given vector is off the screen, wrap it around to the other side
    // Modify the given vector.
    // If this were public, we probably woudn't modify the vector in place like this.
    private void wrapPosition(PVector vec) {
    }

    // reverse the movement direction
    private void reverseDirection() {
    }

    // Update the position, using the current speed & travel direction
    // If normal movement would hit a wall, find the position after bouncing off the wall.
    // The total distance travelled (before + after hitting the wall) should be the same.
    void updatePosition(Walls walls) {
    }

}
