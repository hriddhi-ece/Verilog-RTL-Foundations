// ============================================================================
// Module      : fsm_counter
// Description : Moore FSM for a 2-bit counter with an enable (din) signal.
// Design Style: 3-Block FSM Architecture
// ============================================================================
`timescale 1ns / 1ps

module fsm_counter (
    input wire clk,
    input wire reset,
    input wire din,
    output reg [1:0] z
);

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    
    reg [1:0] state, next_state;

    // 1. State Register (Sequential)
    always @(posedge clk or posedge reset) begin 
        if (reset)
            state <= S0;
        else 
            state <= next_state;
    end 

    // 2. Next-State Logic (Combinational)
    always @* begin 
        case (state)
            S0: next_state = (din == 1'b1) ? S1 : S0;
            S1: next_state = (din == 1'b1) ? S2 : S1;
            S2: next_state = (din == 1'b1) ? S3 : S2;
            S3: next_state = (din == 1'b1) ? S0 : S3;
            default: next_state = S0;
        endcase                         
    end

    // 3. Output Logic (Combinational - Moore)
    always @* begin
        z = state; // Output is purely dependent on current state
    end

endmodule