`timescale 1ns/1ns

module Counter5TB();
	reg clk, rst, CountUpOrDown, enable;
	wire[3:0]Q;
	wire clk2;
	
	initial
	begin
	clk=1'b1;
	rst = 1'b1;
	CountUpOrDown = 1'b0;
	enable = 1'b1;
	#30; rst = 1'b0;
	end
	
	Counter5 counter(clk, rst, CountUpOrDown, enable, Q, clk2);
	always
	#30 clk=~clk;
endmodule