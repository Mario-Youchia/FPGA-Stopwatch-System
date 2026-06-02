`include "Gates/AND_Gate_2inputs.sv"
`include "Gates/NOT_Gate.sv"
module Resetable_D_FlipFlop(input logic clk, rst, D, output logic Q);
	NOT_Gate NOT (rst, rstbar);
	AND_Gate_2inputs AND (D, rstbar, Y);
	D_FlipFlop DFF (clk, Y, Q);
endmodule