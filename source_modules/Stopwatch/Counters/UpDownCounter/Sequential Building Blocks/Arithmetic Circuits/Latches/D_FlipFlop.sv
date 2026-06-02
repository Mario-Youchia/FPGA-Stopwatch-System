`include "Gates/NOT_Gate.sv"
module D_FlipFlop(input logic clk, D, output logic Q);
	NOT_Gate NOT (clk, clkbar);
	D_Latch D1 (clkbar, D, Q1);
	D_Latch D2 (clk, Q1, Q);
endmodule