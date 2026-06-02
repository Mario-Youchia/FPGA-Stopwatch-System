`timescale 1ns/1ns

module BCDTB();
	reg [3:0]binary;
	wire[3:0]ones,tens;
	
	initial
	begin
	binary = 4'b0000;
	#10; binary = 4'b0101;
	#10; binary = 4'b1001;
	#10; binary = 4'b1010;
	#10; binary = 4'b1111;
	$stop;
	end
	
	BinBCD BCD(binary,ones,tens);
endmodule