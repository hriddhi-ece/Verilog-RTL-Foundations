`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 8:55:55 PM
// Design Name: 
// Module Name: 
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


module TB_ha_data();
 reg a,b;
 wire s,c;

HA_gate d0 (a, b, s, c);
initial begin
    #10 a = 0; b=0; 
    #10 a = 0; b=1;
    #10 a = 1; b=0;
    #10 a = 1; b=1;
    #10 $finish;
end    
endmodule
