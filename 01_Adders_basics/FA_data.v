// ============================================================================
// Module      : FA_data
// Description : Full Adder using bitwise operators.
// Design Style: Dataflow Modeling
// ============================================================================
`timescale 1ns / 1ps

module FA_data(
    input a,
    input b,
    input c,
    output s,
    output cout
    );
    assign s = a ^ b ^ c;
    assign cout = (a&b)|(a&c)|(b&c);
endmodule