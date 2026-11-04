`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 09:22:54 PM
// Design Name: 
// Module Name: FA_data
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


module FA_data(
    input a,
    input b,
    input c,
    output s,
    output cout
    );
    assign s = a ^ b ^ c;
    assign cout = (a&b)|(a&c)|(b&c);
endmodule
