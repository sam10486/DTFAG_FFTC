`include "../v_include/define.svh"

module DTFAG_AGU (
    input clk,
    input rst,
    input logic [`radix_width-1:0] DTFAG_i,
    input logic [`radix_width-1:0] DTFAG_t,
    input logic [`radix_width-1:0] DTFAG_j,

    output logic [`radix_width-1:0] MA0,
    output logic [`radix_width-1:0] MA1,
    output logic [`radix_width-1:0] MA2,
    output logic [`radix_width-1:0] MA3
);

    logic xor_i0_wire, xor_i1_wire, xor_i2_wire;
    logic xor_t0_wire, xor_t1_wire, xor_t2_wire;
    logic xor_not_t0_wire, xor_not_t1_wire, xor_not_t2_wire;

    logic [`radix_width-1:0] DTFAG_not_t;
    logic [`radix_width-1:0] Gray_i, Gray_t, Gray_not_t;

    assign MA0 = DTFAG_j;
    // for Gray code G(i)
    assign xor_i0_wire = DTFAG_i[3]^DTFAG_i[2];
    assign xor_i1_wire = DTFAG_i[2]^DTFAG_i[1];
    assign xor_i2_wire = DTFAG_i[1]^DTFAG_i[0];
    assign Gray_i = {DTFAG_i[3], xor_i0_wire, xor_i1_wire, xor_i2_wire};
    assign MA1 = Gray_i;
    
    // for Gray code G(t) and G(~t)
    assign DTFAG_not_t = ~DTFAG_t;
    assign xor_t0_wire = DTFAG_t[3]^DTFAG_t[2];
    assign xor_t1_wire = DTFAG_t[2]^DTFAG_t[1];
    assign xor_t2_wire = DTFAG_t[1]^DTFAG_t[0];
    assign Gray_t = {DTFAG_t[3], xor_t0_wire, xor_t1_wire, xor_t2_wire};
    
    assign xor_not_t0_wire = DTFAG_not_t[3]^DTFAG_not_t[2];
    assign xor_not_t1_wire = DTFAG_not_t[2]^DTFAG_not_t[1];
    assign xor_not_t2_wire = DTFAG_not_t[1]^DTFAG_not_t[0];
    assign Gray_not_t = {DTFAG_not_t[3], xor_not_t0_wire, xor_not_t1_wire, xor_not_t2_wire};
    assign MA2 = (DTFAG_i[0] == 1'd1) ? Gray_not_t : Gray_t;

    assign MA3 = DTFAG_j;


endmodule