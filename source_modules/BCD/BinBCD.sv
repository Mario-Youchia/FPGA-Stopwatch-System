module BinBCD(	input  	logic[3:0] binary, 
				output 	logic[3:0] ones, 
				output  logic[3:0] tens);
always_comb
	begin
		if (binary <= 4'b1001) 
			begin
				ones = binary;
				tens = 4'b0000;
			end
		else 
			begin
				ones = binary - 4'b1010;
				tens = 4'b0001;
			end
	end
endmodule
