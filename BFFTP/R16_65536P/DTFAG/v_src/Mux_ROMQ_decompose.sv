`include "../v_include/define.svh"

module Mux_ROMQ_decompose (
    input [`doulbe_D_width-1:0] ROM_b0b1_Q  ,
    input [`doulbe_D_width-1:0] ROM_b2b3_Q  ,
    input [`doulbe_D_width-1:0] ROM_b4b5_Q  ,
    input [`doulbe_D_width-1:0] ROM_b6b7_Q  ,
    input [`doulbe_D_width-1:0] ROM_b8b9_Q  ,
    input [`doulbe_D_width-1:0] ROM_b10b11_Q,
    input [`doulbe_D_width-1:0] ROM_b12b13_Q,
    input [`doulbe_D_width-1:0] ROM_b14b15_Q,

    output logic [`D_width-1:0] ROM_b0_out  ,
    output logic [`D_width-1:0] ROM_b1_out  ,
    output logic [`D_width-1:0] ROM_b2_out  ,
    output logic [`D_width-1:0] ROM_b3_out  ,
    output logic [`D_width-1:0] ROM_b4_out  ,
    output logic [`D_width-1:0] ROM_b5_out  ,
    output logic [`D_width-1:0] ROM_b6_out  ,
    output logic [`D_width-1:0] ROM_b7_out  ,
    output logic [`D_width-1:0] ROM_b8_out  ,
    output logic [`D_width-1:0] ROM_b9_out  ,
    output logic [`D_width-1:0] ROM_b10_out ,
    output logic [`D_width-1:0] ROM_b11_out ,
    output logic [`D_width-1:0] ROM_b12_out ,
    output logic [`D_width-1:0] ROM_b13_out ,
    output logic [`D_width-1:0] ROM_b14_out ,
    output logic [`D_width-1:0] ROM_b15_out 
    
);

    always_comb begin : decompose_data_in
        ROM_b0_out  = ROM_b0b1_Q[`doulbe_D_width-1:`D_width];
        ROM_b1_out  = ROM_b0b1_Q[`D_width-1:0];
        ROM_b2_out  = ROM_b2b3_Q[`doulbe_D_width-1:`D_width];
        ROM_b3_out  = ROM_b2b3_Q[`D_width-1:0];
        ROM_b4_out  = ROM_b4b5_Q[`doulbe_D_width-1:`D_width];
        ROM_b5_out  = ROM_b4b5_Q[`D_width-1:0];
        ROM_b6_out  = ROM_b6b7_Q[`doulbe_D_width-1:`D_width];
        ROM_b7_out  = ROM_b6b7_Q[`D_width-1:0];
        ROM_b8_out  = ROM_b8b9_Q[`doulbe_D_width-1:`D_width];
        ROM_b9_out  = ROM_b8b9_Q[`D_width-1:0];
        ROM_b10_out = ROM_b10b11_Q[`doulbe_D_width-1:`D_width];
        ROM_b11_out = ROM_b10b11_Q[`D_width-1:0];
        ROM_b12_out = ROM_b12b13_Q[`doulbe_D_width-1:`D_width];
        ROM_b13_out = ROM_b12b13_Q[`D_width-1:0];
        ROM_b14_out = ROM_b14b15_Q[`doulbe_D_width-1:`D_width];
        ROM_b15_out = ROM_b14b15_Q[`D_width-1:0];
    end
    
endmodule