// ============================================================================
// Module      : tb_fa_gate
// Description : Exhaustive testbench for gate-level Full Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_fa_gate();
    reg a, b, cin;
    wire sum, cout;

    fa_gate dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $monitor("Time: %0t | a=%b b=%b cin=%b | cout=%b sum=%b", $time, a, b, cin, cout, sum);
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