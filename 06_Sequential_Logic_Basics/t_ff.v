// ============================================================================
// Module      : t_ff
// Description : T (Toggle) Flip-Flop.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module t_ff(
    input wire T,
    input wire clk,
    output reg Q
);
    
    initial begin 
        Q = 0; // Initialization for FPGA simulation
    end 
    
    always @(negedge clk) begin 
        if (T == 1'b0)
            Q <= Q;
        else 
            Q <= ~Q;
    end
    
endmodule