//Stopwatch
module Stopwatch(clk, rst, CountUpOrDown, enable, Q1, Q2, Q3, Q4,an, sseg);
	input logic clk, rst, CountUpOrDown, enable;
	output logic [3:0] Q1,Q2,Q3,Q4;
	output logic [3:0] an;
	output logic [7:0] sseg;
	
	//Counter5 Counter9 Counter5 Counter9	
	Counter9 counter1(clk, rst, CountUpOrDown, enable, Q1, clk2);
	Counter5 counter2(clk2, rst, CountUpOrDown, enable, Q2, clk3);
	Counter9 counter3(clk3, rst, CountUpOrDown, enable, Q3, clk4);
	Counter5 counter4(clk4, rst, CountUpOrDown, enable, Q4,);
	
	clkdiv ClkDivider(1'b0, clk, clkout);
	disp_hex_mux FourDigit7Seg (clkout, 1'b0, Q1, Q2, Q3, Q4, 4'b1011, an, sseg);
	
endmodule

//disp_hex_mux on 4-bit seven segment
module disp_hex_mux
(
input logic clk, reset,
input logic [3:0] hex3 , hex2 , hex1, hex0, // hex digits
input logic [3:0] dp_in , // 4 decimal points
output logic [3:0] an, // enable 1— out— of— 4 asserted low
output logic [7:0] sseg // led segments
) ;
// constant declaration
// refreshing rate around 800 Hz (50 MHz/2^16)
localparam N = 18; // real
//localparam N = 4; //simulation
// internal signal declaration
logic [N-1:0] q_reg;
wire [N-1:0] q_next;
logic [3:0] hex_in;
logic dp;
// N— bit counter
// register
always_ff @(posedge clk, posedge reset)
if (reset)
q_reg <= 0;
else
q_reg <= q_next ;
// next - state logic
assign q_next = q_reg + 1;
// 2 MSBs of counter to control 4— to— l multiplexing
// and to generate active— low enable signal
always_comb
case (q_reg[N-1:N-2])
2'b00:
begin
	an = 4'b0001; //e hex
	hex_in = hex0;
	dp = dp_in[0];
end
2'b01:
begin
	an = 4'b0010; //d hex
	hex_in = hex1;
	dp = dp_in[1];
end
2'b10:
begin
	an = 4'b0100; //b hex
	hex_in = hex2;
	dp = dp_in[2];
end
default :
begin
	an = 4'b1000; //7 hex
	hex_in = hex3;
	dp = dp_in[3];
end
endcase
// hex to seven —segment led display
always_comb
begin
case(hex_in)	 //   abcdefg
4'h0: sseg[6:0] = 7'b0000001;  				// 01 in hex
4'h1: sseg[6:0] = 7'b1001111;					// 4F in hex
4'h2: sseg[6:0] = 7'b0010010;					// 12 in hex
4'h3: sseg[6:0] = 7'b0000110;					// 06 in hex
4'h4: sseg[6:0] = 7'b1001100;					// 4C in hex
4'h5: sseg[6:0] = 7'b0100100;					// 24 in hex
4'h6: sseg[6:0] = 7'b0100000;					// 20 in hex
4'h7: sseg[6:0] = 7'b0001111;					// 0F in hex
4'h8: sseg[6:0] = 7'b0000000;					// 00 in hex
4'h9: sseg[6:0] = 7'b0000100;					// 04 in hex
4'ha: sseg[6:0] = 7'b0001000;					// 08 in hex
4'hb: sseg[6:0] = 7'b1100000;					// 60 in hex
4'hc: sseg[6:0] = 7'b0110001;					// 31 in hex
4'hd: sseg[6:0] = 7'b1000010;					// 42 in hex
4'he: sseg[6:0] = 7'b0010000;					// 30 in hex
default: sseg[6:0] = 7'b0111000; //4’hf character  38 in hex
endcase
sseg [7] = dp ;
end
endmodule


//clk divider
module clkdiv(reset, clock_in, clock_out);
input logic clock_in; // input clock on FPGA
input logic reset;
output logic clock_out; // output clock after dividing the input clock by divisor
logic [27:0] counter=28'd0;
parameter DIVISOR = 28'd50000000; //real
//parameter DIVISOR = 28'd50; //simulation
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in, posedge reset)
begin
		if (reset == 1'b1)
			counter = 28'd0;
		else begin
			counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1))
			counter <= 28'd0;
		clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
		end
end
endmodule



