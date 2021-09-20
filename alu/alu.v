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

    four_to_one_mux E (result, operation, o);

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
    alu_1 A (operation, a[ 0], b[ 0], operation[0], o[0], x[0]);
    alu_1 B (operation, a[ 1], b[ 1], x[ 0], o[ 1], x[ 1]);
    alu_1 C (operation, a[ 2], b[ 2], x[ 1], o[ 2], x[ 2]);
    alu_1 D (operation, a[ 3], b[ 3], x[ 2], o[ 3], x[ 3]);
    alu_1 E (operation, a[ 4], b[ 4], x[ 3], o[ 4], x[ 4]);
    alu_1 F (operation, a[ 5], b[ 5], x[ 4], o[ 5], x[ 5]);
    alu_1 G (operation, a[ 6], b[ 6], x[ 5], o[ 6], x[ 6]);
    alu_1 H (operation, a[ 7], b[ 7], x[ 6], o[ 7], x[ 7]);
    alu_1 I (operation, a[ 8], b[ 8], x[ 7], o[ 8], x[ 8]);
    alu_1 J (operation, a[ 9], b[ 9], x[ 8], o[ 9], x[ 9]);
    alu_1 K (operation, a[10], b[10], x[ 9], o[10], x[10]);
    alu_1 L (operation, a[11], b[11], x[10], o[11], x[11]);
    alu_1 M (operation, a[12], b[12], x[11], o[12], x[12]);
    alu_1 N (operation, a[13], b[13], x[12], o[13], x[13]);
    alu_1 O (operation, a[14], b[14], x[13], o[14], x[14]);
    alu_1 P (operation, a[15], b[15], x[14], o[15], c_out);
endmodule
