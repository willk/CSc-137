module bcd_mux (b, c, d, s1, s2, out);
    input [7:0] b, c, d;
    input  s1, s2;
    output [7:0] out;

    assign out = s2 ? d : s1 ? c : d;
    // always @(*) begin
    //     if (s2 == 1'b1 && s1 == 1'b0)
    //         begin
    //             assign out = d;
    //         end
    //     else
    //         begin
    //             if (s1 == 1'b1)
    //                 begin
    //                     assign out = c;
    //                 end
    //             else
    //                 begin
    //                     assign out = b;
    //                 end
    //         end
    // end
endmodule