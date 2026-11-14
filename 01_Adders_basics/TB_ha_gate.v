// ============================================================================
// Module      : TB_ha_gate
// Description : Exhaustive testbench for the Gate-Level Half Adder.
// ============================================================================
`timescale 1ns / 1ps

module TB_ha_gate();
    reg a, b;
    wire sum, carry;

    HA_gate dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        // Automatically prints to the console whenever a signal changes
        $monitor("Time: %0t | a=%b b=%b | carry=%b sum=%b", $time, a, b, carry, sum);
        
        #10 a = 0; b = 0; 
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end    
endmodule