module sync_d_ff (d, clk, reset, q);
    input d, clk, reset;
    output q;
    reg q;

    always @(posedge clk)
        if (~reset) begin
            q <= 1'b0;
        end else begin
            q <= d;
        end
endmodule