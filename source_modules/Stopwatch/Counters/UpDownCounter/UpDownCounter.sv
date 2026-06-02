`include "Sequential Building Blocks/Arithmetic Circuits/Latches/SetResetFF.sv"
`include "Sequential Building Blocks/Arithmetic Circuits/Latches/D_FlipFlop.sv"
`include "Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/NOT_Gate.sv"
module UpDownCounter(clk, rst, set, CountUpOrDown, Q);
	input logic clk, rst, CountUpOrDown;
	input logic [3:0] set;
	output logic [3:0] Q;
	logic [3:0] setbar;
	logic [3:0] addout;
	NOT_Gate NOT1(set[0], setbar[0]);
	NOT_Gate NOT2(set[1], setbar[1]);
	NOT_Gate NOT3(set[2], setbar[2]);
	NOT_Gate NOT4(set[3], setbar[3]);
	NOT_Gate NOT5(rst, rstbar);
	always @(*)
	begin
		$display("addout= %b",addout);
	end
	//$display("addout=%b",$addout);
	
	SetResetFF SRFF1 (clk, rstbar, setbar[0], addout[0], Q[0],);
	
	SetResetFF SRFF2 (clk, rstbar, setbar[1], addout[1], Q[1],);
	
	SetResetFF SRFF3 (clk, rstbar, setbar[2], addout[2], Q[2],);
	
	SetResetFF SRFF4 (clk, rstbar, setbar[3], addout[3], Q[3],);
	FourFullAdder FA4bit (Q, 4'b0001, CountUpOrDown, addout);
	endmodule