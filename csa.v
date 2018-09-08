// definition of 16-bit CSA using 7 4-bit CLAs.
// architecture used is described on page 336 of "Computer Systems Design and Architecture" by V.P. Heuring second edition
`include "mux_4bit.v"
`include "cla.v"

// x - 16 bit addendum
// y - 16 bit addendum
// s - output 16 bit sum
// cin - input carry
// cout - output carry

module CSA( x, y, cin, cout, s );

	input [15:0] x, y;
	input cin;
	output [15:0] s;
	output cout;
	
	wire c8a, c8b, c12a, c12b, c16a, c16b;
	wire couta, coutb;
	wire carry4, carry8;
	wire [3:0] sum4_7a, sum4_7b, sum8_11a, sum8_11b, sum12_15a, sum12_15b;
	wire [3:0] sout12_15a, sout12_15b;
	
	// First 4-bit CLA 
	CLA c1( .x(x[3:0]), .y(y[3:0]), .cin(cin), .cout(carry4), .s(s[3:0]) );
	
	// Set of two 4-bit CLA's which are multiplexed to give s[7:4].
	// sum4_7a, c8a is the sum/carryout with 0 carry input
	// sum4_7b, c8b is the sum/carryout with 1 carry input
	// m4_0 selects either sum4_7a or sum4_7b depending on the value of carry4(c4)
	// m0 selects either c8a or c8b depending on the value of carry4(c4) and stores it in carry8
	CLA c2( .x(x[7:4]), .y(y[7:4]), .cin(1'b0), .cout(c8a), .s(sum4_7a) );
	CLA c3( .x(x[7:4]), .y(y[7:4]), .cin(1'b1), .cout(c8b), .s(sum4_7b) );
	MUX_4bit m4_0( .a(sum4_7a), .b(sum4_7b), .s(carry4), .c(s[7:4]) );
	MUX m0( .a(c8a), .b(c8b), .s(carry4), .c(carry8) );
	
	// Set of two 4-bit CLA's which are multiplexed to give s[11:8].
	// sum8_11a, c12a is the sum/carryout with 0 carry input
	// sum8_11b, c12b is the sum/carryout with 1 carry input
	CLA c4( .x(x[11:8]), .y(y[11:8]), .cin(1'b0), .cout(c12a), .s(sum8_11a) );
	CLA c5( .x(x[11:8]), .y(y[11:8]), .cin(1'b1), .cout(c12b), .s(sum8_11b) );
	
	// Set of two 4-bit CLA's which are multiplexed to give s[15:12].
	// sum12_15a, c16a is the sum/carryout with 0 carry input
	// sum12_15b, c16b is the sum/carryout with 1 carry input
	CLA c6( .x(x[15:12]), .y(y[15:12]), .cin(1'b0), .cout(c16a), .s(sum12_15a) );
	CLA c7( .x(x[15:12]), .y(y[15:12]), .cin(1'b1), .cout(c16b), .s(sum12_15b) );
	
	// m4_1 selects either sum12_15a or sum12_15b depending on the value of c12a
	// m1 selects either c16a or c16b depending on the value of c12a 
	MUX_4bit m4_1( .a(sum12_15a), .b(sum12_15b), .s(c12a), .c(sout12_15a) );
	MUX m1( .a(c16a), .b(c16b) , .s(c12a), .c(couta) );
	
	// m4_2 selects either sum12_15a or sum12_15b depending on the value of c12b
	// m2 selects either c16a or c16b depending on the value of c12b
	MUX_4bit m4_2( .a(sum12_15a), .b(sum12_15b), .s(c12b), .c(sout12_15b) );
	MUX m2( .a(c16a), .b(c16b) , .s(c12b), .c(coutb) );
	
	// The below three mux can be thought of as a single 9-bit 2 to 1 mux.
	// sout12_15a and sout12_15b are the inputs to the 9-bit mux which are obtained based on the values of c12a and c12b respectively
	
	// m4_3 selects either sum8_11a or sum8_11b based on the value of carry8(c8)
	MUX_4bit m4_3( .a(sum8_11a), .b(sum8_11b), .s(carry8), .c(s[11:8]) );
	// m4_4 selects either sout12_15a or sout12_15b based on the value of carry8(c8)
	MUX_4bit m4_4( .a(sout12_15a), .b(sout12_15b), .s(carry8), .c(s[15:12]) );
	// m3 selects either couta or coutb based on the value of carry8(c8) and stores it in cout.
	MUX m3( .a(couta), .b(coutb), .s(carry8), .c(cout) );

endmodule


