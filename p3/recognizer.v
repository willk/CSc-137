`include "og.v"
`include "nsg.v"
`include "sync_d_ff.v"

module recognizer (x, clk, reset, z);
    input x, clk, reset;
    output z;

    wire d0, d1, q0, q1;

    sync_d_ff    ff0(d0, clk, reset, q0);
    sync_d_ff    ff1(d1, clk, reset, q1);
    og           og0(q0, q1, x, z);
    nsg         nsg0(q0, q1, x, d1, d0);
endmodule