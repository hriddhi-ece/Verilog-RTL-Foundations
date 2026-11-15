// ============================================================================
// Module      : comp_1bit
// Description : 1-bit Magnitude Comparator.
// ============================================================================
`timescale 1ns / 1ps

module comp_1bit(
    input a,
    input b,
    output g, // Greater
    output e, // Equal
    output s  // Smaller
);
    assign g = a & (~b);
    assign e = a ~^ b; // XNOR
    assign s = (~a) & b;
endmodule