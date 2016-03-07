class Dots {
   private boolean[][] dots;
   private int count;

   // Create an initial board with every dot present
   Dots() {
     dots = new boolean [boardHeight] [boardWidth];
     for (int i = 0; i <= boardHeight; i++) {
       for (int j = 0; j <= boardWidth; j++) {
         dots[i] [j] = true;
       }
     }
   }

   // remove any dots between the two positions
   // return the number of dots removed
  // Normally the input vectors will either be in the same row
   // or the same column.  It's fine to only handle these cases.
   // Write a comment explaining what your version does
   // if the inputs are not in the same row or column.
   int remove(PVector fromPosition, PVector toPosition) {
   }

      // return the number of dots remaining
   boolean remaining() {
       return count;
   }

   // Draw the dots.  Use `dotToPixel`
   void render() {
     for (int i = 0; i <= boardHeight; i++) {
       for (int j = 0; j <= boardWidth; j++) {
         if (dots [i] [j]) {
           ellipseMode(CENTER);
           ellipse(dotToPixel(i),dotToPixel(j),dotRadius, dotRadius);
         }
       }
     }
   }

}