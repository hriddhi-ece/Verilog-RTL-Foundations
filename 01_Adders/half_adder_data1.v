`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 7:06:55 PM
// Design Name: 
// Module Name: half_adder_data1
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


module half_adder_data1(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign sum = a ^ b;
	assign carry = a & b;
    
endmodule
