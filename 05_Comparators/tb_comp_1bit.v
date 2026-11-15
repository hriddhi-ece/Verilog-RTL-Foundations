`timescale 1ns / 1ps
module tb_comp_1bit();
    reg a, b; wire g, e, s;
    comp_1bit dut (.a(a), .b(b), .g(g), .e(e), .s(s));
    initial begin
        $monitor("Time=%0t | a=%b b=%b | Greater=%b Equal=%b Smaller=%b", $time, a, b, g, e, s);
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        $finish;
    end
endmodule