// ============================================================================
// Module      : mux_4x1_pipo
// Description : 4-to-1 MUX built structurally for PIPO register routing.
// Design Style: Structural Modeling
// ============================================================================
`timescale 1ns / 1ps

module mux_4x1_pipo(
    input wire i0,
    input wire i1,
    input wire i2,
    input wire i3,
    input wire s1,
    input wire s0,
    output wire y
);
    wire p, q;
    
    // Explicit named port mapping
    MUX_2x1_gate d0 (.i0(i0), .i1(i1), .s(s0), .y(p));
    MUX_2x1_gate d1 (.i0(i2), .i1(i3), .s(s0), .y(q));
    MUX_2x1_gate d2 (.i0(p),  .i1(q),  .s(s1), .y(y));
        
endmodule