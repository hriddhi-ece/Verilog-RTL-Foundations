// ============================================================================
// Module      : tb_d_ff
// Description : Testbench for D Flip-Flop.
// ============================================================================
`timescale 1ns / 1ps

module tb_d_ff();
    reg D, clk;
    wire Q;

    d_ff dut (.D(D), .clk(clk), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 0; D = 0;
        $monitor("Time=%0t | clk=%b D=%b | Q=%b", $time, clk, D, Q);
        
        #15 D = 1;
        #20 D = 0;
        #20 D = 1;
        #20 $finish;
    end
endmodule