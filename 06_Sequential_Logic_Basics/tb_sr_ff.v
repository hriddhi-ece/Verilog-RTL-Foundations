// ============================================================================
// Module      : tb_sr_ff
// Description : Testbench for clocked SR Flip-Flop.
// ============================================================================
`timescale 1ns / 1ps

module tb_sr_ff();
    reg s, r, clk;
    wire q, qbar;

    sr_ff dut (.s(s), .r(r), .clk(clk), .q(q), .qbar(qbar));

    always #10 clk = ~clk;

    initial begin
        clk = 0; s = 0; r = 0;
        $monitor("Time=%0t | clk=%b s=%b r=%b | q=%b qbar=%b", $time, clk, s, r, q, qbar);
        
        #15 s = 1; r = 0; // Set
        #20 s = 0; r = 0; // Hold
        #20 s = 0; r = 1; // Reset
        #20 s = 0; r = 0; // Hold
        #20 $finish;
    end
endmodule