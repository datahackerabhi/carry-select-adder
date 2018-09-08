// definition of 4 bit CLA

`include "basic_cell.v"
`include "cll.v"

// x - 4 bit input 1
// y - 4 bit input 2
// cin - carry input
// s - 4 bit output
// cout - carry out

module CLA( x, y, cin, cout, s );
	
	input [3:0] x, y;
	input cin;
	output [3:0] s;
	output cout;
	
	wire [3:0] p, g, c;

	// The basic cells b0 to b3 generate all the generate and propogate terms.
	// The carry lookahead logic generates the input carrys to each basic cell along with the output carry.
	// then the basic cells generate the sum bits. 

	Basic_Cell b0( .x(x[0]), .y(y[0]), .c(cin), .p(p[0]), .g(g[0]), .s(s[0]) );
	Basic_Cell b1( .x(x[1]), .y(y[1]), .c(c[0]), .p(p[1]), .g(g[1]), .s(s[1]) );
	Basic_Cell b2( .x(x[2]), .y(y[2]), .c(c[1]), .p(p[2]), .g(g[2]), .s(s[2]) );
	Basic_Cell b3( .x(x[3]), .y(y[3]), .c(c[2]), .p(p[3]), .g(g[3]), .s(s[3]) );
	
	CLL cll( .p(p), .g(g), .cin(cin), .c(c) );
	
	buf b( cout, c[3] );	
	
endmodule
