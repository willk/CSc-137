module inverter (b, m, b0);
    input [7:0] b;
    input m;
    output [7:0] b0;

    assign b0 = m ^ b;
endmodule

