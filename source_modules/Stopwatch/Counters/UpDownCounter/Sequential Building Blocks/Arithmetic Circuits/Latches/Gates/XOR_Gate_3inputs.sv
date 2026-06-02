module XOR_Gate_3inputs(input logic A, input logic B, input logic C, output logic Y);
	NOT_Gate NOT1 (A, Abar);
	NOT_Gate NOT2 (B, Bbar);
	AND_Gate_3inputs AND1 (Abar, Bbar, C, Y1);
	NOT_Gate NOT3 (C, Cbar);
	AND_Gate_3inputs AND2 (Abar, B, Cbar, Y2);
	AND_Gate_3inputs AND3 (A, Bbar, Cbar, Y3);
	AND_Gate_3inputs AND4 (A, B, C, Y4);
	OR_Gate_4inputs OR (Y1, Y2, Y3, Y4, Y);
endmodule