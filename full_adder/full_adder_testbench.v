module full_adder_testbench;
    reg a;
    reg b;
    reg c_in;
    wire [7:0] s;
    wire [7:0] c_out;

    full_adder A (a, b, c_in, s[0], c_out[0]);
    full_adder B (a, b, c_in, s[1], c_out[1]);
    full_adder C (a, b, c_in, s[2], c_out[2]);
    full_adder D (a, b, c_in, s[3], c_out[3]);
    full_adder E (a, b, c_in, s[4], c_out[4]);
    full_adder F (a, b, c_in, s[5], c_out[5]);
    full_adder G (a, b, c_in, s[6], c_out[6]);
    full_adder H (a, b, c_in, s[7], c_out[7]);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, full_adder_testbench);
    end

    initial begin
        $monitor(a, b, c_in);
        a = 1'b0;
        b = 1'b0;
        c_in = 1'b0;
        #10
        a = 1'b0;
        b = 1'b0;
        c_in = 1'b1;
        #10
        a = 1'b0;
        b = 1'b1;
        c_in = 1'b0;
        #10
        a = 1'b0;
        b = 1'b1;
        c_in = 1'b1;
        #10
        a = 1'b1;
        b = 1'b0;
        c_in = 1'b0;
        #10
        a = 1'b1;
        b = 1'b0;
        c_in = 1'b1;
        #10
        a = 1'b1;
        b = 1'b1;
        c_in = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
        c_in = 1'b1;
        #10
        ;
    end
endmodule
