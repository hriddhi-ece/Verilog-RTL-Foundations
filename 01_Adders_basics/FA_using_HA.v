// ============================================================================
// Module      : FA_using_HA
// Description : Full Adder built by instantiating two Half Adders.
// Design Style: Structural Modeling
// ============================================================================
`timescale 1ns / 1ps

module FA_using_HA(
    input a,
    input b,
    input cin,
    output sum,
    output carry
    );
    
  wire s1,s2,s3;
  
  // First HA computes partial sum and carry
  HA_gate d0 ( .a (a) , .b (b) , .sum (s1), .carry (s2));
  
  // Second HA adds the carry-in to the partial sum
  HA_gate d1 ( .a (s1) , .b (cin) , .sum(sum) , .carry(s3));
  
  // Final carry is the OR of the two partial carries
  assign carry = s2 | s3;
endmodule