// ============================================================================
// Module      : d_ff_clr
// Description : D Flip-Flop with synchronous clear.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module d_ff_clr(
    input wire D,
    input wire clear,
    input wire clk,
    output reg Q
);

    always @(posedge clk) begin 
        if (clear == 1'b1)
            Q <= 1'b0;
        else 
            Q <= D;
    end
    
endmodule