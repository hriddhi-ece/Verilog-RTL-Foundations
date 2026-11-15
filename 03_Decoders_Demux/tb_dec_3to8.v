`timescale 1ns / 1ps
module tb_dec_3to8();
    reg E, a, b, c; wire y0, y1, y2, y3, y4, y5, y6, y7;
    dec_3to8 dut (.E(E), .a(a), .b(b), .c(c), .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7));
    integer i;
    initial begin
        $monitor("Time=%0t | E=%b cab=%b%b%b | y7..y0=%b%b%b%b%b%b%b%b", $time, E, c, a, b, y7, y6, y5, y4, y3, y2, y1, y0);
        E=0; c=0; a=0; b=0; #10; // Disabled
        E=1;
        for (i=0; i<8; i=i+1) begin
            {c, a, b} = i; #10; // Loops through all 8 states
        end
        $finish;
    end
endmodule