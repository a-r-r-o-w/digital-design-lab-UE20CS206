module basic_gates_testbench;
    reg a;
    reg b;
    wire [7:0] x;

    AND  A (a, b, x[0]);
    OR   B (a, b, x[1]);
    NOT  C (a, x[2]);
    NOT  D (b, x[3]);
    NAND E (a, b, x[4]);
    NOR  F (a, b, x[5]);
    XOR  G (a, b, x[6]);
    XNOR H (a, b, x[7]);

    initial begin $dumpfile("dump.vcd");
        $dumpvars(0, basic_gates_testbench);
    end

    initial begin $monitor(a, b);
        a = 1'b0;
        b = 1'b0;
        #10
        a = 1'b0;
        b = 1'b1;
        #10
        a = 1'b1;
        b = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
        #10
        ;
    end
endmodule