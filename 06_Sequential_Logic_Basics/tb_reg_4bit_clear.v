// ============================================================================
// Module      : tb_reg_4bit_clear
// Description : Testbench for 4-bit Register with clear functionality.
// ============================================================================
`timescale 1ns / 1ps

module tb_reg_4bit_clear();
    reg [3:0] D;
    reg clk, load, clear;
    wire [3:0] Q;

    reg_4bit_clear dut (.D(D), .clk(clk), .load(load), .clear(clear), .Q(Q));
    
    always #20 clk = ~clk;

    initial begin 
        clk = 1; load = 0; clear = 0; D = 4'b0000;
        $monitor("Time=%0t | clk=%b clear=%b load=%b D=%b | Q=%b", $time, clk, clear, load, D, Q);
        
        #10 clear = 1; 
        #100 load = 1; D = 4'b0010; // Try to load while clear is active
        #50 clear = 0;              // Deactivate clear, allow load
        #100 load = 0; D = 4'b0110; // Change data but disable load
        #100 load = 1; D = 4'b0111; // Load new data
        #40 $finish;
    end
endmodule