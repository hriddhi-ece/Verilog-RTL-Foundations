`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 12:06:55 AM
// Design Name: 
// Module Name: FA_using_HA
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


module FA_using_HA(
    input a,
    input b,
    input cin,
    output sum,
    output carry
    );
    
  wire s1,s2,s3;
  HA_gate d0 ( .a (a) , .b (b) , .sum (s1), .carry (s2));
  HA_gate d1 ( .a (s1) , .b (cin) , .sum(sum) , .carry(s3));
  
  assign carry = s2 | s3;
endmodule
