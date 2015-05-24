`include "inverter.v"

module i_tb ();
    wire m;
    wire b [7:0];

    assign b = 8'b01010101;
    assign m = 1'b1;

    wire b0;

    $display ("i: %b\n", 8'b);


    i inverter(b, m, b0);

    inital begin
        #10 $display("i:%b\n", b0);
        #10 $finish
    end
endmodule