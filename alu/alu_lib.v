module AND (
    input wire a, b,
    output wire y
);
    assign y = a & b;
endmodule

module OR (
    input wire a, b,
    output wire y
);
    assign y = a | b;
endmodule

module NOT (
    input wire a,
    output wire y
);
    assign y = !a;
endmodule

module XOR (
    input wire a, b,
    output wire y
);
    assign y = a ^ b;
endmodule

module NAND (
    input wire a, b,
    output wire y
);
    wire x;
    AND p (a, b, x);
    NOT q (x, y);
endmodule

module NOR (
    input wire a, b,
    output wire y
);
    wire x;
    OR p (a, b, x);
    NOT q (x, y);
endmodule

module XNOR (
    input wire a, b,
    output wire y
);
    wire x;
    XOR p (a, b, x);
    NOT q (x, y);
endmodule

module two_to_one_mux (
    input wire [1:0] i,
    input wire s,
    output wire y
);
    assign y = s ? i[1] : i[0];
endmodule

module four_to_one_mux (
    input wire [3:0] i,
    input wire [1:0] s,
    output wire y
);
    wire [1:0] r;
    two_to_one_mux m1 (i[1:0], s[0], r[0]);
    two_to_one_mux m2 (i[3:2], s[0], r[1]);
    two_to_one_mux m3 (r[1:0], s[1], y);
endmodule

module eight_to_one_mux (
    input wire [7:0] i,
    input wire [2:0] s,
    output wire y
);
    wire [1:0] x;
    four_to_one_mux m1 (i[3:0], s[1:0], x[0]);
    four_to_one_mux m2 (i[7:4], s[1:0], x[1]);
    two_to_one_mux m3 (x[1:0], s[2], y);
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
