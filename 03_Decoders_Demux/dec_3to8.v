// ============================================================================
// Module      : dec_3to8
// Description : 3-to-8 Decoder built using 2-to-4 enabled decoders.
// ============================================================================
`timescale 1ns / 1ps

module dec_3to8 (
    input E,
    input a, input b, input c,
    output y0, output y1, output y2, output y3,
    output y4, output y5, output y6, output y7
);
    wire p, q;
    
    // Fixed compilation error by explicitly mapping ports and leaving y2/y3 unconnected
    dec_2to4_en d0 (.E(E), .d1(1'b0), .d0(c), .y0(p), .y1(q), .y2(), .y3());
    dec_2to4_en d1 (.E(p), .d1(a),    .d0(b), .y0(y0), .y1(y1), .y2(y2), .y3(y3));
    dec_2to4_en d2 (.E(q), .d1(a),    .d0(b), .y0(y4), .y1(y5), .y2(y6), .y3(y7));
endmodule