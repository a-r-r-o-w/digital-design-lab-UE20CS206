module AND (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a & b;
endmodule

module OR (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a | b;
endmodule

module XOR (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a ^ b;
endmodule

module full_adder (
    input wire a,
    input wire b,
    input wire c_in,
    output wire s,
    output wire c_out
);
    wire [4:0] x;
    
    XOR A (a, b, x[0]);
    XOR B (x[0], c_in, s);

    AND C (a, b, x[1]);
    AND D (b, c_in, x[2]);
    AND E (c_in, a, x[3]);

    OR F (x[1], x[2], x[4]);
    OR G (x[3], x[4], c_out);
endmodule
