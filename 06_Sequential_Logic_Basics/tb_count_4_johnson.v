// ============================================================================
// Module      : tb_count_4_johnson
// Description : Automated testbench for 4-bit Johnson Counter.
// ============================================================================
`timescale 1ns / 1ps

module tb_count_4_johnson();
    reg clk, reset;
    wire [3:0] count;

    count_4_johnson dut (.clk(clk), .reset(reset), .count(count));

    always #10 clk = ~clk;

    initial begin
        clk = 0; reset = 1; // Assert async reset
        $monitor("Time=%0t | clk=%b reset=%b | count=%b", $time, clk, reset, count);
        
        #15 reset = 0; // Release reset and begin counting
        #200 $finish;  // Observe the 8-state sequence
    end
endmodule