`include "csa.v"

module csa_tb();
	
	reg [15:0] x, y;
	reg cin;
	
	wire cout;
	wire [15:0] s;
	
	CSA DUT( .x(x), .y(y), .cin(cin), .cout(cout), .s(s) );

	initial begin
		$dumpfile("csa.vcd");  // file into which the output waveforms will be written.
		$dumpvars(0,csa_tb);
	end

	initial begin
		
		x = 16'h1023;
		y = 16'h0367;
		cin = 1'b0;
		#20
		x = 16'h0301;
		y = 16'h0023;
		cin = 1'b0;
		#20
		x = 16'h0011;
		y = 16'h0011;
		cin = 1'b1;
		#20
		x = 16'hE123;
		y = 16'hE145;
		cin = 1'b1;
		#20
		$finish;
	end
endmodule
