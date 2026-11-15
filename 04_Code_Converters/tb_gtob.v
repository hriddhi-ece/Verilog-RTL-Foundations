`timescale 1ns / 1ps
module tb_gtob();
    reg [3:0] g; wire [3:0] b;
    // Swap 'gtob_case' to 'gtob_data' to test the other module
    gtob_case dut (.g(g), .b(b)); 
    integer i;
    initial begin
        $monitor("Time=%0t | Gray=%b | Binary=%b", $time, g, b);
        for (i=0; i<16; i=i+1) begin
            g = i; #10;
        end
        $finish;
    end
endmodule