`include "../v_include/define.svh"

module Mux_ROMQ_decompose (
    input [`doulbe_D_width-1:0] ROM_B0_D_in  ,
    input [`doulbe_D_width-1:0] ROM_B1_D_in  ,

    output logic [`D_width-1:0] ROM_B0_HA_out  ,
    output logic [`D_width-1:0] ROM_B0_LA_out  ,
    output logic [`D_width-1:0] ROM_B1_HA_out  ,
    output logic [`D_width-1:0] ROM_B1_LA_out  
);

    always_comb begin : decompose_data_in
        ROM_B0_HA_out  = ROM_B0_D_in[`doulbe_D_width-1:`D_width];
        ROM_B0_LA_out  = ROM_B0_D_in[`D_width-1:0];
        ROM_B1_HA_out  = ROM_B1_D_in[`doulbe_D_width-1:`D_width];
        ROM_B1_LA_out  = ROM_B1_D_in[`D_width-1:0];
    end
    
endmodule