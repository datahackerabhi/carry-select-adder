`include "mux.v"

module mux_tb();

	reg a, b, s;
	wire c;

	MUX DUT(
		.a(a),
		.b(b),
		.s(s),
		.c(c)
	);

	initial begin
		$dumpfile("mux.vcd");
		$dumpvars(0,mux_tb);
	end

	initial begin
		a = 1'b0;
		b = 1'b1;
		s = 1'b0;
		#20
		a = 1'b0;
		b = 1'b1;
		s = 1'b1;
		#20
		a = 1'b1;
		b = 1'b0;
		s = 1'b0;
		#20
		a = 1'b1;
		b = 1'b0;
		s = 1'b1;
		#20
		$display(c);
	end

	initial begin 
		#100
		$finish;
	end
endmodule
