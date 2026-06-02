`include "Gates/NOT_Gate.sv"
`include "Gates/AND_Gate_2inputs.sv"
module D_Latch(input logic clk, D, output logic Q, Qbar);
	NOT_Gate NOT (D, Dbar);
	AND_Gate_2inputs AND1 (clk, D, S);
	AND_Gate_2inputs AND2 (clk, Dbar, R);
	SR_Latch SR (R, S, Q, Qbar);
endmodule