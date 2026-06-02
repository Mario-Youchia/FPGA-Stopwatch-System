`include "Arithmetic Circuits/Latches/Gates/AND_Gate_2inputs.sv"
`include "Arithmetic Circuits/Latches/Gates/NOT_Gate.sv"
`include "Arithmetic Circuits/Latches/Gates/OR_Gate_2inputs.sv"
`include "Arithmetic Circuits/Latches/Resetable_D_FlipFlop.sv"
//module RegisterWithLoad(input logic clk, rst, D, output logic Q);
module RegisterWithLoad(input logic clk, load, rst, input logic [3:0] I, output logic [3:0] A);
	NOT_Gate NOT1(load,loadbar);
	NOT_Gate NOT2(loadbar,loadbarbar);
	AND_Gate_2inputs AND1(A[0],loadbar,t1);
	AND_Gate_2inputs AND2(I[0],loadbarbar,t2);
	OR_Gate_2inputs OR1(t1,t2,d1);
	Resetable_D_FlipFlop RDFF1 (clk, rst, d1, A[0]);
	AND_Gate_2inputs AND3(A[1],loadbar,t3);
	AND_Gate_2inputs AND4(I[1],loadbarbar,t4);
	OR_Gate_2inputs OR2(t3,t4,d2);
	Resetable_D_FlipFlop RDFF2 (clk, rst, d2, A[1]);
	AND_Gate_2inputs AND5(A[2],loadbar,t5);
	AND_Gate_2inputs AND6(I[2],loadbarbar,t6);
	OR_Gate_2inputs OR3(t5,t6,d3);
	Resetable_D_FlipFlop RDFF3 (clk, rst, d3, A[2]);
	AND_Gate_2inputs AND7(A[3],loadbar,t7);
	AND_Gate_2inputs AND8(I[3],loadbarbar,t8);
	OR_Gate_2inputs OR4(t7,t8,d4);
	Resetable_D_FlipFlop RDFF4 (clk, rst, d4, A[3]);
endmodule