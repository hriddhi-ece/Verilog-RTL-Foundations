// ============================================================================
// Module      : sipo_4bit
// Description : 4-bit Serial-In Parallel-Out (SIPO) Shift Register.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module sipo_4bit(
    input wire Din,
    input wire clk,
    input wire load,
    output wire [3:0] Q
);
    reg [3:0] temp;
    
    always @(posedge clk) begin 
        if (load == 1'b1) begin
            temp <= {temp[2:0], Din}; // Non-blocking shift logic
        end
        // Implicit else: temp <= temp
    end
    
    assign Q = temp;
    
endmodule