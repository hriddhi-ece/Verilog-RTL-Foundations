// ============================================================================
// Module      : sr_latch
// Description : Basic Set-Reset Latch using NOR gate cross-coupling.
// Design Style: Gate-Level Modeling
// ============================================================================
`timescale 1ns / 1ps

module sr_latch(
    input wire s,
    input wire r,
    output wire q,
    output wire qbar
);
    nor (q, r, qbar);
    nor (qbar, s, q);
    
endmodule