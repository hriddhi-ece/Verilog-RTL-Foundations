// ============================================================================
// Module      : fa_if
// Description : Full Adder implementation using procedural if-else routing.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module fa_if(
    input a,
    input b,
    input cin,
    output reg sum,
    output reg cout
);

    always @* begin
        if (a == 0 && b == 0 && cin == 0) begin
            sum = 0; cout = 0; 
        end else if (a == 0 && b == 0 && cin == 1) begin
            sum = 1; cout = 0; 
        end else if (a == 0 && b == 1 && cin == 0) begin
            sum = 1; cout = 0; 
        end else if (a == 0 && b == 1 && cin == 1) begin
            sum = 0; cout = 1; 
        end else if (a == 1 && b == 0 && cin == 0) begin
            sum = 1; cout = 0; 
        end else if (a == 1 && b == 0 && cin == 1) begin
            sum = 0; cout = 1; 
        end else if (a == 1 && b == 1 && cin == 0) begin
            sum = 0; cout = 1; 
        end else if (a == 1 && b == 1 && cin == 1) begin
            sum = 1; cout = 1; 
        end else begin
            sum = 0; cout = 0; // Fallback to prevent latches
        end
    end
    
endmodule