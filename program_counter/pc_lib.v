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

module mux_2to1 (
    input wire [1:0] i,
    input wire s,
    output wire y
);
    assign y = s ? i[1] : i[0];
endmodule

module mux_4to1 (
    input wire [3:0] i,
    input wire [1:0] s,
    output wire y
);
    wire [1:0] r;
    mux_2to1 m1 (i[1:0], s[0], r[0]);
    mux_2to1 m2 (i[3:2], s[0], r[1]);
    mux_2to1 m3 (r[1:0], s[1], y);
endmodule

module mux_8to1 (
    input wire [7:0] i,
    input wire [2:0] s,
    output wire y
);
    wire [1:0] x;
    mux_4to1 m1 (i[3:0], s[1:0], x[0]);
    mux_4to1 m2 (i[7:4], s[1:0], x[1]);
    mux_2to1 m3 (x[1:0], s[2], y);
endmodule

module demux_1to2 (
    input wire i,
    input wire s,
    output wire [1:0] o
);
    assign o[0] = s ? 1'b0 : i;
    assign o[1] = s ? i : 1'b0;
endmodule

module demux_1to4 (
    input wire i,
    input wire [1:0] s,
    output wire [3:0] o
);
    wire [1:0] t;
    demux_1to2 A (i, s[1], t[1:0]);
    demux_1to2 B (t[0], s[0], o[1:0]);
    demux_1to2 C (t[1], s[0], o[3:2]);
endmodule

module demux_1to8 (
    input wire i,
    input wire [2:0] s,
    output wire [7:0] o
);
    wire [1:0] t;
    demux_1to2 A (i, s[2], t[1:0]);
    demux_1to4 B (t[0], s[1:0], o[3:0]);
    demux_1to4 C (t[1], s[1:0], o[7:4]);
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

module adder_subtractor (
    input wire mode, i0, i1, c_in,
    output wire r, c_out
);
    wire t;
    XOR x (i1, mode, t);
    full_adder f (i0, t, c_in, r, c_out);
endmodule

// D flip flop
module DF (
    input wire clk,
    input wire in,
    output wire out
);
    reg df;
    always@(posedge clk) df <= in;
    assign out = df;
endmodule

// D flip flop with reset enabled
module DFR (
    input wire clk,
    input wire reset,
    input wire in,
    output wire out
);
    wire reset_inverse, df_in;
    NOT A (reset, reset_inverse);
    AND B (in, reset_inverse, df_in);
    DF  C (clk, df_in, out);
endmodule

// D flip flop with reset and load enabled
module DFRL (
    input wire clk,
    input wire reset,
    input wire load,
    input wire in,
    output wire out
);
  wire _in;
  mux_2to1 A ({out, in}, load, _in);
  DFR B (clk, reset, _in, out);
endmodule
