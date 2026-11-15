// ============================================================================
// Module      : dec_2to4
// Description : 2-to-4 Decoder using dataflow modeling.
// ============================================================================
`timescale 1ns / 1ps

module dec_2to4 (
    input d0,
    input d1,
    output y0,
    output y1,
    output y2,
    output y3
);
    assign y0 = (~d1) & (~d0);
    assign y1 = (~d1) & (d0);
    assign y2 = (d1) & (~d0);
    assign y3 = (d1) & (d0);
endmodule