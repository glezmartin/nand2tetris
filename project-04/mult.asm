// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Set RAM[2] = 0
@R2
M = 0

// Check if R1 > 0
(CHECK)
  @R1
  D = M
  @END
  D;JLE // If it is not greater than 0 jump to the end

@R0
D = M
@R2
M = D+M // R2 = R0 + R0 + ... + R0 (R1 times)
@R1
M = M-1 // Reduce R1
@CHECK
0;JMP // Jump to check step

(END)
    @END
    0;JMP
