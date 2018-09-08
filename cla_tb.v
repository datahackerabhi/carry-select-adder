`include "cla.v"

module cla_tb();
	
	reg [3:0] x,y;
	reg cin;
	wire [3:0] sum;
	wire cout;
	
	CLA DUT( .x(x), .y(y), .s(sum), .cin(cin), .cout(cout) );
	
	initial begin
		$dumpfile("cla.vcd");
		$dumpvars(0,cla_tb);
	end 	
	
	initial begin
		
		x = 4'b0000;
		y = 4'b0000;
		cin = 1'b0;
		#20
		x = 4'b0001;
		y = 4'b0000;
		cin = 1'b0;
		#20
		x = 4'b0010;
		y = 4'b0010;
		cin = 1'b1;
		#20
		x = 4'b1000;
		y = 4'b1000;
		cin = 1'b1;
		#20
		$finish;
	end
endmodule
