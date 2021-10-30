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
