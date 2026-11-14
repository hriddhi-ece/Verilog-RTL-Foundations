// ============================================================================
// Module      : half_adder_data
// Description : Half Adder using concatenation and continuous assignment.
// Design Style: Dataflow Modeling
// ============================================================================
`timescale 1ns / 1ps

module half_adder_data(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign {carry,sum} = a + b;
    
endmodule