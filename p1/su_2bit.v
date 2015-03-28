module su_2bit (p, c, s);
    input [1:0] p, c;
    output [1:0] s;
    assign s = p ^ c;
endmodule