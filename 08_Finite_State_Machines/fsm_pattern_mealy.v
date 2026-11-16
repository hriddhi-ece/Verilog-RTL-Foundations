// ============================================================================
// Module      : fsm_pattern_mealy
// Description : 1011 Sequence Detector (Overlapping) - Mealy Machine.
// ============================================================================
`timescale 1ns / 1ps

module fsm_pattern_mealy (
    input wire din,
    input wire clk,
    input wire reset,
    output reg Z
);

    parameter Sin = 2'b00, S1 = 2'b01, S10 = 2'b10, S101 = 2'b11;
    
    reg [1:0] state, next_state;

    // 1. State Register
    always @(posedge clk or posedge reset) begin
        if (reset) 
            state <= Sin;
        else
            state <= next_state; 
    end 

    // 2. Next-State Logic
    always @* begin
        case (state) 
            Sin:  next_state = (din == 1'b1) ? S1 : Sin;
            S1:   next_state = (din == 1'b0) ? S10 : S1;
            S10:  next_state = (din == 1'b1) ? S101 : Sin;
            S101: next_state = (din == 1'b1) ? S1 : S10; // Overlap mapping
            default: next_state = Sin;
        endcase
    end

    // 3. Output Logic (Depends on State AND Input)
    always @* begin
        if (state == S101 && din == 1'b1)
            Z = 1'b1;
        else
            Z = 1'b0;
    end

endmodule