`include "cla_2bit.v"

module addr_8bit (a, b, ci, s, c6, c7);
    input [7:0] a, b;
    input ci;
    output [7:0] s;
    output c6, c7;

    wire c1, c3;
    wire [7:0] b0;


    assign b0 = ci ? ~b : b;

    cla_2bit    sla0(a[1:0], b0[1:0], ci, s[1:0], c0, c1);
    cla_2bit    sla1(a[3:2], b0[3:2], c1, s[3:2], c2, c3);
    cla_2bit    sla2(a[5:4], b0[5:4], c3, s[5:4], c4, c5);
    cla_2bit    sla3(a[7:6], b0[7:6], c5, s[7:6], c6, c7);

endmodule