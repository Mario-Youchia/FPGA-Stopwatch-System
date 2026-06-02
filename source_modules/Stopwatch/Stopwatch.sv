`include "Counters/Counter5.sv"
`include "Counters/Counter9.sv"
module Stopwatch(clk, rst, CountUpOrDown, enable, Q1, Q2, Q3, Q4);
	input logic clk, rst, CountUpOrDown, enable;
	output logic [3:0] Q1,Q2,Q3,Q4;
	
	//Counter5 Counter9 Counter5 Counter9	
	Counter9 counter1(clk, rst, CountUpOrDown, enable, Q1, clk2);
	Counter5 counter2(clk2, rst, CountUpOrDown, enable, Q2, clk3);
	Counter9 counter3(clk3, rst, CountUpOrDown, enable, Q3, clk4);
	Counter5 counter4(clk4, rst, CountUpOrDown, enable, Q4,);
	
	TopStopwatch top_Stopwatch(clk, Q1, Q2, Q3, Q4, an, sseg);
	
endmodule