// ============================================================================
// Module      : tb_reg_pipo
// Description : Testbench for 4-bit Universal Shift Register.
// ============================================================================
`timescale 1ns / 1ps

module tb_reg_pipo();
    reg [3:0] D;
    reg [1:0] CTRL;
    reg clear, clk, XL, XR;
    wire [3:0] Q;

    reg_pipo p1 (.D(D), .CTRL(CTRL), .clear(clear), .clk(clk), .XL(XL), .XR(XR), .Q(Q));
    
    always #20 clk = ~clk;

    initial begin 
        clk = 1; clear = 0;
        XL = 1; XR = 0; D = 4'b0011;
        $monitor("Time=%0t | clk=%b clear=%b CTRL=%b D=%b XL=%b XR=%b | Q=%b", $time, clk, clear, CTRL, D, XL, XR, Q);
        
        #10 CTRL = 2'b11; // Parallel Load
        #100 CTRL = 2'b01; // Shift Right
        #100 CTRL = 2'b10; // Shift Left
        #100 CTRL = 2'b00; // Hold State
        #80 $finish;
    end
endmodule