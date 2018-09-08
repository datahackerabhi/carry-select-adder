// definition of basic cell used in carry lookahead adder

// x - input bit
// y - input bit
// c - carry in 
// s - sum bit
// p - propogater
// g - generator

module Basic_Cell( x, y, c, p, g, s );

	input x, y, c;
	output p, g, s;
	
	wire t;
	
	// generate = x and y
	// propogate = x xor y
	// sum = x xor y xor cin
	and a0( g, x, y );
	xor x0( t, x, y );
	xor x1( s, t, c );
	buf b0( p, t );	
	
endmodule
