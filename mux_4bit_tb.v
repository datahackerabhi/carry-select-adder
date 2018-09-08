`include "mux_4bit.v"

module mux_4bit_tb();
	
	reg [3:0]a;
	reg [3:0]b;
	reg s;
	wire [3:0]c;

	MUX_4bit DUT(
		.a(a),
		.b(b),
		.s(s),
		.c(c));
	
	initial begin
		$dumpfile("mux_4bit.vcd");
		$dumpvars(0,mux_4bit_tb);
	end

	initial begin
		a = 4'b1010;
		b = 4'b0101;
		s = 1'b0;
		#20
		a = 4'b1010;
		b = 4'b0101;
		s = 1'b1;
		#20
		a = 4'b1000;
		b = 4'b0010;
		s = 1'b0;
		#20
		a = 4'b1000;
		b = 4'b0010;
		s = 1'b1;
		#20
		$display(c);
	end

	initial begin 
		#100
		$finish;
	end
endmodule

