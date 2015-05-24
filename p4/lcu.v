module lcu (start, mode, reset, clk, c6, c7, s0, s1, s2, m, e, error, done);
    input start, mode, reset, clk, c6, c7;
    wire ovf;
    output reg s0, s1, s2, m, e, error, done;

    assign ovf = ~(c6 ^ c7) ? 1 : 0;

    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100;

    reg [1:0] cs, ns;

    always@(posedge reset)
    begin
        if(reset==1)begin
            error <= 0;
            done <= 0;
        end
    end

    always @(*) begin
        casex(cs)
        A:
            if (start == 0) begin // if start == 0
                ns = B;
                assign e = 1'b0;
                assign s0 = 1'b0;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end else begin // else start == 1
                ns = A;
                assign e = 1'b1;
                assign s0 = 1'b0;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end // end else ovf == 1
        B:
            if (ovf == 0) begin // if ovf == 0
                ns = C;
                assign e = 1'b1;
                assign s0 = 1'b1;
                assign s1 = 1'b0;
                assign s2 = 1'b0;
                assign done = 1'b0;
                assign m = 1'b0;
            end else begin // else ovf == 1
                ns = E;
                assign e = 1'b0;
                assign s0 = 1'bx;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end // end else ovf == 1
        C:
            if (ovf == 0) begin // if ovf == 0
                ns = D;
                assign e = 1'b1;
                assign s0 = 1'b1;
                assign s1 = 1'b1;
                assign s2 = 1'b0;
                assign done = 1'b0;
                assign m = 0;
            end else begin // else ovf == 1
                ns = E;
                assign e = 1'b0;
                assign s0 = 1'bx;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end // end else ovf == 1
        D:
            if (ovf == 0) begin // if ovf == 0
                ns = A;
                if (mode == 1) begin // if mode == 1
                    assign e = 1'b1;
                    assign s0 = 1'b0;
                    assign s1 = 1'b0;
                    assign s2 = 1'b1;
                    assign done = 1'b1;
                    assign m = 0;
                end else begin // else mode == 0
                    assign e = 1'b1;
                    assign s0 = 1'b1;
                    assign s1 = 1'b0;
                    assign s2 = 1'b1;
                    assign done = 1'b1;
                    assign m = 1;
                end
            end else begin // else ovf == 1
                ns = E;
                assign e = 1'b0;
                assign s0 = 1'bx;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end
        E:
            begin
                assign error = 1'b1;
                assign e = 1'b0;
                assign s0 = 1'bx;
                assign s1 = 1'bx;
                assign s2 = 1'bx;
                assign done = 1'b0;
                assign m = 1'bx;
            end
        endcase
    end // always@(*)

    always @(posedge clk or posedge reset) begin
        cs <= reset ? A : ns;
    end //always @(posedge clk or posedge reset) begin
endmodule