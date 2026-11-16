// ============================================================================
// Module      : count_4_johnson
// Description : 4-bit Johnson (Twisted Ring) Counter with async reset.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module count_4_johnson(  
    input wire clk,  
    input wire reset,  
    output reg [3:0] count
);  

    // Fixed sensitivity list (added posedge reset) and removed illegal assign
    always @(posedge clk or posedge reset) begin  
        if (reset == 1'b1)  
            count <= 4'b0000;  
        else 
            count <= {~count[0], count[3:1]};  
    end  
  
endmodule