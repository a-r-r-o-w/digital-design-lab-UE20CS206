module reg16 (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [15:0] d_in,
    output wire [15:0] r
);
    DFRL D00 (clk, reset, load, d_in[00], r[00]);
    DFRL D01 (clk, reset, load, d_in[01], r[01]);
    DFRL D02 (clk, reset, load, d_in[02], r[02]);
    DFRL D03 (clk, reset, load, d_in[03], r[03]);
    DFRL D04 (clk, reset, load, d_in[04], r[04]);
    DFRL D05 (clk, reset, load, d_in[05], r[05]);
    DFRL D06 (clk, reset, load, d_in[06], r[06]);
    DFRL D07 (clk, reset, load, d_in[07], r[07]);
    DFRL D08 (clk, reset, load, d_in[08], r[08]);
    DFRL D09 (clk, reset, load, d_in[09], r[09]);
    DFRL D10 (clk, reset, load, d_in[10], r[10]);
    DFRL D11 (clk, reset, load, d_in[11], r[11]);
    DFRL D12 (clk, reset, load, d_in[12], r[12]);
    DFRL D13 (clk, reset, load, d_in[13], r[13]);
    DFRL D14 (clk, reset, load, d_in[14], r[14]);
    DFRL D15 (clk, reset, load, d_in[15], r[15]);
endmodule

module mux_128to16 (
    input wire [15:0] i0, i1, i2, i3, i4, i5, i6, i7,
    input wire [2:0] s,
    output wire [15:0] o
);
    mux_8to1 M00 ({i0[00], i1[00], i2[00], i3[00], i4[00], i5[00], i6[00], i7[00]}, s[2:0], o[00]);
    mux_8to1 M01 ({i0[01], i1[01], i2[01], i3[01], i4[01], i5[01], i6[01], i7[01]}, s[2:0], o[01]);
    mux_8to1 M02 ({i0[02], i1[02], i2[02], i3[02], i4[02], i5[02], i6[02], i7[02]}, s[2:0], o[02]);
    mux_8to1 M03 ({i0[03], i1[03], i2[03], i3[03], i4[03], i5[03], i6[03], i7[03]}, s[2:0], o[03]);
    mux_8to1 M04 ({i0[04], i1[04], i2[04], i3[04], i4[04], i5[04], i6[04], i7[04]}, s[2:0], o[04]);
    mux_8to1 M05 ({i0[05], i1[05], i2[05], i3[05], i4[05], i5[05], i6[05], i7[05]}, s[2:0], o[05]);
    mux_8to1 M06 ({i0[06], i1[06], i2[06], i3[06], i4[06], i5[06], i6[06], i7[06]}, s[2:0], o[06]);
    mux_8to1 M07 ({i0[07], i1[07], i2[07], i3[07], i4[07], i5[07], i6[07], i7[07]}, s[2:0], o[07]);
    mux_8to1 M08 ({i0[08], i1[08], i2[08], i3[08], i4[08], i5[08], i6[08], i7[08]}, s[2:0], o[08]);
    mux_8to1 M09 ({i0[09], i1[09], i2[09], i3[09], i4[09], i5[09], i6[09], i7[09]}, s[2:0], o[09]);
    mux_8to1 M10 ({i0[10], i1[10], i2[10], i3[10], i4[10], i5[10], i6[10], i7[10]}, s[2:0], o[10]);
    mux_8to1 M11 ({i0[11], i1[11], i2[11], i3[11], i4[11], i5[11], i6[11], i7[11]}, s[2:0], o[11]);
    mux_8to1 M12 ({i0[12], i1[12], i2[12], i3[12], i4[12], i5[12], i6[12], i7[12]}, s[2:0], o[12]);
    mux_8to1 M13 ({i0[13], i1[13], i2[13], i3[13], i4[13], i5[13], i6[13], i7[13]}, s[2:0], o[13]);
    mux_8to1 M14 ({i0[14], i1[14], i2[14], i3[14], i4[14], i5[14], i6[14], i7[14]}, s[2:0], o[14]);
    mux_8to1 M15 ({i0[15], i1[15], i2[15], i3[15], i4[15], i5[15], i6[15], i7[15]}, s[2:0], o[15]);
endmodule

module register (
    input wire clk, reset, wr,
    input wire [2:0] rd_addr_a, rd_addr_b, wr_addr,
    input wire [15:0] d_in,
    output wire [15:0] d_out_a, d_out_b
);
    wire [7:0] load;
    wire [15:0] r [0:7];

    demux_1to8 D (wr, wr_addr, load);

    reg16 R0 (clk, reset, load[0], d_in, r[0]);
    reg16 R1 (clk, reset, load[1], d_in, r[1]);
    reg16 R2 (clk, reset, load[2], d_in, r[2]);
    reg16 R3 (clk, reset, load[3], d_in, r[3]);
    reg16 R4 (clk, reset, load[4], d_in, r[4]);
    reg16 R5 (clk, reset, load[5], d_in, r[5]);
    reg16 R6 (clk, reset, load[6], d_in, r[6]);
    reg16 R7 (clk, reset, load[7], d_in, r[7]);

    mux_128to16 M0 (r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], rd_addr_a[2:0], d_out_a[15:0]);
    mux_128to16 M1 (r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], rd_addr_b[2:0], d_out_b[15:0]);
endmodule

module mux_alu (
    input wire [15:0] d_in,
    input wire [15:0] alu_out,
    input wire s,
    output wire [15:0] d_out
);
    mux_2to1 M00 ({d_in[00], alu_out[00]}, s, d_out[00]);
    mux_2to1 M01 ({d_in[01], alu_out[01]}, s, d_out[01]);
    mux_2to1 M02 ({d_in[02], alu_out[02]}, s, d_out[02]);
    mux_2to1 M03 ({d_in[03], alu_out[03]}, s, d_out[03]);
    mux_2to1 M04 ({d_in[04], alu_out[04]}, s, d_out[04]);
    mux_2to1 M05 ({d_in[05], alu_out[05]}, s, d_out[05]);
    mux_2to1 M06 ({d_in[06], alu_out[06]}, s, d_out[06]);
    mux_2to1 M07 ({d_in[07], alu_out[07]}, s, d_out[07]);
    mux_2to1 M08 ({d_in[08], alu_out[08]}, s, d_out[08]);
    mux_2to1 M09 ({d_in[09], alu_out[09]}, s, d_out[09]);
    mux_2to1 M10 ({d_in[10], alu_out[10]}, s, d_out[10]);
    mux_2to1 M11 ({d_in[11], alu_out[11]}, s, d_out[11]);
    mux_2to1 M12 ({d_in[12], alu_out[12]}, s, d_out[12]);
    mux_2to1 M13 ({d_in[13], alu_out[13]}, s, d_out[13]);
    mux_2to1 M14 ({d_in[14], alu_out[14]}, s, d_out[14]);
    mux_2to1 M15 ({d_in[15], alu_out[15]}, s, d_out[15]);
endmodule

module reg_alu (
    input wire clk, reset, s, wr,
    input wire [1:0] operation,
    input wire [2:0] rd_addr_a, rd_addr_b, wr_addr,
    input wire [15:0] d_in,
    output wire [15:0] d_out_a, d_out_b,
    output wire cout
);
    wire [15:0] alu_out;
    wire [15:0] d_in_new;
    
    mux_alu  S (d_in, alu_out, s, d_in_new);
    register R (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in_new, d_out_a, d_out_b);
    
    alu_16 A (operation, d_out_a, d_out_b, alu_out, cout);
endmodule
