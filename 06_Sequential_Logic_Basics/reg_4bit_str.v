// ============================================================================
// Module      : reg_4bit_str
// Description : Structural 4-bit Register with load control.
// Design Style: Structural Modeling
// ============================================================================
`timescale 1ns / 1ps

module reg_4bit_str(
    input wire [3:0] D,
    input wire clk,
    input wire load,
    output wire [3:0] Q
);
    wire [3:0] S;
    
    // Explicit named port mapping to prevent hierarchy bugs
     MUX_2x1_gate m0 (.i0(Q[0]), .i1(D[0]), .s(load), .y(S[0]));
     MUX_2x1_gate m1 (.i0(Q[1]), .i1(D[1]), .s(load), .y(S[1]));
    MUX_2x1_gate m2 (.i0(Q[2]), .i1(D[2]), .s(load), .y(S[2]));
     MUX_2x1_gate m3 (.i0(Q[3]), .i1(D[3]), .s(load), .y(S[3])); 
    
    d_ff df0 (.D(S[0]), .clk(clk), .Q(Q[0]));
    d_ff df1 (.D(S[1]), .clk(clk), .Q(Q[1]));
    d_ff df2 (.D(S[2]), .clk(clk), .Q(Q[2]));
    d_ff df3 (.D(S[3]), .clk(clk), .Q(Q[3]));
    
endmodule