module NOR_Gate_2inputs(input logic A, input logic B, output logic Y);
	assign Y = !(A | B);
endmodule