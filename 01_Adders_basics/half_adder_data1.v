// ============================================================================
// Module      : half_adder_data1
// Description : Half Adder using bitwise operators.
// Design Style: Dataflow Modeling
// ============================================================================
`timescale 1ns / 1ps

module half_adder_data1(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign sum = a ^ b;
	assign carry = a & b;
    
endmodule