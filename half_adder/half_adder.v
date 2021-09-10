module XOR (
    input wire a,
    input wire b,
    output wire y
);

    assign y = a ^ b;

endmodule

module AND (
    input wire a,
    input wire b,
    output wire y
);

    assign y = a & b;

endmodule

module half_adder (
    input wire a,
    input wire b,
    output wire s,
    output wire c
);

    XOR A (a, b, s);
    AND B (a, b, c);

endmodule
