`timescale 1ns / 1ps
module tb_func_decoder();
    reg E, a, b, c; wire y;
    func_decoder dut (.E(E), .a(a), .b(b), .c(c), .y(y));
    integer i;
    initial begin
        $monitor("Time=%0t | E=%b cab=%b%b%b | Function y=%b", $time, E, c, a, b, y);
        E=1;
        for (i=0; i<8; i=i+1) begin
            {c, a, b} = i; #10; 
        end
        $finish;
    end
endmodule