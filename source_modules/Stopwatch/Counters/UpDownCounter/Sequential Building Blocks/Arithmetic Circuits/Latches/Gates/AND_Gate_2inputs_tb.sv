module AND_Gate_2inputs_tb;
logic A, B;
wire Y;
AND_Gate_2inputs and(A, B, Y);
initial begin
 A=0;
 B=0;
 #100;
 A=0;
 B=1;
 #100;
 A=1;
 B=0;
 #100;
 A=1;
 B=1;
 
 #100 $stop;
 end
 initial 
 begin 
 $display("\t\t time, A  , B  , Y");
 $monitor (" %d    , %b    ,%b  ",$time, A,B,Y);
 end
 endmodule 