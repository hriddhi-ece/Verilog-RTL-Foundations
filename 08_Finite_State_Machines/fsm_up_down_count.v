// ============================================================================
// Module      : fsm_up_down_count
// Description : Moore FSM for a 2-bit Up/Down counter based on 'dir' input.
// ============================================================================
`timescale 1ns / 1ps

module fsm_up_down_count (
    input wire clk,
    input wire reset,
    input wire dir,
    output reg [1:0] z
);

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    
    reg [1:0] state, next_state;

    // 1. State Register
    always @(posedge clk or posedge reset) begin 
        if (reset)
            state <= S0;
        else 
            state <= next_state;
    end 

    // 2. Next-State Logic
    always @* begin 
        case (state)
            S0: next_state = (dir == 1'b1) ? S3 : S1;
            S1: next_state = (dir == 1'b1) ? S0 : S2;
            S2: next_state = (dir == 1'b1) ? S1 : S3;
            S3: next_state = (dir == 1'b1) ? S2 : S0;
            default: next_state = S0;
        endcase    
    end 

    // 3. Output Logic
    always @* begin
        z = state; 
    end
endmodule