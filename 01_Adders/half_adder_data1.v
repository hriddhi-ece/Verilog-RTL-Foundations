`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2021 14:49:20
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


module half_adder_data1(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign sum = a ^ b;
	assign carry = a & b;
    
endmodule
