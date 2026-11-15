// ============================================================================
// Module      : dec_2to4_en
// Description : 2-to-4 Decoder with enable pin using dataflow.
// ============================================================================
`timescale 1ns / 1ps

module dec_2to4_en (
    input E,
    input d0,
    input d1,
    output y0, output y1, output y2, output y3
);
    assign y0 = E & (~d1) & (~d0);
    assign y1 = E & (~d1) & (d0);
    assign y2 = E & (d1) & (~d0);
    assign y3 = E & (d1) & (d0);
endmodule