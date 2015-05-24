module pgu_2bit (a, b, p, g);
    input [1:0] a, b;
    output [1:0] p, g;
    assign p = a ^ b;
    assign g = a & b;
endmodule