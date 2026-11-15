// ============================================================================
// Module      : tb_mux_2x1_gate
// Description : Exhaustive testbench for gate-level 2-to-1 MUX.
// ============================================================================
`timescale 1ns / 1ps

module tb_mux_2x1_gate();
    reg i0, i1, s;
    wire y;

    MUX_2x1_gate dut (.i0(i0), .i1(i1), .s(s), .y(y));

    initial begin
        $monitor("Time: %0t | s=%b i1=%b i0=%b | y=%b", $time, s, i1, i0, y);
        s=0; i1=0; i0=0; #10;
        s=0; i1=0; i0=1; #10;
        s=0; i1=1; i0=0; #10;
        s=0; i1=1; i0=1; #10;
        s=1; i1=0; i0=0; #10;
        s=1; i1=0; i0=1; #10;
        s=1; i1=1; i0=0; #10;
        s=1; i1=1; i0=1; #10;
        $finish;
    end
endmodule