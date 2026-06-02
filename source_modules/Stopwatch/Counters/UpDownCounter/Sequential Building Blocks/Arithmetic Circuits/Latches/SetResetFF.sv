`include "Gates/NAND_Gate_3inputs.sv"
module SetResetFF(input logic clock, Reset, Set, Data, output logic Q, Qbar);
	NAND_Gate_3inputs NAND1(Set, t4, t2, t1);
	NAND_Gate_3inputs NAND2(t1, clock, Reset, t2);
	NAND_Gate_3inputs NAND3(t2, clock, t4, t3);
	NAND_Gate_3inputs NAND4(t3, Data, Reset, t4);
	NAND_Gate_3inputs NAND5(Set, t2, Qbar, Q);
	NAND_Gate_3inputs NAND6(Q, t3, Reset, Qbar);
endmodule