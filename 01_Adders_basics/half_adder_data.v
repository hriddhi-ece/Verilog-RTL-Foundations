`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 6:06:45 AM
// Design Name: 
// Module Name: half_adder_data
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


module half_adder_data(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign {carry,sum} = a + b;
    
endmodule
