module AND_Gate_3inputs_tb;
logic A, B, C;
wire Y;
AND_Gate_3inputs andgate (A, B, C, Y);
initial begin
 A=1;
 B=1;
 C=1;
 #100;
 A=1;
 B=0;
 C=1;
 #100;
 A=1;
 B=0;
 C=0;
 #100;
 A=1;
 B=1;
 C=0;
 #100 $stop;
 end
 initial 
 begin 
 $display("\t\t time, A  , B  ,  C , Y");
 $monitor (" %d    , %b    ,%b , %b ",$time, A,B,C,Y);
 end
 endmodule 