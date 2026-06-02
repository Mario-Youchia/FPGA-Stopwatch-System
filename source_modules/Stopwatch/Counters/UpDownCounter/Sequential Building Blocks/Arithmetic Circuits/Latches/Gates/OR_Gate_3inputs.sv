module OR_Gate_3inputs(input logic A, input logic B, input logic C, output logic Y);
	assign Y = (A || B || C);
endmodule