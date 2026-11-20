// ============================================================================
// Module      : comp_4bit
// Description : 4-bit Structural Magnitude Comparator built from four 1-bit comparators.
// ============================================================================
`timescale 1ns / 1ps

module comp_4bit(
    input [3:0] a,
    input [3:0] b,
    output g, // Greater (A > B)
    output e, // Equal   (A = B)
    output s  // Smaller (A < B)
);
    wire g3, e3, s3;
    wire g2, e2, s2;
    wire g1, e1, s1;
    wire g0, e0, s0;
    wire w_g2, w_g1, w_g0;
    wire w_s2, w_s1, w_s0;

    // Four 1-bit comparators (MSB = bit 3 down to LSB = bit 0)
    comp_1bit c3 (.a(a[3]), .b(b[3]), .g(g3), .e(e3), .s(s3));
    comp_1bit c2 (.a(a[2]), .b(b[2]), .g(g2), .e(e2), .s(s2));
    comp_1bit c1 (.a(a[1]), .b(b[1]), .g(g1), .e(e1), .s(s1));
    comp_1bit c0 (.a(a[0]), .b(b[0]), .g(g0), .e(e0), .s(s0));

    // Equality: all four bit pairs must be equal
    and a_eq (e, e3, e2, e1, e0);

    // Greater than (A > B): cascade from MSB to LSB
    and a_g2 (w_g2, e3, g2);
    and a_g1 (w_g1, e3, e2, g1);
    and a_g0 (w_g0, e3, e2, e1, g0);
    or  o_gt (g, g3, w_g2, w_g1, w_g0);

    // Smaller than (A < B): cascade from MSB to LSB
    and a_s2 (w_s2, e3, s2);
    and a_s1 (w_s1, e3, e2, s1);
    and a_s0 (w_s0, e3, e2, e1, s0);
    or  o_lt (s, s3, w_s2, w_s1, w_s0);
endmodule