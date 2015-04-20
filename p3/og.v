module og(q1, q0, x, z);
    input q1, q0;
    input x;
    output z;

    assign z = q1 & q0 & x;
endmodule
