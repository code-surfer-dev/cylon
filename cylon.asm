	.LF cylon.lst
;---------------------------------------------------------------------------
;
;		CYLON
;
;---------------------------------------------------------------------------

	.CR	Z80				;It's a Z80 assembler now
	.TF cylon.bin, bin
	.OR $0000

PORT_A		.EQ $00		;8255 PORT A address - LED bargraph
PORT_B		.EQ $01		;8255 PORT B address - Not used
PORT_C		.EQ $02		;8255 PORT C address - Not used
PORT_CTL	.EQ $03		;8255 Control register address

    LD A, $80           ;Set all 8255 ports to outputs
    OUT (PORT_CTL), A

    LD B, $80           ;Set the highest bit to bit 7
RESET
    LD A, $01           ;Start at bit 0
    OUT (PORT_A), A
MOVE_LEFT
    SLA A
    OUT (PORT_A), A
    CP B
    JP NZ,MOVE_LEFT
MOVE_RIGHT
    SRL A
    JP Z,RESET
    OUT (PORT_A), A
    JP MOVE_RIGHT