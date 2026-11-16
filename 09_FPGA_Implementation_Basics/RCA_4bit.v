// ============================================================================
// Module      : RCA_4bit
// Description : 4-bit Ripple Carry Adder using four FA_data stages.
// ============================================================================
`timescale 1ns / 1ps

module RCA_4bit(
    input [3:0] A,
    input [3:0] B,
    input C,
    output [3:0] S,
    output Cout
);
    wire c1, c2, c3;

    FA_data d1(.a(A[0]), .b(B[0]), .cin(C),  .sum(S[0]), .cout(c1));
    FA_data d2(.a(A[1]), .b(B[1]), .cin(c1), .sum(S[1]), .cout(c2));
    FA_data d3(.a(A[2]), .b(B[2]), .cin(c2), .sum(S[2]), .cout(c3));
    FA_data d4(.a(A[3]), .b(B[3]), .cin(c3), .sum(S[3]), .cout(Cout));

endmodule