//Counter 5
module Counter5(clk, rst, CountUpOrDown, enable,Q, clk2);
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
		if (Q - 1 < 4'b0101)
			clk2 = 1'b0;
		else
			clk2 = 1'b1;
	end
	
	UpDownCounter Counter (clk, t3, set_int, CountUpOrDown, Q);
	NOT_Gate NOT1 (Q[0],Qbar0);
	NOT_Gate NOT2 (Q[3],Qbar3);
	AND_Gate_4inputs AND1 (Qbar0,Q[1],Q[2],Qbar3,t2);
	OR_Gate_2inputs OR1 (rst,t2,t3);
	
	//AND_Gate_4inputs AND2 (Q[0],Q[1],Q[2],Q[3],t4); //1111
	
	//Buffer buff1(Q[0],set_int[0]);
	//NOT_Gate NOT3(Q[1],set_int[1]);
	//Buffer buff2(Q[2],set_int[2]);
	//NOT_Gate NOT4(Q[3],set_int[3]);
	
	
	//OR_Gate_2inputs OR2 (t3,t4,t5);
endmodule 


//Counter 9
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


//Up Down Counter
module UpDownCounter(clk, rst, set, CountUpOrDown, Q);
	input logic clk, rst, CountUpOrDown;
	input logic [3:0] set;
	output logic [3:0] Q;
	logic [3:0] setbar;
	logic [3:0] addout;
	NOT_Gate NOT1(set[0], setbar[0]);
	NOT_Gate NOT2(set[1], setbar[1]);
	NOT_Gate NOT3(set[2], setbar[2]);
	NOT_Gate NOT4(set[3], setbar[3]);
	NOT_Gate NOT5(rst, rstbar);
	always @(*)
	begin
		$display("addout= %b",addout);
	end
	//$display("addout=%b",$addout);
	
	SetResetFF SRFF1 (clk, rstbar, setbar[0], addout[0], Q[0],);
	
	SetResetFF SRFF2 (clk, rstbar, setbar[1], addout[1], Q[1],);
	
	SetResetFF SRFF3 (clk, rstbar, setbar[2], addout[2], Q[2],);
	
	SetResetFF SRFF4 (clk, rstbar, setbar[3], addout[3], Q[3],);
	FourFullAdder FA4bit (Q, 4'b0001, CountUpOrDown, addout);
endmodule 


//FourFullAdder
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

//Register With Load
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


//Full Adder
module FullAdder (input logic A, B, Cin, output logic Cout, Sum);
	AND_Gate_2inputs AND1 (A, B, t1);
	OR_Gate_2inputs OR1 (A, B, t2);
	AND_Gate_2inputs AND2 (Cin, t2, t3);
	OR_Gate_2inputs OR2 (t1, t3, Cout);
	XOR_Gate_3inputs XOR (A, B, Cin, Sum);
endmodule


//D_FlipFlop
module D_FlipFlop(input logic clk, D, output logic Q);
	NOT_Gate NOT (clk, clkbar);
	D_Latch D1 (clkbar, D, Q1);
	D_Latch D2 (clk, Q1, Q);
endmodule


//D_Latch
module D_Latch(input logic clk, D, output logic Q, Qbar);
	NOT_Gate NOT (D, Dbar);
	AND_Gate_2inputs AND1 (clk, D, S);
	AND_Gate_2inputs AND2 (clk, Dbar, R);
	SR_Latch SR (R, S, Q, Qbar);
endmodule


//Resetable_D_FlipFlop
module Resetable_D_FlipFlop(input logic clk, rst, D, output logic Q);
	NOT_Gate NOT (rst, rstbar);
	AND_Gate_2inputs AND (D, rstbar, Y);
	D_FlipFlop DFF (clk, Y, Q);
endmodule


//Set Reset FF
module SetResetFF(input logic clock, Reset, Set, Data, output logic Q, Qbar);
	NAND_Gate_3inputs NAND1(Set, t4, t2, t1);
	NAND_Gate_3inputs NAND2(t1, clock, Reset, t2);
	NAND_Gate_3inputs NAND3(t2, clock, t4, t3);
	NAND_Gate_3inputs NAND4(t3, Data, Reset, t4);
	NAND_Gate_3inputs NAND5(Set, t2, Qbar, Q);
	NAND_Gate_3inputs NAND6(Q, t3, Reset, Qbar);
endmodule


//SR_Latch
module SR_Latch(input logic R, S, output logic Q, Qbar);
	NOR_Gate_2inputs N1 (R, Qbar, Q);
	NOR_Gate_2inputs N2 (Q, S, Qbar);
endmodule


//AND_Gate_2inputs
module AND_Gate_2inputs(input logic A, input logic B, output logic Y);
	assign Y = A && B;
endmodule


//AND_Gate_3inputs
module AND_Gate_3inputs(input logic A, input logic B, input logic C, output logic Y);
	assign Y = A && B && C;
endmodule


//AND_Gate_4inputs
module AND_Gate_4inputs(input logic A, B, C, D, output logic Y);
	assign Y = A && B && C && D;
endmodule


//Buffer
module Buffer(input logic A, output logic Y);
	assign Y = A;
endmodule


//NAND_Gate_3inputs
module NAND_Gate_3inputs(input logic A, input logic B, input logic C, output logic Y);
	assign Y = !(A && B && C);
endmodule


//NOR_Gate_2inputs
module NOR_Gate_2inputs(input logic A, input logic B, output logic Y);
	assign Y = !(A | B);
endmodule


//NOT_Gate
module NOT_Gate(input logic A, output logic Y);
	assign Y = !A;
endmodule


//OR_Gate_2inputs
module OR_Gate_2inputs(input logic A, input logic B, output logic Y);
	assign Y = (A || B);
endmodule


//OR_Gate_3inputs
module OR_Gate_3inputs(input logic A, input logic B, input logic C, output logic Y);
	assign Y = (A || B || C);
endmodule


//OR_Gate_4inputs
module OR_Gate_4inputs(input logic A, input logic B, input logic C, input logic D, output logic Y);
	assign Y = (A || B || C || D);
endmodule


//XOR_Gate_2inputs
module XOR_Gate_2inputs(input logic A, input logic B, output logic Y);
	NOT_Gate NOT1 (A,Abar);
	AND_Gate_2inputs AND1 (Abar, B, Y1);
	NOT_Gate NOT2 (B,Bbar);
	AND_Gate_2inputs AND2 (A, Bbar, Y2);
	OR_Gate_2inputs OR (Y1, Y2, Y);
endmodule


//XOR_Gate_3inputs
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