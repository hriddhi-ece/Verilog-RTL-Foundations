// ============================================================================
// Module      : MUX2x1_data
// Description : 2-to-1 Multiplexer using boolean logic equations.
// Design Style: Behavioral / Dataflow
// ============================================================================
`timescale 1ns / 1ps

module MUX2x1_data(
    input i0,
    input i1,
    input s,
    output reg y
);

    always @* begin 
       y = (~s & i0) | (s & i1);
    end
    
endmodule