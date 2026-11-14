// ============================================================================
// Module      : tb_MUX_2x1
// Description : Exhaustive testbench for the 2-to-1 Multiplexer.
// ============================================================================
`timescale 1ns / 1ps

module tb_MUX_2x1();
    reg I0, I1, S;
    wire Y;

    MUX_2x1 dut (.I0(I0), .I1(I1), .S(S), .Y(Y));

    initial begin
        $monitor("Time: %0t | S=%b I1=%b I0=%b | Y=%b", $time, S, I1, I0, Y);
        
        // Test S = 0 (Routes I0 to Y)
        #10 S=0; I1=0; I0=0;
        #10 S=0; I1=1; I0=0;
        #10 S=0; I1=0; I0=1; 
        #10 S=0; I1=1; I0=1; 
        
        // Test S = 1 (Routes I1 to Y)
        #10 S=1; I1=0; I0=0;
        #10 S=1; I1=0; I0=1;
        #10 S=1; I1=1; I0=0; 
        #10 S=1; I1=1; I0=1;
        
        #10 $finish;
    end    
endmodule