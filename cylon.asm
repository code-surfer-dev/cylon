	.LF /Users/ingoschmied/Documents/develop.nosync/assembly/cylon/cylon.lst
;---------------------------------------------------------------------------
;
;		CYLON
;
;---------------------------------------------------------------------------

	.CR	Z80				;It's a Z80 assembler now
	.TF /Users/ingoschmied/Documents/develop.nosync/assembly/cylon/cylon.bin, bin
	.OR $0000

A_DAT		.EQ $00		;PIO PORT A data
B_DAT		.EQ $01		;PIO PORT B data
A_CTL		.EQ $02		;PIO PORT A control
B_CTL   	.EQ $03		;PIO PORT B control

    LD A, $0F           ;Set PIO PORT A to output
    OUT (A_CTL), A

    LD B, $80           ;Set the highest bit to bit 7
RESET
    LD A, $01           ;Start at bit 0
    OUT (A_DAT), A
MOVE_LEFT
    SLA A
    OUT (A_DAT), A
    CP B
    JP NZ,MOVE_LEFT
MOVE_RIGHT
    SRL A
    JP Z,RESET
    OUT (A_DAT), A
    JP MOVE_RIGHT