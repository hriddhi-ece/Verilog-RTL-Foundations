// ============================================================================
// Module      : rca_4bit
// Description : 4-bit Ripple Carry Adder using structural instantiation.
// Design Style: Structural Modeling
// ============================================================================
`timescale 1ns / 1ps

module rca_4bit(
    input [3:0] a,
    input [3:0] b,
    input c,
    output [3:0] sum,
    output cout
);

    wire c1, c2, c3;

    // Instantiating 4 Full Adders using named port mapping for safety
    fa_if d0 (.a(a[0]), .b(b[0]), .cin(c),  .sum(sum[0]), .cout(c1));
    fa_if d1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    fa_if d2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    fa_if d3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
                
endmodule