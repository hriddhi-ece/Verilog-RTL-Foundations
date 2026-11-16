// ============================================================================
// Module      : RCA_4_bit_7seg
// Description : 4-bit Ripple Carry Adder driving a Basys 3 7-segment display.
// ============================================================================
`timescale 1ns / 1ps

module RCA_4_bit_7seg(
    input [3:0] A,
    input [3:0] B,
    input C,
    output reg [6:0] seg,
    output [3:0] an,
    output Cout
);
    wire [3:0] S;
    wire c1, c2, c3;

    FA_data d1(.a(A[0]), .b(B[0]), .cin(C),  .sum(S[0]), .cout(c1));
    FA_data d2(.a(A[1]), .b(B[1]), .cin(c1), .sum(S[1]), .cout(c2));
    FA_data d3(.a(A[2]), .b(B[2]), .cin(c2), .sum(S[2]), .cout(c3));
    FA_data d4(.a(A[3]), .b(B[3]), .cin(c3), .sum(S[3]), .cout(Cout));

    // Enable only the rightmost 7-segment digit (active-low common anode)
    assign an = 4'b1110;

    always @* begin
        case (S)
            4'b0000: seg = 7'b1000000;
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            4'b1010: seg = 7'b0001000;
            4'b1011: seg = 7'b0000011;
            4'b1100: seg = 7'b1000110;
            4'b1101: seg = 7'b0100001;
            4'b1110: seg = 7'b0000110;
            4'b1111: seg = 7'b0001110;
            default: seg = 7'b1111111; // Prevents latches on unexpected states
        endcase
    end

endmodule