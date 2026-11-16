// ============================================================================
// Module      : HA_gate
// Description : Gate-level Half Adder for Basys 3 FPGA implementation.
// ============================================================================
`timescale 1ns / 1ps

module HA_gate(
    input a,
    input b,
    output sum,
    output carry
);

    xor (sum, a, b);
    and (carry, a, b);

endmodule