// ============================================================================
// Module      : fsm_pattern_moore
// Description : 1011 Sequence Detector (Overlapping) - Moore Machine.
// ============================================================================
`timescale 1ns / 1ps

module fsm_pattern_moore (
    input wire din,
    input wire clk,
    input wire reset,
    output reg Z
);

    parameter Sin = 3'b000, S1 = 3'b001, S10 = 3'b010, S101 = 3'b011, S1011 = 3'b111;
    
    reg [2:0] state, next_state;

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
            Sin:   next_state = (din == 1'b1) ? S1 : Sin;
            S1:    next_state = (din == 1'b0) ? S10 : S1;
            S10:   next_state = (din == 1'b1) ? S101 : Sin;
            S101:  next_state = (din == 1'b1) ? S1011 : S10;
            S1011: next_state = (din == 1'b0) ? Sin : S1; // Allows overlapping sequences
            default: next_state = Sin;
        endcase
    end

    // 3. Output Logic (Depends ONLY on state)
    always @* begin
        Z = (state == S1011) ? 1'b1 : 1'b0;
    end

endmodule