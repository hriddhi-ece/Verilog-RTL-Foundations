// ============================================================================
// Module      : reg_4bit
// Description : Standard 4-bit data register triggered on negative edge.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module reg_4bit(
    input wire [3:0] D,
    input wire clk,
    output reg [3:0] Q
);

    always @(negedge clk) begin 
        Q <= D;
    end
    
endmodule