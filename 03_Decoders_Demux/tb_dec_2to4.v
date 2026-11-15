`timescale 1ns / 1ps
module tb_dec_2to4();
    reg d0, d1; wire y0, y1, y2, y3;
    dec_2to4 dut (.d0(d0), .d1(d1), .y0(y0), .y1(y1), .y2(y2), .y3(y3));
    initial begin
        $monitor("Time=%0t | d1=%b d0=%b | y3=%b y2=%b y1=%b y0=%b", $time, d1, d0, y3, y2, y1, y0);
        d1=0; d0=0; #10;
        d1=0; d0=1; #10;
        d1=1; d0=0; #10;
        d1=1; d0=1; #10;
        $finish;
    end
endmodule