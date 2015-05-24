`include "og.v"
module og_tb ();

    reg q1, q0, x;
    wire z;

    og     og0(q1, q0, x, z);

    initial begin
        $monitor ("%4d: q1 = %b, q0 = %b, x = %b, z = %b", $time, q1, q0, x, z);
        #10 q1 = 0; q0 = 0; x = 0;
        #10 q1 = 0; q0 = 0; x = 1;
        #10 q1 = 0; q0 = 1; x = 0;
        #10 q1 = 0; q0 = 1; x = 1;
        #10 q1 = 1; q0 = 0; x = 0;
        #10 q1 = 1; q0 = 0; x = 1;
        #10 q1 = 1; q0 = 1; x = 0;
        #10 q1 = 1; q0 = 1; x = 1;
    end
endmodule
