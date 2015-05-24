`include "addr_8bit.v"
`include "bcd_mux.v"
`include "a_mux.v"
`include "lcu.v"

module a4 (a, b, c, d, mode, sum);


    input [7:0] a, b, c, d;
    input mode;
    wire [7:0] a_out, bcd_out, s;
    wire start, mode, reset, clk, c6, c7, s0, s1, s2, m, e, error, done;
    output reg [7:0] sum;


    lcu     lcu(start, mode, reset, clk, c6, c7, s0, s1, s2, m, e, error, done);
    a_mux   a_mux(a, s, s0, a_out);
    bcd_mux bcd_mux(b, c, d, s1, s2, bcd_out);
    addr_8bit   addr(a_out, bcd_out, m, s, c6, c7);

    always@(*) begin
        if (e) begin
            assign sum = s;
        end
    end
endmodule