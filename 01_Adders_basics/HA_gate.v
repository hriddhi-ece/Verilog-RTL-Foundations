// ============================================================================
// Module      : HA_gate
// Description : Gate-level implementation of a Half Adder.
// Design Style: Gate-Level Primitive Modeling
// ============================================================================
module HA_gate(
    input a,
    input b,
    output sum,
    output carry
    );
    
 xor (sum, a,b);
 and (carry, a,b);
    
endmodule