`include "../v_include/define.svh"
`include "DTFAG_AGU.sv"
`include "ROM_wrapper.sv"


module DTFAG_top (
    input clk,
    input rst_n,
    input ROM_CEN,
    input [`radix_width-1:0] DTFAG_j,
    input [`radix_width-1:0] DTFAG_t,
    input [`radix_width-1:0] DTFAG_i
);

    logic ROM_CEN_AGU;
    logic [`radix_width-1:0] MA0;
    logic [`radix_width-1:0] MA1;
    logic [`radix_width-1:0] MA2;

    logic [`D_width-1:0] ROM0_B0_HA_out    ;
    logic [`D_width-1:0] ROM0_B0_LA_out    ;
    logic [`D_width-1:0] ROM0_B1_HA_out    ;
    logic [`D_width-1:0] ROM0_B1_LA_out    ;
    
    logic [`D_width-1:0] ROM1_B0_HA_out    ;
    logic [`D_width-1:0] ROM1_B0_LA_out    ;
    logic [`D_width-1:0] ROM1_B1_HA_out    ;
    logic [`D_width-1:0] ROM1_B1_LA_out    ;

    logic [`D_width-1:0] ROM2_B0_HA_out    ;
    logic [`D_width-1:0] ROM2_B0_LA_out    ;
    logic [`D_width-1:0] ROM2_B1_HA_out    ;
    logic [`D_width-1:0] ROM2_B1_LA_out    ;


    DTFAG_AGU DTFAG_AGU(
        // input
        .clk        (clk    ),
        .rst_n      (rst_n    ),
        .ROM_CEN_in (ROM_CEN),
        .DTFAG_i    (DTFAG_i),
        .DTFAG_t    (DTFAG_t),
        .DTFAG_j    (DTFAG_j),
        // output
        .MA0        (MA0        ),
        .MA1        (MA1        ),
        .MA2        (MA2        ),
        .ROM_CEN_out(ROM_CEN_AGU)
    );

    ROM_wrapper ROM_wrapper(
        .clk            (clk        ),
        .rst_n          (rst_n        ),
        .ROM_CEN        (ROM_CEN_AGU),
        .MA0            (MA0        ),
        .MA1            (MA1        ),
        .MA2            (MA2        ),
        // ROM0 Data out
        .ROM0_B0_HA_out  (ROM0_B0_HA_out ),
        .ROM0_B0_LA_out  (ROM0_B0_LA_out ),
        .ROM0_B1_HA_out  (ROM0_B1_HA_out ),
        .ROM0_B1_LA_out  (ROM0_B1_LA_out ),
  
        // ROM1 Data out
        .ROM1_B0_HA_out  (ROM1_B0_HA_out ),
        .ROM1_B0_LA_out  (ROM1_B0_LA_out ),
        .ROM1_B1_HA_out  (ROM1_B1_HA_out ),
        .ROM1_B1_LA_out  (ROM1_B1_LA_out ),

        // ROM2 Data out
        .ROM2_B0_HA_out  (ROM2_B0_HA_out ),
        .ROM2_B0_LA_out  (ROM2_B0_LA_out ),
        .ROM2_B1_HA_out  (ROM2_B1_HA_out ),
        .ROM2_B1_LA_out  (ROM2_B1_LA_out )

    );
endmodule