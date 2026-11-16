// ============================================================================
// Module      : d_ff
// Description : D (Data) Flip-Flop.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module d_ff(
    input wire D,
    input wire clk,
    output reg Q
);
    
    always @(posedge clk) begin 
        Q <= D; // Corrected to non-blocking assignment
    end
    
endmodule