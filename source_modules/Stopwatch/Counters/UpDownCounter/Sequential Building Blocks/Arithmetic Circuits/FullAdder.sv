`include "Latches/Gates/AND_Gate_2inputs.sv"
`include "Latches/Gates/OR_Gate_2inputs.sv"
`include "Latches/Gates/XOR_Gate_3inputs.sv"

module FullAdder (input logic A, B, Cin, output logic Cout, Sum);
	AND_Gate_2inputs AND1 (A, B, t1);
	OR_Gate_2inputs OR1 (A, B, t2);
	AND_Gate_2inputs AND2 (Cin, t2, t3);
	OR_Gate_2inputs OR2 (t1, t3, Cout);
	XOR_Gate_3inputs XOR (A, B, Cin, Sum);
endmodule