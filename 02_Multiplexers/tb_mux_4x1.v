`timescale 1ns / 1ps
module tb_mux_4x1();
    reg i0, i1, i2, i3, s1, s0; wire y;
    mux_4x1 dut (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s1(s1), .s0(s0), .y(y));
    initial begin
        $monitor("Time=%0t | s1=%b s0=%b | i3..i0=%b%b%b%b | y=%b", $time, s1, s0, i3, i2, i1, i0, y);
        i3=1; i2=0; i1=1; i0=0; // Distinct data pattern
        s1=0; s0=0; #10; // y = 0
        s1=0; s0=1; #10; // y = 1
        s1=1; s0=0; #10; // y = 0
        s1=1; s0=1; #10; // y = 1
        $finish;
    end
endmodule