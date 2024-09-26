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

(BEGIN)
	// Define o endereço do teclado para a entrada de valor do teclado.
	@24576
	D=A
	@keyboard
	M=D

(CHECK_KEYBOARD)
	// Define o endereço do primeiro pixel da tela.
	@16384
	D=A
	@current
	M=D

	// Se o teclado for pressionado, preenche a tela.
	@keyboard
	A=M
	D=M
	@fillvalue
	M=-1
	@DRAW
	D;JNE

	// Caso contrário, limpa a tela.
	@fillvalue
	M=0

(DRAW)
	// Preenche ou limpa o pixel atual, dependendo do valor de fillvalue.
	@fillvalue
	D=M
	@current
	A=M
	M=D

	// Se o pixel atual for o último pixel, não há mais nada para desenhar, então volta para a verificação do teclado.
	@current
	D=M
	@24575
	D=D-A
	@CHECK_KEYBOARD
	D;JGE

	// Incrementa o endereço do pixel atual.
	@current
	M=M+1

	// Continua desenhando o próximo pixel.
	@DRAW
	0;JMP
