module TopStopwatch(clk, Q1, Q2, Q3, Q4, an, sseg);
	input logic clk;
	input logic [3:0] Q1, Q2, Q3, Q4;
	output logic[3:0] an;
	output logic[7:0] sseg;
	clkdiv ClkDivider(1'b0, clk, clkout);
	disp_hex_mux FourDigit7Seg (clkout, 1'b0, Q1, Q2, Q3, Q4, 4'b1011, an, sseg);
endmodule
	