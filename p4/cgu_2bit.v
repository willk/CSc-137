module cgu_2bit (p, g, ci, c0, c1);
    input [1:0] p, g;
    input ci;
    output c0, c1;

    wire w0, w1, w2, w3;

    assign w0 = ~(~p[0] | ~ci);
    assign w1 = ~( g[0] |  w0);
    assign w2 = ~(~p[1] |  w1);
    assign w3 = ~( g[1] |  w2);

    assign c0 = ~w1;
    assign c1 = ~w3;

endmodule