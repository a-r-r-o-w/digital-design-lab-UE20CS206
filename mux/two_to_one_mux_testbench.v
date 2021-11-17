module two_to_one_mux_testbench;
    reg a, b, s;
    wire y;

    two_to_one_mux m (a, b, s, y);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, two_to_one_mux_testbench);
    end

    initial begin $monitor(a, b, s, y);
        s = 1'b0;
        a = 1'b0;
        b = 1'b0;
        #5
        a = 1'b0;
        b = 1'b1;
        #5
        a = 1'b1;
        b = 1'b0;
        #5
        a = 1'b1;
        b = 1'b1;
        #5
        s = 1'b1;
        a = 1'b0;
        b = 1'b0;
        #5
        a = 1'b0;
        b = 1'b1;
        #5
        a = 1'b1;
        b = 1'b0;
        #5
        a = 1'b1;
        b = 1'b1;
        #5
        ;
    end
endmodule
