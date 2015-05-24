`include addr_8bit.v

module addr_sub_8bit (a, b, ci, s, c6, c7);
    input [7:0] a, b;
    input ci;
    output [7:0] s;
    output b;