// ============================================================================
// Module      : tb_FA_using_HA
// Description : Exhaustive testbench for the Structural Full Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_FA_using_HA();
    reg a, b, cin;
    wire sum, carry;

    FA_using_HA dut (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    initial begin
        $monitor("Time: %0t | a=%b b=%b cin=%b | carry=%b sum=%b", $time, a, b, cin, carry, sum);
        #10 a=0; b=0; cin=0;
        #10 a=0; b=0; cin=1;
        #10 a=0; b=1; cin=0;
        #10 a=0; b=1; cin=1;
        #10 a=1; b=0; cin=0;
        #10 a=1; b=0; cin=1;
        #10 a=1; b=1; cin=0;
        #10 a=1; b=1; cin=1;
        #10 $finish;
    end    
endmodule