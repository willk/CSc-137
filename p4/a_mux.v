module a_mux (a, sum, s0, out);
    input [7:0] a, sum;
    input s0;
    output [7:0] out;

    assign out = s0 ? sum : a;
endmodule