`include "../v_include/define.v"
`include "DTFAG_AGU.v"
`include "Memory_wrapper.v"


module DTFAG_top (
    input clk,
    input rst_n,
    input ROM_CEN,
    input [`radix_width-1:0] DTFAG_j,
    input [`radix_width-1:0] DTFAG_t,
    input [`radix_width-1:0] DTFAG_i,

    output wire [`D_width-1:0] ROM0_b0  ,
    output wire [`D_width-1:0] ROM0_b1  ,
    output wire [`D_width-1:0] ROM0_b2  ,
    output wire [`D_width-1:0] ROM0_b3  ,
    output wire [`D_width-1:0] ROM0_b4  ,
    output wire [`D_width-1:0] ROM0_b5  ,
    output wire [`D_width-1:0] ROM0_b6  ,
    output wire [`D_width-1:0] ROM0_b7  ,
    output wire [`D_width-1:0] ROM0_b8  ,
    output wire [`D_width-1:0] ROM0_b9  ,
    output wire [`D_width-1:0] ROM0_b10 ,
    output wire [`D_width-1:0] ROM0_b11 ,
    output wire [`D_width-1:0] ROM0_b12 ,
    output wire [`D_width-1:0] ROM0_b13 ,
    output wire [`D_width-1:0] ROM0_b14 ,
    output wire [`D_width-1:0] ROM0_b15 ,
    
    output wire [`D_width-1:0] ROM1_b0  ,
    output wire [`D_width-1:0] ROM1_b1  ,
    output wire [`D_width-1:0] ROM1_b2  ,
    output wire [`D_width-1:0] ROM1_b3  ,
    output wire [`D_width-1:0] ROM1_b4  ,
    output wire [`D_width-1:0] ROM1_b5  ,
    output wire [`D_width-1:0] ROM1_b6  ,
    output wire [`D_width-1:0] ROM1_b7  ,
    output wire [`D_width-1:0] ROM1_b8  ,
    output wire [`D_width-1:0] ROM1_b9  ,
    output wire [`D_width-1:0] ROM1_b10 ,
    output wire [`D_width-1:0] ROM1_b11 ,
    output wire [`D_width-1:0] ROM1_b12 ,
    output wire [`D_width-1:0] ROM1_b13 ,
    output wire [`D_width-1:0] ROM1_b14 ,
    output wire [`D_width-1:0] ROM1_b15 ,

    output wire [`D_width-1:0] ROM2_b0  ,
    output wire [`D_width-1:0] ROM2_b1  ,
    output wire [`D_width-1:0] ROM2_b2  ,
    output wire [`D_width-1:0] ROM2_b3  ,
    output wire [`D_width-1:0] ROM2_b4  ,
    output wire [`D_width-1:0] ROM2_b5  ,
    output wire [`D_width-1:0] ROM2_b6  ,
    output wire [`D_width-1:0] ROM2_b7  ,
    output wire [`D_width-1:0] ROM2_b8  ,
    output wire [`D_width-1:0] ROM2_b9  ,
    output wire [`D_width-1:0] ROM2_b10 ,
    output wire [`D_width-1:0] ROM2_b11 ,
    output wire [`D_width-1:0] ROM2_b12 ,
    output wire [`D_width-1:0] ROM2_b13 ,
    output wire [`D_width-1:0] ROM2_b14 ,
    output wire [`D_width-1:0] ROM2_b15 
);

    wire ROM_CEN_AGU;
    wire [`radix_width-1:0] MA0;
    wire [`radix_width-1:0] MA1;
    wire [`radix_width-1:0] MA2;
    /*
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
    */
    /*
    wire [`D_width-1:0]    ROM0_b0     ;
    wire [`D_width-1:0]    ROM0_b1     ;
    wire [`D_width-1:0]    ROM0_b2     ;
    wire [`D_width-1:0]    ROM0_b3     ;
    wire [`D_width-1:0]    ROM0_b4     ;
    wire [`D_width-1:0]    ROM0_b5     ;
    wire [`D_width-1:0]    ROM0_b6     ;
    wire [`D_width-1:0]    ROM0_b7     ;
    wire [`D_width-1:0]    ROM0_b8     ;
    wire [`D_width-1:0]    ROM0_b9     ;
    wire [`D_width-1:0]    ROM0_b10    ;
    wire [`D_width-1:0]    ROM0_b11    ;
    wire [`D_width-1:0]    ROM0_b12    ;
    wire [`D_width-1:0]    ROM0_b13    ;
    wire [`D_width-1:0]    ROM0_b14    ;
    wire [`D_width-1:0]    ROM0_b15    ;

    wire [`D_width-1:0]    ROM1_b0     ;
    wire [`D_width-1:0]    ROM1_b1     ;
    wire [`D_width-1:0]    ROM1_b2     ;
    wire [`D_width-1:0]    ROM1_b3     ;
    wire [`D_width-1:0]    ROM1_b4     ;
    wire [`D_width-1:0]    ROM1_b5     ;
    wire [`D_width-1:0]    ROM1_b6     ;
    wire [`D_width-1:0]    ROM1_b7     ;
    wire [`D_width-1:0]    ROM1_b8     ;
    wire [`D_width-1:0]    ROM1_b9     ;
    wire [`D_width-1:0]    ROM1_b10    ;
    wire [`D_width-1:0]    ROM1_b11    ;
    wire [`D_width-1:0]    ROM1_b12    ;
    wire [`D_width-1:0]    ROM1_b13    ;
    wire [`D_width-1:0]    ROM1_b14    ;
    wire [`D_width-1:0]    ROM1_b15    ;

    wire [`D_width-1:0]    ROM2_b0     ;
    wire [`D_width-1:0]    ROM2_b1     ;
    wire [`D_width-1:0]    ROM2_b2     ;
    wire [`D_width-1:0]    ROM2_b3     ;
    wire [`D_width-1:0]    ROM2_b4     ;
    wire [`D_width-1:0]    ROM2_b5     ;
    wire [`D_width-1:0]    ROM2_b6     ;
    wire [`D_width-1:0]    ROM2_b7     ;
    wire [`D_width-1:0]    ROM2_b8     ;
    wire [`D_width-1:0]    ROM2_b9     ;
    wire [`D_width-1:0]    ROM2_b10    ;
    wire [`D_width-1:0]    ROM2_b11    ;
    wire [`D_width-1:0]    ROM2_b12    ;
    wire [`D_width-1:0]    ROM2_b13    ;
    wire [`D_width-1:0]    ROM2_b14    ;
    wire [`D_width-1:0]    ROM2_b15    ;
*/
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
    /*
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

    );*/
    Memory_wrapper Memory_wrapper(
        .clk        (clk),
        .rst_n      (rst_n),
        .ROM_CEN    (ROM_CEN_AGU),
        .MA0        (MA0        ),
        .MA1        (MA1        ),
        .MA2        (MA2        ),
        // ROM0
        .ROM0_b0   (ROM0_b0 ),
        .ROM0_b1   (ROM0_b1 ),
        .ROM0_b2   (ROM0_b2 ),
        .ROM0_b3   (ROM0_b3 ),
        .ROM0_b4   (ROM0_b4 ),
        .ROM0_b5   (ROM0_b5 ),
        .ROM0_b6   (ROM0_b6 ),
        .ROM0_b7   (ROM0_b7 ),
        .ROM0_b8   (ROM0_b8 ),
        .ROM0_b9   (ROM0_b9 ),
        .ROM0_b10  (ROM0_b10),
        .ROM0_b11  (ROM0_b11),
        .ROM0_b12  (ROM0_b12),
        .ROM0_b13  (ROM0_b13),
        .ROM0_b14  (ROM0_b14),
        .ROM0_b15  (ROM0_b15),
        // ROM1
        .ROM1_b0   (ROM1_b0 ),
        .ROM1_b1   (ROM1_b1 ),
        .ROM1_b2   (ROM1_b2 ),
        .ROM1_b3   (ROM1_b3 ),
        .ROM1_b4   (ROM1_b4 ),
        .ROM1_b5   (ROM1_b5 ),
        .ROM1_b6   (ROM1_b6 ),
        .ROM1_b7   (ROM1_b7 ),
        .ROM1_b8   (ROM1_b8 ),
        .ROM1_b9   (ROM1_b9 ),
        .ROM1_b10  (ROM1_b10),
        .ROM1_b11  (ROM1_b11),
        .ROM1_b12  (ROM1_b12),
        .ROM1_b13  (ROM1_b13),
        .ROM1_b14  (ROM1_b14),
        .ROM1_b15  (ROM1_b15),
        // ROM2
        .ROM2_b0   (ROM2_b0 ),
        .ROM2_b1   (ROM2_b1 ),
        .ROM2_b2   (ROM2_b2 ),
        .ROM2_b3   (ROM2_b3 ),
        .ROM2_b4   (ROM2_b4 ),
        .ROM2_b5   (ROM2_b5 ),
        .ROM2_b6   (ROM2_b6 ),
        .ROM2_b7   (ROM2_b7 ),
        .ROM2_b8   (ROM2_b8 ),
        .ROM2_b9   (ROM2_b9 ),
        .ROM2_b10  (ROM2_b10),
        .ROM2_b11  (ROM2_b11),
        .ROM2_b12  (ROM2_b12),
        .ROM2_b13  (ROM2_b13),
        .ROM2_b14  (ROM2_b14),
        .ROM2_b15  (ROM2_b15)
    );
endmodule