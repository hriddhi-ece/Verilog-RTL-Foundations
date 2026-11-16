// ============================================================================
// Module      : sr_ff
// Description : Clocked Set-Reset Flip-Flop.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module sr_ff( 
    input wire s, 
    input wire r, 
    input wire clk, 
    output reg q, 
    output reg qbar
);
    
    always @(posedge clk) begin 
        if (s == 1'b1 && r == 1'b0) begin 
            q <= 1'b1;
            qbar <= 1'b0;
        end 
        else if (s == 1'b0 && r == 1'b1) begin 
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else if (s == 1'b0 && r == 1'b0) begin 
            q <= q;
            qbar <= qbar;
        end
        // 1,1 is typically undefined/invalid for SR FF
    end
    
endmodule