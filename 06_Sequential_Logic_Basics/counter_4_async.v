// ============================================================================
// Module      : counter_4_async
// Description : 4-bit Asynchronous (Ripple) Counter.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module counter_4_async( 
    input wire clk, 
    output reg [3:0] count 
);

    initial begin
        count = 4'b0000;
    end

    // Each bit acts as the clock for the next significant bit
    always @(negedge clk)
        count[0] <= ~count[0];

    always @(negedge count[0])
        count[1] <= ~count[1];

    always @(negedge count[1])
        count[2] <= ~count[2];

    always @(negedge count[2])
        count[3] <= ~count[3];

endmodule