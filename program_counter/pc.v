module program_counter_0 (
    input wire clk, reset, offset, inc, sub, load,
    output wire pc, c_out
);
    wire t1, t2;
    OR A (offset, inc, t1);
    adder_subtractor B (sub, pc, t1, sub, t2, c_out);
    DFRL C (clk, reset, load, t2, pc);
endmodule

module program_counter_1 (
    input wire clk, reset, offset, inc, sub, load, c_in,
    output wire pc, c_out
);
    wire t1, t2, t3;
    NOT A (inc, t1);
    AND B (offset, t1, t2);
    adder_subtractor C (sub, pc, t2, c_in, t3, c_out);
    DFRL D (clk, reset, load, t3, pc);
endmodule

module program_counter (
    input wire clk, reset, inc, add, sub,
    input wire [15:0] offset,
    output wire [15:0] pc
);
    wire [15:0] c_out;
    wire load, t;
    OR A (inc, add, t);
    OR B (t, sub, load);
    program_counter_0 s00 (clk, reset, offset[00], inc, sub, load, pc[0], c_out[0]);
    program_counter_1 s01 (clk, reset, offset[01], inc, sub, load, c_out[00], pc[01], c_out[01]);
    program_counter_1 s02 (clk, reset, offset[02], inc, sub, load, c_out[01], pc[02], c_out[02]);
    program_counter_1 s03 (clk, reset, offset[03], inc, sub, load, c_out[02], pc[03], c_out[03]);
    program_counter_1 s04 (clk, reset, offset[04], inc, sub, load, c_out[03], pc[04], c_out[04]);
    program_counter_1 s05 (clk, reset, offset[05], inc, sub, load, c_out[04], pc[05], c_out[05]);
    program_counter_1 s06 (clk, reset, offset[06], inc, sub, load, c_out[05], pc[06], c_out[06]);
    program_counter_1 s07 (clk, reset, offset[07], inc, sub, load, c_out[06], pc[07], c_out[07]);
    program_counter_1 s08 (clk, reset, offset[08], inc, sub, load, c_out[07], pc[08], c_out[08]);
    program_counter_1 s09 (clk, reset, offset[09], inc, sub, load, c_out[08], pc[09], c_out[09]);
    program_counter_1 s10 (clk, reset, offset[10], inc, sub, load, c_out[09], pc[10], c_out[10]);
    program_counter_1 s11 (clk, reset, offset[11], inc, sub, load, c_out[10], pc[11], c_out[11]);
    program_counter_1 s12 (clk, reset, offset[12], inc, sub, load, c_out[11], pc[12], c_out[12]);
    program_counter_1 s13 (clk, reset, offset[13], inc, sub, load, c_out[12], pc[13], c_out[13]);
    program_counter_1 s14 (clk, reset, offset[14], inc, sub, load, c_out[13], pc[14], c_out[14]);
    program_counter_1 s15 (clk, reset, offset[15], inc, sub, load, c_out[14], pc[15], c_out[15]);
endmodule
