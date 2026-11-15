// ============================================================================
// Module      : fa_gate
// Description : Full Adder implementation using raw logic gates.
// Design Style: Gate-Level Primitive Modeling
// ============================================================================
`timescale 1ns / 1ps

module fa_gate(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire s1, s2, s3;
    
    xor x1 (s1, a, b);
    and a1 (s2, a, b);
    xor x2 (sum, s1, cin);
    and a2 (s3, s1, cin);
    or  o1 (cout, s2, s3);

endmodule