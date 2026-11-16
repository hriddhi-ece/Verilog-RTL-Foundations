// ============================================================================
// Module      : tb_sipo_4bit
// Description : Testbench for 4-bit SIPO Shift Register.
// ============================================================================
`timescale 1ns / 1ps

module tb_sipo_4bit();
    reg Din, clk, load;
    wire [3:0] Q;

    sipo_4bit d1 (.Din(Din), .clk(clk), .load(load), .Q(Q));
    
    always #20 clk = ~clk;
    
    initial begin 
        clk = 1; load = 1; Din = 0;
        $monitor("Time=%0t | clk=%b load=%b Din=%b | Q=%b", $time, clk, load, Din, Q);
        
        #10 Din = 1;
        #200 Din = 0;
        #250 load = 0; // Disable shifting
        #100 Din = 1;
        #50 $finish;
    end
endmodule