// ============================================================================
// Module      : tb_reg_4bit_str
// Description : Testbench for structural load-controlled 4-bit Register.
// ============================================================================
`timescale 1ns / 1ps

module tb_reg_4bit_str();
    reg [3:0] D;
    reg clk, load;
    wire [3:0] Q;

    reg_4bit_str dut (.D(D), .clk(clk), .load(load), .Q(Q));

    always #10 clk = ~clk;

    initial begin
        clk = 0; load = 0; D = 4'b0000;
        $monitor("Time=%0t | clk=%b load=%b D=%b | Q=%b", $time, clk, load, D, Q);
        
        #15 D = 4'b1100; load = 1; // Load new data
        #20 load = 0; D = 4'b1111; // Change data but don't load (hold state)
        #20 load = 1;              // Load the new data
        #20 $finish;
    end
endmodule