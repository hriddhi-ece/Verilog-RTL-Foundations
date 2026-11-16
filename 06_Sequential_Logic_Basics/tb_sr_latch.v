// ============================================================================
// Module      : tb_sr_latch
// Description : Automated testbench for NOR-based SR Latch.
// ============================================================================
`timescale 1ns / 1ps

module tb_sr_latch();
    reg s, r;
    wire q, qbar;

    sr_latch dut (.s(s), .r(r), .q(q), .qbar(qbar));

    initial begin
        $monitor("Time=%0t | s=%b r=%b | q=%b qbar=%b", $time, s, r, q, qbar);
        s = 0; r = 1; // Reset
        #10 s = 0; r = 0; // Hold
        #10 s = 1; r = 0; // Set
        #10 s = 0; r = 0; // Hold
        #10 s = 1; r = 1; // Invalid state
        #10 $finish;
    end
endmodule