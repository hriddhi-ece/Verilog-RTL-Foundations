`timescale 1ns / 1ps
module tb_demux_1x4();
    reg x, s1, s0; wire y0, y1, y2, y3;
    demux_1x4 dut (.x(x), .s1(s1), .s0(s0), .y0(y0), .y1(y1), .y2(y2), .y3(y3));
    initial begin
        $monitor("Time=%0t | x=%b s1=%b s0=%b | y3=%b y2=%b y1=%b y0=%b", $time, x, s1, s0, y3, y2, y1, y0);
        x=1; s1=0; s0=0; #10;
        x=1; s1=0; s0=1; #10;
        x=1; s1=1; s0=0; #10;
        x=1; s1=1; s0=1; #10;
        x=0; s1=1; s0=1; #10; // Test disabled input
        $finish;
    end
endmodule