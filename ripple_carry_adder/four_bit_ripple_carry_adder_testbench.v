`define size 8

module four_bit_ripple_carry_adder_testbench;
    // reg [4:0] i, j;
    // reg [1:0] k;
    reg [8:0] tests [0 : `size - 1];

    reg [3:0] a, b;
    reg c_in;

    wire [3:0] s;
    wire c_out;

    four_bit_ripple_carry_adder f (a, b, c_in, s, c_out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, four_bit_ripple_carry_adder_testbench);
    end

    initial begin
        // for (i = 0; i < (1 << 4); ++i) begin
        //     for (j = 0; j < (1 << 4); ++j) begin
        //         for (k = 0; k < (1 << 1); ++k)
        //             begin
        //                 // $display("here");
        //                 a = i;
        //                 b = j;
        //                 c_in = k;
        //                 // $display("%b %b %b", a, b, c_in);
        //                 #1
        //                 ;
        //                 end 
        //         end
        // end

        tests[0] = 9'b000000010;
        tests[1] = 9'b000100010;
        tests[2] = 9'b011100010;
        tests[3] = 9'b000001110;
        tests[4] = 9'b011001111;
        tests[5] = 9'b001110011;
        tests[6] = 9'b111100011;
        tests[7] = 9'b011101110;

        for (integer index = 0; index < `size; ++index) begin
            {a, b, c_in} = tests[index];
            #10
            ;
        end
    end
endmodule
