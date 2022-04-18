module rom #(
        parameter   DATA_WIDTH = 16,
        parameter   ADDR_WIDTH = 8          // 2 * 1024 bytes of ROM
    )(
        input  wire                  clk,
        input  wire [ADDR_WIDTH-1:0] addr,  // here comes the program counter
        output  reg [DATA_WIDTH-1:0] data   // here goes the instruction
    );

    reg [DATA_WIDTH-1:0] value;

    always @* begin
        case (addr)
        		/*	 rjmp 	main 		*/
		0:		value = 16'b1100000000010111;
		/*	 reti 	 		*/
		1:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		2:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		3:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		4:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		5:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		6:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		7:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		8:		value = 16'b1001010100011000;
		/*	 rjmp 	tim0_compa_isr 		*/
		9:		value = 16'b1100000000000111;
		/*	 reti 	 		*/
		10:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		11:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		12:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		13:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		14:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		15:		value = 16'b1001010100011000;
		/*	 reti 	 		*/
		16:		value = 16'b1001010100011000;
		/*	 in 	r17, porta 		*/
		17:		value = 16'b1011000100010010;
		/*	 ldi 	r16, 0b00000001 		*/
		18:		value = 16'b1110000000000001;
		/*	 add 	r17, r16 		*/
		19:		value = 16'b0000111100010000;
		/*	 ldi 	r16, 0b00000001 		*/
		20:		value = 16'b1110000000000001;
		/*	 and 	r17, r16 		*/
		21:		value = 16'b0010001100010000;
		/*	 out 	porta, r17 		*/
		22:		value = 16'b1011100100010010;
		/*	 reti 	 		*/
		23:		value = 16'b1001010100011000;
		/*	 ldi 	r17, 0b00000001 		*/
		24:		value = 16'b1110000000010001;
		/*	 out 	ddra, r17 		*/
		25:		value = 16'b1011100100010001;
		/*	 ldi 	r17, 0b00000000 		*/
		26:		value = 16'b1110000000010000;
		/*	 out 	porta, r17 		*/
		27:		value = 16'b1011100100010010;
		/*	 ldi 	r17, 42 		*/
		28:		value = 16'b1110001000011010;
		/*	 out 	ocr0a, r17 		*/
		29:		value = 16'b1011101100010110;
		/*	 ldi 	r17, 0b11110010 		*/
		30:		value = 16'b1110111100010010;
		/*	 out 	tccr0a, r17 		*/
		31:		value = 16'b1011101100011001;
		/*	 ldi 	r17, 0b00000001 		*/
		32:		value = 16'b1110000000010001;
		/*	 out 	tccr0b, r17 		*/
		33:		value = 16'b1011101100011000;
		/*	 ldi 	r16, 0b00000010 		*/
		34:		value = 16'b1110000000000010;
		/*	 out 	timsk, r16 		*/
		35:		value = 16'b1011110100000110;
		/*	 ldi 	r16, 0b00000001 		*/
		36:		value = 16'b1110000000000010;
		/*	 out 	tifr, r16 		*/
		37:		value = 16'b1011110100000101;
		/*	 sei 	 		*/
		38:		value = 16'b1001010001111000;
		/*	 rjmp 	loop 		*/
		39:		value = 16'b1100111111111111;
		default:		value = 16'b0000000000000000;


        endcase
    end

    always @(negedge clk) begin
        data <= value;
    end

endmodule
