`include "../v_include/define.v"

module DTFAG_top (
    input clk,
    input rst_n,
    input ROM_CEN,
    input [`radix_width-1:0] DTFAG_j,
    input [`radix_width-1:0] DTFAG_t,
    input [`radix_width-1:0] DTFAG_i,
    input [`D_width-1:0] N_in

);

    wire ROM_CEN_AGU;
    wire [`radix_width-1:0] MA0;
    wire [`radix_width-1:0] MA1;
    wire [`radix_width-1:0] MA2;

    
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


    wire [`D_width-1:0]    Process2_out0     ;
    wire [`D_width-1:0]    Process2_out1     ;
    wire [`D_width-1:0]    Process2_out2     ;
    wire [`D_width-1:0]    Process2_out3     ;
    wire [`D_width-1:0]    Process2_out4     ;
    wire [`D_width-1:0]    Process2_out5     ;
    wire [`D_width-1:0]    Process2_out6     ;
    wire [`D_width-1:0]    Process2_out7     ;
    wire [`D_width-1:0]    Process2_out8     ;
    wire [`D_width-1:0]    Process2_out9     ;
    wire [`D_width-1:0]    Process2_out10    ;
    wire [`D_width-1:0]    Process2_out11    ;
    wire [`D_width-1:0]    Process2_out12    ;
    wire [`D_width-1:0]    Process2_out13    ;
    wire [`D_width-1:0]    Process2_out14    ;
    wire [`D_width-1:0]    Process2_out15    ;

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
    



    DTFAG_Mul_process DTFAG_Mul_process(
        // input
        .clk       (clk),
        .rst_n     (rst_n),
        // ROM
        .ROM0_in0  (ROM0_b0 ),
        .ROM0_in1  (ROM0_b1 ),
        .ROM0_in2  (ROM0_b2 ),
        .ROM0_in3  (ROM0_b3 ),
        .ROM0_in4  (ROM0_b4 ),
        .ROM0_in5  (ROM0_b5 ),
        .ROM0_in6  (ROM0_b6 ),
        .ROM0_in7  (ROM0_b7 ),
        .ROM0_in8  (ROM0_b8 ),
        .ROM0_in9  (ROM0_b9 ),
        .ROM0_in10 (ROM0_b10),
        .ROM0_in11 (ROM0_b11),
        .ROM0_in12 (ROM0_b12),
        .ROM0_in13 (ROM0_b13),
        .ROM0_in14 (ROM0_b14),
        .ROM0_in15 (ROM0_b15),
        .ROM1_in0  (ROM1_b0 ),
        .ROM1_in1  (ROM1_b1 ),
        .ROM1_in2  (ROM1_b2 ),
        .ROM1_in3  (ROM1_b3 ),
        .ROM1_in4  (ROM1_b4 ),
        .ROM1_in5  (ROM1_b5 ),
        .ROM1_in6  (ROM1_b6 ),
        .ROM1_in7  (ROM1_b7 ),
        .ROM1_in8  (ROM1_b8 ),
        .ROM1_in9  (ROM1_b9 ),
        .ROM1_in10 (ROM1_b10),
        .ROM1_in11 (ROM1_b11),
        .ROM1_in12 (ROM1_b12),
        .ROM1_in13 (ROM1_b13),
        .ROM1_in14 (ROM1_b14),
        .ROM1_in15 (ROM1_b15),
        .ROM2_in0  (ROM2_b0 ),
        .ROM2_in1  (ROM2_b1 ),
        .ROM2_in2  (ROM2_b2 ),
        .ROM2_in3  (ROM2_b3 ),
        .ROM2_in4  (ROM2_b4 ),
        .ROM2_in5  (ROM2_b5 ),
        .ROM2_in6  (ROM2_b6 ),
        .ROM2_in7  (ROM2_b7 ),
        .ROM2_in8  (ROM2_b8 ),
        .ROM2_in9  (ROM2_b9 ),
        .ROM2_in10 (ROM2_b10),
        .ROM2_in11 (ROM2_b11),
        .ROM2_in12 (ROM2_b12),
        .ROM2_in13 (ROM2_b13),
        .ROM2_in14 (ROM2_b14),
        .ROM2_in15 (ROM2_b15),
        .N_in      (N_in),
        // output
        .Process2_out0     (Process2_out0 ),
        .Process2_out1     (Process2_out1 ),
        .Process2_out2     (Process2_out2 ),
        .Process2_out3     (Process2_out3 ),
        .Process2_out4     (Process2_out4 ),
        .Process2_out5     (Process2_out5 ),
        .Process2_out6     (Process2_out6 ),
        .Process2_out7     (Process2_out7 ),
        .Process2_out8     (Process2_out8 ),
        .Process2_out9     (Process2_out9 ),
        .Process2_out10    (Process2_out10),
        .Process2_out11    (Process2_out11),
        .Process2_out12    (Process2_out12),
        .Process2_out13    (Process2_out13),
        .Process2_out14    (Process2_out14),
        .Process2_out15    (Process2_out15)
    );
endmodule