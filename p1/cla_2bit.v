`include "pgu_2bit.v"
`include "cgu_2bit.v"
`include "su_2bit.v"

module cla_2bit(a, b, ci, s, c0, c1);

    input [1:0] a, b;
    input ci;
    output [1:0] s;
    output c0, c1;


    wire [1:0] c, g, p;

    assign c0 = c[0];
    assign c1 = c[1];

    pgu_2bit    pgu(a, b, p, g);
    cgu_2bit    cgu(p, g, ci, c0, c1);
    su_2bit     su(p, {c0, ci}, s);

endmodule