module four_bit_ripple_carry_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c_in,
    output wire [3:0] s,
    output wire c_out
);
    wire [2:0] c;
    full_adder f1 (a[0], b[0], c_in, s[0], c[0]);
    full_adder f2 (a[1], b[1], c[0], s[1], c[1]);
    full_adder f3 (a[2], b[2], c[1], s[2], c[2]);
    full_adder f4 (a[3], b[3], c[2], s[3], c_out);
endmodule
