// ============================================================================
// Module      : tb_HA_case
// Description : Exhaustive testbench for behavioral case statement Half Adder.
// ============================================================================
`timescale 1ns / 1ps

module tb_HA_case();

    reg a;
    reg b;
    wire sum;
    wire carry;

    HA_case dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $monitor("Time=%0t | a=%b b=%b | sum=%b carry=%b", $time, a, b, sum, carry);
        
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 a = 1'bx; b = 1'bz;
        #10 $finish;
    end

endmodule