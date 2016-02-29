# Pacman and Private Data

We will write a new version of the classic Pacman game, in Processing.
The classes we will use have several examples where private data is
helpful.

After each section below, your code should run, and have a new feature or two.

## Classes

I have provided scaffolds for 3 classes.  I expect these will be
enough, but you may add more if you wish.

    1. `Pac` - the player
    2. `Dots` - keeps track of the dots remaining on the board
    3. `Walls` - walls which prevent player movement
    
I have also provided an `enum` type to represent cardinal directions,
and a few useful functions in the main file.  Read through this code
before you begin writing.

## Rendering

    1. Fill in the `render` method in the `Pac` class.
    2. Fill in the constructor for the `Dots` class.
    3. Fill in the `render` method in the `Dots` class.
    4. Fill in the `render` method in the `Walls` class.  Remember
       walls are equidistant between 2 dots.
    
## Player Movement
    
    1. Write all the methods outlined in the `Pac` class, up to `updatePosition`
    2. Write a first draft of `updatePosition`.  For now, ignore the walls.
    2. Handle keypresses to change the player movement direction.
    
## Dots

    1. Write the `remove` method in the `Dots` class
    2. Show the current score, which is the number of dots which have
       been removed so far.
    
## Walls

    1. Implement the `collision` method in the Wall class.  It's
       structure is similar to the `remove` method above.
    2. Finish writing `updatePosition` for `Pac`.  Be careful around
       the edges of the screen.
    3. Move your Pac around the screen to test your code.  Test each
       possible branch of your code.
