// ============================================================================
// Module      : tb_rca_4bit
// Description : Targeted edge-case testbench for 4-bit Ripple Carry Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_rca_4bit();
    reg [3:0] a;
    reg [3:0] b;
    reg c;
    wire [3:0] sum;
    wire cout;

    rca_4bit dut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Using %d to print decimal numbers for easier reading of 4-bit math
        $monitor("Time: %0t | a=%d b=%d c=%b | cout=%b sum=%d", $time, a, b, c, cout, sum);
        
        a = 4'd0;  b = 4'd0;  c = 0; #10; // 0 + 0 = 0
        a = 4'd5;  b = 4'd3;  c = 0; #10; // 5 + 3 = 8
        a = 4'd7;  b = 4'd8;  c = 0; #10; // 7 + 8 = 15
        a = 4'd15; b = 4'd1;  c = 0; #10; // 15 + 1 = 16 (sum=0, cout=1)
        a = 4'd15; b = 4'd15; c = 0; #10; // 15 + 15 = 30 (sum=14, cout=1)
        a = 4'd15; b = 4'd15; c = 1; #10; // 15 + 15 + 1 = 31 (sum=15, cout=1)
        
        #10 $finish;
    end
endmodule