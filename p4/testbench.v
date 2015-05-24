`timescale 1ns/1ps
`include "addr_8bit.v"

module testbench();
    reg [7:0] a, b;
    reg ci;

    wire [7:0] s;
    wire c6, c7;

    addr_8bit       addr(a, b, ci, s, c6, c7);

    initial begin

        $display("%4s  %8s  %8s  %8s  %8s  %8s", "Time", "a", "b", "ci", "co", "s");
        $monitor("%4d  %8b  %8b  %8b  %8b  %8b", $time, a, b, ci, c7, s);

        a=8'hFF; b=8'h00; ci=1'b1;
        #10
        a=8'h01; b=8'hFF; ci=1'b0;
        #10
        a=8'h55; b=8'hAA; ci=1'b0;
        #10
        a=8'h00; b=8'hFF; ci=1'b1;
        #10
        $finish;
    end
endmodule