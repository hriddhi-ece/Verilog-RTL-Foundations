// ============================================================================
// Module      : tb_reg_4bit
// Description : Testbench for 4-bit Register.
// ============================================================================
`timescale 1ns / 1ps

module tb_reg_4bit();
    reg [3:0] D;
    reg clk;
    wire [3:0] Q;

    reg_4bit dut (.D(D), .clk(clk), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 1; D = 4'b0000;
        $monitor("Time=%0t | clk=%b D=%b | Q=%b", $time, clk, D, Q);
        
        #15 D = 4'b1010;
        #20 D = 4'b0101;
        #20 $finish;
    end
endmodule