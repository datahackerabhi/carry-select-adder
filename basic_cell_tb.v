`include "basic_cell.v"

module basic_cell_tb();

	reg x, y, c;
	wire s, p, g;
	
	Basic_Cell DUT(.x(x), .y(y), .c(c), .s(s), .p(p), .g(g) );
	
	initial begin
		$dumpfile("basic_cell.vcd");
		$dumpvars(0,basic_cell_tb);
	end
	
	initial begin
		x = 1'b0;
		y = 1'b0;
		c = 1'b0;
		#20
		x = 1'b1;
		y = 1'b0;
		c = 1'b0;
		#20
		x = 1'b1;
		y = 1'b0;
		c = 1'b1;
		#20
		x = 1'b1;
		y = 1'b1;
		c = 1'b1;
		#20
		$finish;
	end
	
endmodule
		
