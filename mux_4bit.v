// definition of 4-bit 2 to 1 mux
`include "mux.v"

// a - 4 bit input 1
// b - 4 bit input 2
// s - 1 bit select
// c - 4 bit output

module MUX_4bit(a, b, s, c);

	input [3:0] a;
	input [3:0] b;
	input s;
	output [3:0] c;

	MUX m0( .a(a[0]), .b(b[0]), .s(s), .c(c[0]) );
	MUX m1( .a(a[1]), .b(b[1]), .s(s), .c(c[1]) );
	MUX m2( .a(a[2]), .b(b[2]), .s(s), .c(c[2]) );
	MUX m3( .a(a[3]), .b(b[3]), .s(s), .c(c[3]) );

endmodule



