module half_adder_testbench;
    reg a;
    reg b;
    wire [3:0] s;
    wire [3:0] c;

    half_adder A (a, b, s[0], c[0]);
    half_adder B (a, b, s[1], c[1]);
    half_adder C (a, b, s[2], c[2]);
    half_adder D (a, b, s[3], c[3]);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, half_adder_testbench);
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
