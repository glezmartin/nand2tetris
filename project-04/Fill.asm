// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// Save pressed key
@KBD
D=M
//If any key is pressed then D > 0, jump to SET if this is the case
@SET
D; JGT
@RESET
0;JMP

(SET)
  @SCREEN
  D = A
  @0
  M = D // Save the value of the initial pixel in register 0
  @1
  M = -1 // Save the value to fill in the register 1
  @FILL
  0;JMP // Jump to FILL

(RESET)
  @SCREEN
  D = A
  @0
  M = D
  @1
  M = 0
  @FILL
  0;JMP

(FILL)
  @1
  D = M // Get the value

  @0 // Get the next address
  A = M // Go next address
  M = D // Fill it with the value

  @0
  M = M + 1 // Increment to fill next pixel

  @KBD
  D = M //Get the end address
  @0
  M - D;JEQ // Check if we finished, if so return to the start point
  @FILL // Else continue filling
  0;JMP
