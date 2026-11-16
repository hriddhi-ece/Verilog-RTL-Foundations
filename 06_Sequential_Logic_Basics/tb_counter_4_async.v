// ============================================================================
// Module      : tb_counter_4_async
// Description : Automated testbench for 4-bit Asynchronous Counter.
// ============================================================================
`timescale 1ns / 1ps

module tb_counter_4_async();
    reg clk;
    wire [3:0] count;

    counter_4_async dut (.clk(clk), .count(count));

    always #10 clk = ~clk;

    initial begin
        clk = 1;
        $monitor("Time=%0t | clk=%b | count=%b (%0d)", $time, clk, count, count);
        
        #350 $finish; // Allow enough time to ripple through all 16 states
    end
endmodule