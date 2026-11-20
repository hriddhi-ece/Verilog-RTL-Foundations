// ============================================================================
// Module      : comp_2bit
// Description : 2-bit Structural Magnitude Comparator built from two 1-bit comparators.
// ============================================================================
`timescale 1ns / 1ps

module comp_2bit(
    input [1:0] a,
    input [1:0] b,
    output g, // Greater (A > B)
    output e, // Equal   (A = B)
    output s  // Smaller (A < B)
);
    wire g1, e1, s1;
    wire g0, e0, s0;
    wire w_g, w_s;

    // Two 1-bit comparators (MSB = bit 1, LSB = bit 0)
    comp_1bit c1 (.a(a[1]), .b(b[1]), .g(g1), .e(e1), .s(s1));
    comp_1bit c0 (.a(a[0]), .b(b[0]), .g(g0), .e(e0), .s(s0));

    // Gate-level logic matching the schematic
    and a_eq (e, e1, e0);

    and a_gt (w_g, e1, g0);
    or  o_gt (g, g1, w_g);

    and a_lt (w_s, e1, s0);
    or  o_lt (s, s1, w_s);
endmodule