// ============================================================================
// Module      : tb_t_ff
// Description : Testbench for T Flip-Flop.
// ============================================================================
`timescale 1ns / 1ps

module tb_t_ff();
    reg T, clk;
    wire Q;

    t_ff dut (.T(T), .clk(clk), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 0; T = 0;
        $monitor("Time=%0t | clk=%b T=%b | Q=%b", $time, clk, T, Q);
        
        #15 T = 1; // Start toggling
        #40 T = 0; // Stop toggling, hold state
        #20 $finish;
    end
endmodule