// ============================================================================
// Module      : tb_half_adder_data
// Description : Exhaustive testbench for the Dataflow Half Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_half_adder_data();
    reg a, b;
    wire sum, carry;

    half_adder_data dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        $monitor("Time: %0t | a=%b b=%b | carry=%b sum=%b", $time, a, b, carry, sum);
        #10 a = 0; b = 0; 
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end    
endmodule