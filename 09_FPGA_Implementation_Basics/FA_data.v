// ============================================================================
// Module      : FA_data
// Description : 1-bit Full Adder using dataflow modeling.
// ============================================================================
`timescale 1ns / 1ps

module FA_data(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule