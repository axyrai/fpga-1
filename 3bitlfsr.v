module lfsr (
  out, enable,clk,reset
);
  
  output [2:0] out;
  input enable, clk, reset;
  reg [2:0] out;
  wire lin_fb;
  initial begin
    out=3'b100;
  end
  
  assign lin_fb=out[2]^out[0];
  always @ (posedge clk)
    if(reset) begin
      out<=3'b0;
    end 
  else if(enable) begin
    out<={lin_fb,out[2],out[1]};
  end
endmodule
