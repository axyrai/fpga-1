`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:04:32 03/28/2023 
// Design Name: 
// Module Name:    dir 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dir(l,d,r,c,u,digit,seg);
	 
input l,d,r,c,u;
input [3:0] digit;

output [7:0] seg;
reg [7:0] seg;
 
assign digit=4'b1111;

always@(l,c,d,u,r)
begin

case({l,c,d,u,r})

5'b10000 : seg=8'b11100011;
5'b01000 : seg=8'b01100011;
5'b00100 : seg=8'b10000101;
5'b00010 : seg=8'b10000011;
5'b00001 : seg=8'b11110101;
default: seg=8'b00000000;

endcase

end 

endmodule
