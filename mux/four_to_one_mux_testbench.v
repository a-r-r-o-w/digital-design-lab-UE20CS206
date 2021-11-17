module four_to_one_mux_testbench;
    reg unsigned [2:0] a;
    reg unsigned [4:0] b;
    reg unsigned [3:0] i;
    reg unsigned [1:0] s;
    wire y;

    four_to_one_mux m (i, s, y);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, four_to_one_mux_testbench);
    end

    initial begin
        for (a = 0; a < (1 << 2); ++a)
            begin
                s = a;
                for (b = 0; b < (1 << 4); ++b)
                    begin
                        i = b;
                        // $display("%b %b", s, i);
                        #5
                        ;
                    end
            end
    end
endmodule
