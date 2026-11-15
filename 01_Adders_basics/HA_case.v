// ============================================================================
// Module      : HA_case
// Description : Half Adder implementation using a behavioral case statement.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module HA_case (
    input wire a,
    input wire b,
    output reg sum,
    output reg carry
);

    // always @* automatically captures all inputs for combinational logic
    always @* begin 
        case ({a,b}) 
            2'b00: begin sum = 0; carry = 0; end 
            2'b01: begin sum = 1; carry = 0; end 
            2'b10: begin sum = 1; carry = 0; end 
            2'b11: begin sum = 0; carry = 1; end  
            default: begin sum = 0; carry = 0; end // Prevents combinational latches
        endcase 
    end

endmodule