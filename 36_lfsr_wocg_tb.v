`timescale 1ns/1ns
module dfftb;
  reg dt,clkt,resett;
  wire [35:0]qt;
  reg feedback;
  
   reg N1,N4,N8,N11,N14,N17,N21,N24,N27,N30,
      N34,N37,N40,N43,N47,N50,N53,N56,N60,N63,
      N66,N69,N73,N76,N79,N82,N86,N89,N92,N95,
      N99,N102,N105,N108,N112,N115;
  
   wire N223,N329,N370,N421,N430,N431,N432;
  
  lfsr DUT01(.q(qt[0]),.clk(clkt),.d(dt),.reset(resett));
  lfsr DUT02(.q(qt[1]),.clk(clkt),.d(qt[0]),.reset(resett));
  lfsr DUT03(.q(qt[2]),.clk(clkt),.d(qt[1]),.reset(resett));
  lfsr DUT04(.q(qt[3]),.clk(clkt),.d(qt[2]),.reset(resett));
  lfsr DUT05(.q(qt[4]),.clk(clkt),.d(qt[3]),.reset(resett));
  
  lfsr DUT06(.q(qt[5]),.clk(clkt),.d(qt[4]),.reset(resett));
  lfsr DUT07(.q(qt[6]),.clk(clkt),.d(qt[5]),.reset(resett));
  lfsr DUT08(.q(qt[7]),.clk(clkt),.d(qt[6]),.reset(resett));
  lfsr DUT09(.q(qt[8]),.clk(clkt),.d(qt[7]),.reset(resett));
  lfsr DUT10(.q(qt[9]),.clk(clkt),.d(qt[8]),.reset(resett));

  lfsr DUT11(.q(qt[10]),.clk(clkt),.d(qt[9]),.reset(resett));
  lfsr DUT12(.q(qt[11]),.clk(clkt),.d(qt[10]),.reset(resett));
  lfsr DUT13(.q(qt[12]),.clk(clkt),.d(qt[11]),.reset(resett));
  lfsr DUT14(.q(qt[13]),.clk(clkt),.d(qt[12]),.reset(resett));
  lfsr DUT15(.q(qt[14]),.clk(clkt),.d(qt[13]),.reset(resett));

  lfsr DUT16(.q(qt[15]),.clk(clkt),.d(qt[14]),.reset(resett));
  lfsr DUT17(.q(qt[16]),.clk(clkt),.d(qt[15]),.reset(resett));
  lfsr DUT18(.q(qt[17]),.clk(clkt),.d(qt[16]),.reset(resett));
  lfsr DUT19(.q(qt[18]),.clk(clkt),.d(qt[17]),.reset(resett));
  lfsr DUT20(.q(qt[19]),.clk(clkt),.d(qt[18]),.reset(resett));

  lfsr DUT21(.q(qt[20]),.clk(clkt),.d(qt[19]),.reset(resett));
  lfsr DUT22(.q(qt[21]),.clk(clkt),.d(qt[20]),.reset(resett));
  lfsr DUT23(.q(qt[22]),.clk(clkt),.d(qt[21]),.reset(resett));
  lfsr DUT24(.q(qt[23]),.clk(clkt),.d(qt[22]),.reset(resett));
  lfsr DUT25(.q(qt[24]),.clk(clkt),.d(qt[23]),.reset(resett));

  lfsr DUT26(.q(qt[25]),.clk(clkt),.d(qt[24]),.reset(resett));
  lfsr DUT27(.q(qt[26]),.clk(clkt),.d(qt[25]),.reset(resett));
  lfsr DUT28(.q(qt[27]),.clk(clkt),.d(qt[26]),.reset(resett));
  lfsr DUT29(.q(qt[28]),.clk(clkt),.d(qt[27]),.reset(resett));
  lfsr DUT30(.q(qt[29]),.clk(clkt),.d(qt[28]),.reset(resett));

  lfsr DUT31(.q(qt[30]),.clk(clkt),.d(qt[29]),.reset(resett));
  lfsr DUT32(.q(qt[31]),.clk(clkt),.d(qt[30]),.reset(resett));
  lfsr DUT33(.q(qt[32]),.clk(clkt),.d(qt[31]),.reset(resett));
  lfsr DUT34(.q(qt[33]),.clk(clkt),.d(qt[32]),.reset(resett));
  lfsr DUT35(.q(qt[34]),.clk(clkt),.d(qt[33]),.reset(resett));

  lfsr DUT36(.q(qt[35]),.clk(clkt),.d(qt[34]),.reset(resett));

  c432 CUT(.N1(qt[0]),.N4(qt[1]),.N8(qt[2]),.N11(qt[3]),.N14(qt[4]),.N17(qt[5]),.N21(qt[6]),.N24(qt[7]),.N27(qt[8]),.N30(qt[9]),
        .N34(qt[10]),.N37(qt[11]),.N40(qt[12]),.N43(qt[13]),.N47(qt[14]),.N50(qt[15]),.N53(qt[16]),.N56(qt[17]),.N60(qt[18]),.N63(qt[19]),
        .N66(qt[20]),.N69(qt[21]),.N73(qt[22]),.N76(qt[23]),.N79(qt[24]),.N82(qt[25]),.N86(qt[26]),.N89(qt[27]),.N92(qt[28]),.N95(qt[29]),
        .N99(qt[30]),.N102(qt[31]),.N105(qt[32]),.N108(qt[33]),.N112(qt[34]),.N115(qt[35]),
        .N223(N223),.N329(N329),.N370(N370),.N421(N421),.N430(N430),.N431(N431),.N432(N432));
  

   always @(posedge clkt) begin
     dt<=~(qt[24]^qt[35]);
     $display("dt=%0h time=%0t q=%0h",dt,$time,qt);
   end

  initial begin
    clkt=1'b0;
    dt=1'b0;
    resett=1'b1;
  end
  
  initial begin
  #10;
  resett=1'b0; 
  end
  
  always #5 clkt=~clkt;
 
  //always #150 resett=~resett;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #340 $finish();
  end
  
endmodule
