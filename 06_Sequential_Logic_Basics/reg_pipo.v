// ============================================================================
// Module      : reg_pipo
// Description : 4-bit Universal Shift Register (Parallel In Parallel Out).
// Design Style: Structural Modeling
// ============================================================================
`timescale 1ns / 1ps

module reg_pipo(
    input wire [3:0] D,
    input wire [1:0] CTRL,
    input wire clear,
    input wire clk,
    input wire XL, // Serial input for Left Shift
    input wire XR, // Serial input for Right Shift
    output wire [3:0] Q
);
    wire [3:0] S;
    
    // Explicit named port mapping to avoid positional routing bugs
    mux_4x1_pipo m0 (.i0(Q[0]), .i1(XL),   .i2(Q[1]), .i3(D[0]), .s1(CTRL[1]), .s0(CTRL[0]), .y(S[0]));
    mux_4x1_pipo m1 (.i0(Q[1]), .i1(Q[0]), .i2(Q[2]), .i3(D[1]), .s1(CTRL[1]), .s0(CTRL[0]), .y(S[1]));
    mux_4x1_pipo m2 (.i0(Q[2]), .i1(Q[1]), .i2(Q[3]), .i3(D[2]), .s1(CTRL[1]), .s0(CTRL[0]), .y(S[2]));
    mux_4x1_pipo m3 (.i0(Q[3]), .i1(Q[2]), .i2(XR),   .i3(D[3]), .s1(CTRL[1]), .s0(CTRL[0]), .y(S[3]));
    
    d_ff_clr d1 (.D(S[0]), .clear(clear), .clk(clk), .Q(Q[0]));
    d_ff_clr d2 (.D(S[1]), .clear(clear), .clk(clk), .Q(Q[1]));
    d_ff_clr d3 (.D(S[2]), .clear(clear), .clk(clk), .Q(Q[2]));
    d_ff_clr d4 (.D(S[3]), .clear(clear), .clk(clk), .Q(Q[3])); 
    
endmodule