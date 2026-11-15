`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2026 01:10:40 PM
// Design Name: 
// Module Name: HA_case1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module HA_case1 (input wire A, B,
        output reg S, Cout);

 always @(A or B)
  begin 
  case ({A,B}) 
     2'b00: begin S = 0; Cout = 0; end 
     2'b01: begin S = 1; Cout = 0; end 
     2'b10: begin S = 1; Cout = 0; end 
     2'b11: begin S = 0; Cout = 1; end  
   endcase 
  end
endmodule
