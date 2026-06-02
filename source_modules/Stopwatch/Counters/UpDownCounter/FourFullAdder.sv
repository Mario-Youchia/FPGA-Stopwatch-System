`include "Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/XOR_Gate_2inputs.sv"
`include "Sequential Building Blocks/Arithmetic Circuits/FullAdder.sv"
module FourFullAdder(A, B, CountUpOrDown, Sum);
	input logic [3:0] A, B;
	input logic CountUpOrDown;
	output logic [3:0] Sum;
	logic [3:0] B_var;
	XOR_Gate_2inputs XOR1 (B[0], CountUpOrDown, B_var[0]);
	FullAdder adder1 (A[0], B_var[0], CountUpOrDown, Cout1, Sum[0]);
	XOR_Gate_2inputs XOR2 (B[1], CountUpOrDown, B_var[1]);
	FullAdder adder2 (A[1], B_var[1], Cout1, Cout2, Sum[1]);
	XOR_Gate_2inputs XOR3 (B[2], CountUpOrDown, B_var[2]);
	FullAdder adder3 (A[2], B_var[2], Cout2, Cout3, Sum[2]);
	XOR_Gate_2inputs XOR4 (B[3], CountUpOrDown, B_var[3]);
	FullAdder adder4 (A[3], B_var[3], Cout3, Cout4, Sum[3]);
endmodule