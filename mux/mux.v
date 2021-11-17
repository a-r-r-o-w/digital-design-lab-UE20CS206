module two_to_one_mux (
    input wire a,
    input wire b,
    input wire s,
    output wire y
);
    assign y = s ? b : a;
endmodule

module four_to_one_mux (
    input wire [3:0] i,
    input wire [1:0] s,
    output wire y
);
    wire [1:0] r;
    two_to_one_mux m1 (i[0], i[1], s[0], r[0]);
    two_to_one_mux m2 (i[2], i[3], s[0], r[1]);
    two_to_one_mux m3 (r[0], r[1], s[1], y);
endmodule
