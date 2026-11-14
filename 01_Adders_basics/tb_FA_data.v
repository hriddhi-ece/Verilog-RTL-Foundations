// ============================================================================
// Module      : tb_FA_data
// Description : Exhaustive testbench for the Dataflow Full Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_FA_data();
    reg a, b, c;
    wire s, cout;

    FA_data dut (.a(a), .b(b), .c(c), .s(s), .cout(cout));

    initial begin
        $monitor("Time: %0t | a=%b b=%b c=%b | cout=%b s=%b", $time, a, b, c, cout, s);
        #10 a=0; b=0; c=0;
        #10 a=0; b=0; c=1;
        #10 a=0; b=1; c=0;
        #10 a=0; b=1; c=1;
        #10 a=1; b=0; c=0;
        #10 a=1; b=0; c=1;
        #10 a=1; b=1; c=0;
        #10 a=1; b=1; c=1;
        #10 $finish;
    end    
endmodule