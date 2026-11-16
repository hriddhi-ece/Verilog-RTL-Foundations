// ============================================================================
// Module      : tb_jk_ff
// Description : Testbench for JK Flip-Flop.
// ============================================================================
`timescale 1ns / 1ps

module tb_jk_ff();
    reg J, K, clk;
    wire Q;

    jk_ff dut (.J(J), .K(K), .clk(clk), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 0; J = 0; K = 0;
        $monitor("Time=%0t | clk=%b J=%b K=%b | Q=%b", $time, clk, J, K, Q);
        
        #15 J = 1; K = 0; // Set
        #20 J = 0; K = 0; // Hold
        #20 J = 0; K = 1; // Reset
        #20 J = 1; K = 1; // Toggle
        #20 $finish;
    end
endmodule