// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

(BEGIN)
    // R2 = 0 e i = R1.
    @R2
    M=0  // R2 = 0, acumulador.
    @R1
    D=M  // D = R1
    @i
    M=D  // i = D, iterador.

(LOOP)
    // while True:
    //     if i == 0:
    //           break
    //     R2 += R0
    //     i -= 1
    @i
    D=M  // D = i
    @END
    D;JEQ  // if i == 0 then goto END
    @R0
    D=M  // D = R0
    @R2
    M=D+M  // R2 += D, acumula em R2 o valor de R0 n vezes.
    @i
    M=M-1  // i--, i -= 1.
    @LOOP
    0;JMP  // Goto LOOP

(END)
    @END
    0;JMP  // Goto END (loop infinito)
