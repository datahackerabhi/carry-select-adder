//definition of carry lookahead logic

// p - 4 bit propogate terms from basic cells
// g - 4 bit generate terms from basic cells
// cin - carry input to the CLA
// c - 4 bit output which contains all carrys

module CLL( p, g, cin, c );

	input [3:0] p, g;
	input cin;
	output [3:0] c;
	
	wire t0, t1, t2, t3, t4, t5, t6, t7, t8, t9;
	
	// c1 = g0 + p0c0
	// c2 = g1 + p1g0 + p1p0c0
	// c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
	// c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0
	
	and a0(	t0, p[0], cin );
	and a1( t1, p[1], t0 );
	and a2( t2, p[2], t1 );
	and a3( t3, p[3], t2 );
	and a4( t4, g[0], p[1] );
	and a5( t5, p[2], t4 );
	and a6( t6, p[3], t5 );
	and a7( t7, g[1], p[2] );
	and a8( t8, p[3], t7 );
	and a9( t9, p[3], g[2] );
	
	// c[0] <- c1
	// c[1] <- c2
	// c[2] <- c3
	// c[3] <- c4
	
	or( c[0], g[0], t0 );
	or( c[1], g[1], t1, t4 );
	or( c[2], g[2], t2, t5, t7 );
	or( c[3], g[3], t3, t6, t8, t9 );
	
	
endmodule
