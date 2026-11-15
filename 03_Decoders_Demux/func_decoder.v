// ============================================================================
// Module      : func_decoder
// Description : Combinational function implementation using a 3-to-8 decoder.
// ============================================================================
`timescale 1ns / 1ps

module func_decoder (
    input E, a, b, c,
    output y
);
    wire d0, d1, d2, d3, d4, d5, d6, d7;
    
    dec_3to8 x0 (.E(E), .a(a), .b(b), .c(c), .y0(d0), .y1(d1), .y2(d2), .y3(d3), .y4(d4), .y5(d5), .y6(d6), .y7(d7));
    
    // Implements sum of minterms (0, 2, 4)
    assign y = d0 | d2 | d4;
endmodule