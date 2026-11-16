// ============================================================================
// Module      : reg_4bit_clear
// Description : 4-bit Register with synchronous clear and load control.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module reg_4bit_clear(
    input wire [3:0] D,
    input wire clk,
    input wire load,
    input wire clear,
    output reg [3:0] Q
);
    
    // Fixed: Removed illegal 'assign' statements from inside the procedural block
    always @(posedge clk) begin 
        if (clear == 1'b1) begin
            Q <= 4'b0000;
        end
        else if (load == 1'b1) begin
            Q <= D; 
        end
        // Implicit else: Q <= Q (holds state when clear=0 and load=0)
    end
    
endmodule