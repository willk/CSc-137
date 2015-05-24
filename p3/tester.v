`include "recognizer.v"

module tester();
    reg clk, reset, x;
    wire z;

    recognizer         rec(x, clk, reset, z);

    initial begin
        clk = 0;
        reset = 0;
        x = 0;
        #10 reset = 1;
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 0; $display("%4d: x = %b z = %b", $time, x, z);
        #10 x = 1; $display("%4d: x = %b z = %b", $time, x, z);
        #10 $finish;
    end
endmodule