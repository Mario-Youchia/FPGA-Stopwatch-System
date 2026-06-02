`timescale 1ns/1ns

module StopwatchTB();
	reg clk, rst, CountUpOrDown, enable;
	wire[3:0]Q1,Q2,Q3,Q4;
	
	initial
	begin
	clk=1'b1;
	rst = 1'b1;
	CountUpOrDown = 1'b0;
	enable = 1'b1;
	#30; rst = 1'b0;
	end
	
	Stopwatch stopwatch(clk,rst,CountUpOrDown,enable,Q1,Q2,Q3,Q4);
	always
	#30 clk=~clk;
endmodule