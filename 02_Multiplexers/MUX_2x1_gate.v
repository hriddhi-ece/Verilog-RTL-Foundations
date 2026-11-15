// ============================================================================
// Module      : MUX_2x1_gate
// Description : 2-to-1 Multiplexer using raw logic gates.
// Design Style: Gate-Level Primitive Modeling
// ============================================================================
`timescale 1ns / 1ps

module MUX_2x1_gate(
    input i0,
    input i1,
    input s,
    output y
);
    
    wire sbar, p, q;
    
    not n1 (sbar, s);
    and n2 (p, sbar, i0);
    and n3 (q, i1, s);
    or  n4 (y, p, q);
    
endmodule