module alu_1 (
    input wire [1:0] operation,
    input wire a,
    input wire b,
    input wire c,
    output wire o,
    output wire c_out
);
    wire x;
    wire [3:0] result;

    XOR        A (operation[0], b, x);
    full_adder B (a, x, c, result[0], c_out);
    AND        C (a, b, result[2]);
    OR         D (a, b, result[3]);

    assign result[1] = result[0];

    mux_4to1 E (result, operation, o);

    // operation 0: a + b
    // operation 1: a - b
    // operation 2: a & b
    // operation 3: a | b
endmodule

module alu_16 (
    input wire [1:0] operation,
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] o,
    output wire c_out
);
    wire [14:0] x;
    alu_1 A (operation, a[00], b[00], operation[0], o[0], x[0]);
    alu_1 B (operation, a[01], b[01], x[00], o[01], x[01]);
    alu_1 C (operation, a[02], b[02], x[01], o[02], x[02]);
    alu_1 D (operation, a[03], b[03], x[02], o[03], x[03]);
    alu_1 E (operation, a[04], b[04], x[03], o[04], x[04]);
    alu_1 F (operation, a[05], b[05], x[04], o[05], x[05]);
    alu_1 G (operation, a[06], b[06], x[05], o[06], x[06]);
    alu_1 H (operation, a[07], b[07], x[06], o[07], x[07]);
    alu_1 I (operation, a[08], b[08], x[07], o[08], x[08]);
    alu_1 J (operation, a[09], b[09], x[08], o[09], x[09]);
    alu_1 K (operation, a[10], b[10], x[09], o[10], x[10]);
    alu_1 L (operation, a[11], b[11], x[10], o[11], x[11]);
    alu_1 M (operation, a[12], b[12], x[11], o[12], x[12]);
    alu_1 N (operation, a[13], b[13], x[12], o[13], x[13]);
    alu_1 O (operation, a[14], b[14], x[13], o[14], x[14]);
    alu_1 P (operation, a[15], b[15], x[14], o[15], c_out);
endmodule
