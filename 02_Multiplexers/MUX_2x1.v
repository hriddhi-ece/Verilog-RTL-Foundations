// ============================================================================
// Module      : MUX_2x1
// Description : 2-to-1 Multiplexer using procedural if-else routing.
// Design Style: Behavioral Modeling
// ============================================================================
`timescale 1ns / 1ps

module MUX_2x1(
    input I0,
    input I1,
    input S,
    output reg Y
    );
    
 // always @* automatically triggers on any input change (Synthesis best practice)
 always @*
 begin
 if (S) 
  Y=I1;
 else
  Y= I0;
 end   
endmodule