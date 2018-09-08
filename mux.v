// definition of 2 to 1 mux

// a - input bit 1
// b - input bit 2
// s - select bit
// c - output bit

module MUX(input a, b, s,
	output c);
	
	wire t0, t1, t2;
	
	// c = (a & s) | (b & ~s)
	not( t0, s );
	and( t1, a, t0 );
	and( t2, b, s );
	or( c, t1 , t2 );

endmodule


