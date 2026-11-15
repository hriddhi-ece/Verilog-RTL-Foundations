// ============================================================================
// Module      : mux_4x1
// Description : 4-to-1 MUX built structurally using gate-level 2-to-1 MUXes.
// ============================================================================
`timescale 1ns / 1ps

module mux_4x1 (
    input i0, i1, i2, i3,
    input s1, s0,
    output y
);
    wire p, q;
    // Safely converted to named port mapping
        MUX_2x1_gate d0 (.i0(i0), .i1(i1), .s(s0), .y(p));
        MUX_2x1_gate d1 (.i0(i2), .i1(i3), .s(s0), .y(q));
        MUX_2x1_gate d2 (.i0(p),  .i1(q),  .s(s1), .y(y));
endmodule