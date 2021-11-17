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
endmodule;

module NOT (
    input wire a,
    output wire y
);
    assign y =  !a;
endmodule;

module XOR (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a ^ b;
endmodule

module NAND (
    input wire a,
    input wire b,
    output wire y
);
    wire x;
    AND A (a, b, x);
    NOT B (x, y);
endmodule

module NOR (
    input wire a,
    input wire b,
    output wire y
);
    wire x;
    OR  A (a, b, x);
    NOT B (x, y);
endmodule

module XNOR (
    input wire a,
    input wire b,
    output wire y
);
    wire x;
    XOR A (a, b, x);
    NOT B (x, y);
endmodule
