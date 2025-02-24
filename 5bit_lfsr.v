`timescale 1ns / 1ns
module lfsr(q,clk,d,reset);
  input wire clk,d,reset;
  output reg q;
  wire en;
  wire clock;
  assign en=(d^q);
   assign clock=en&(clk);
  always@(negedge clock)
    if(reset)
      begin 
        q=1'b0;
      end
  else
    begin
      q<=d;
    end
endmodule

module c17(N1,N2,N3,N6,N7,N22,N23);

 input  N1,N2,N3,N6,N7;

 output  N22,N23;
  //wire n22,n23;

 wire N10,N11,N16,N19;

nand NAND2_1 (N10, N1, N3);
nand NAND2_2 (N11, N3, N6);
nand NAND2_3 (N16, N2, N11);
nand NAND2_4 (N19, N11, N7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);
 

endmodule
