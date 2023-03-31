`timescale 1ns/1ns
module dfftb;
  reg dt,clkt,resett;
  wire [4:0]qt;
  reg feedback;
  
   reg N1,N2,N3,N6,N7;
   wire N22,N23;
  //wire [1:0] out;
  
  lfsr DUT(.q(qt[0]),.clk(clkt),.d(dt),.reset(resett));
  lfsr DUT2(.q(qt[1]),.clk(clkt),.d(qt[0]),.reset(resett));
  lfsr DUT3(.q(qt[2]),.clk(clkt),.d(qt[1]),.reset(resett));
  lfsr DUT4(.q(qt[3]),.clk(clkt),.d(qt[2]),.reset(resett));
  lfsr DUT5(.q(qt[4]),.clk(clkt),.d(qt[3]),.reset(resett));
  
  c17 CUT1(.N1(qt[0]),.N2(qt[1]),.N3(qt[2]),.N6(qt[3]),.N7(qt[4]),.N22(N22),.N23(N23));
  //c17 CUT(qt[0],qt[1],qt[2],qt[3],qt[4],N22,N23); 
  
   always @(posedge clkt) begin
     dt<=~(qt[4]^qt[2]);
     $display("dt=%0h time=%0t",dt,$time);
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
