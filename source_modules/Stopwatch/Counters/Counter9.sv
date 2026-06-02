`include "UpDownCounter/UpDownCounter.sv"
`include "UpDownCounter/Sequential Building Blocks/RegisterWithLoad.sv"
`include "UpDownCounter/Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/AND_Gate_4inputs.sv"
`include "UpDownCounter/Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/OR_Gate_2inputs.sv"
`include "UpDownCounter/Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/NOT_Gate.sv"
`include "UpDownCounter/Sequential Building Blocks/Arithmetic Circuits/Latches/Gates/Buffer.sv"
module Counter9(clk, rst, CountUpOrDown, enable,Q, clk2);
	input logic clk, rst, CountUpOrDown, enable;
	output logic [3:0] Q;
	output logic clk2;
	logic rst_int;
	logic [3:0] set_int;
	initial
	begin	
		set_int = 4'b0000;
	end
	
	always @(*)
	begin
		if (Q - 1 < 4'b1001)
			clk2 = 1'b0;
		else
			clk2 = 1'b1;
	end
	
	UpDownCounter Counter (clk, t3, set_int, CountUpOrDown, Q);
	NOT_Gate NOT1 (Q[2],Qbar2);
	NOT_Gate NOT2 (Q[0],Qbar0);
	AND_Gate_4inputs AND1 (Q[3],Qbar2,Q[1],Qbar0,t2); // 1010 3:0
	OR_Gate_2inputs OR1 (rst,t2,t3);
	
	//AND_Gate_4inputs AND2 (Q[0],Q[1],Q[2],Q[3],t4); //1111
	
	//Buffer buff1(Q[0],set_int[0]);
	//NOT_Gate NOT3(Q[1],set_int[1]);
	//Buffer buff2(Q[2],set_int[2]);
	//NOT_Gate NOT4(Q[3],set_int[3]);
	
	
	//OR_Gate_2inputs OR2 (t3,t4,t5);
endmodule