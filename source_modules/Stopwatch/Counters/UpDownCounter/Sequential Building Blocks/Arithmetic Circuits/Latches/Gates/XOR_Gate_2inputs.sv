module XOR_Gate_2inputs(input logic A, input logic B, output logic Y);
	NOT_Gate NOT1 (A,Abar);
	AND_Gate_2inputs AND1 (Abar, B, Y1);
	NOT_Gate NOT2 (B,Bbar);
	AND_Gate_2inputs AND2 (A, Bbar, Y2);
	OR_Gate_2inputs OR (Y1, Y2, Y);
endmodule