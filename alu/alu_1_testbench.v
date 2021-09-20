module one_bit_alu_testbench;
    reg [1:0] operation;
    reg a, b;
    wire o, c_out;

    one_bit_alu ALU (operation, a, b, o, c_out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, one_bit_alu_testbench);
    end

    initial begin
        operation[0] = 0;
        operation[1] = 0;

        a = 0;
        b = 0;
        #5
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5

        operation[0] = 0;
        operation[1] = 1;

        a = 0;
        b = 0;
        #5
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5

        operation[0] = 1;
        operation[1] = 0;

        a = 0;
        b = 0;
        #5
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5

        operation[0] = 1;
        operation[1] = 1;

        a = 0;
        b = 0;
        #5
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5
        ;
    end
endmodule
