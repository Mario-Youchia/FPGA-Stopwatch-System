`include "Gates/NOR_Gate_2inputs.sv"
module SR_Latch(input logic R, S, output logic Q, Qbar);
	NOR_Gate_2inputs N1 (R, Qbar, Q);
	NOR_Gate_2inputs N2 (Q, S, Qbar);
endmodule