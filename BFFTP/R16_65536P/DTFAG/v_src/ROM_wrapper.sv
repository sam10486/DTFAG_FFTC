`include "../v_include/define.svh"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B0_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B1_64_128.v"

`include "../ROM_DATA/ROM1/ROM1_v/ROM1_B0_64_128.v"
`include "../ROM_DATA/ROM1/ROM1_v/ROM1_B1_64_128.v"

`include "../ROM_DATA/ROM2/ROM2_v/ROM2_B0_64_128.v"
`include "../ROM_DATA/ROM2/ROM2_v/ROM2_B1_64_128.v"

`include "Mux_ROMQ_decompose.sv"


module ROM_wrapper (
    input clk,
    input rst,
    input ROM_CEN,
    input [`radix_width-1:0] MA0,
    input [`radix_width-1:0] MA1,
    input [`radix_width-1:0] MA2,
    // ROM0 Data out
    output logic [`D_width-1:0] ROM0_b0_out  ,
    output logic [`D_width-1:0] ROM0_b1_out  ,
    output logic [`D_width-1:0] ROM0_b2_out  ,
    output logic [`D_width-1:0] ROM0_b3_out  ,
    output logic [`D_width-1:0] ROM0_b4_out  ,
    output logic [`D_width-1:0] ROM0_b5_out  ,
    output logic [`D_width-1:0] ROM0_b6_out  ,
    output logic [`D_width-1:0] ROM0_b7_out  ,
    output logic [`D_width-1:0] ROM0_b8_out  ,
    output logic [`D_width-1:0] ROM0_b9_out  ,
    output logic [`D_width-1:0] ROM0_b10_out ,
    output logic [`D_width-1:0] ROM0_b11_out ,
    output logic [`D_width-1:0] ROM0_b12_out ,
    output logic [`D_width-1:0] ROM0_b13_out ,
    output logic [`D_width-1:0] ROM0_b14_out ,
    output logic [`D_width-1:0] ROM0_b15_out ,
    // ROM1 Data out
    output logic [`D_width-1:0] ROM1_b0_out  ,
    output logic [`D_width-1:0] ROM1_b1_out  ,
    output logic [`D_width-1:0] ROM1_b2_out  ,
    output logic [`D_width-1:0] ROM1_b3_out  ,
    output logic [`D_width-1:0] ROM1_b4_out  ,
    output logic [`D_width-1:0] ROM1_b5_out  ,
    output logic [`D_width-1:0] ROM1_b6_out  ,
    output logic [`D_width-1:0] ROM1_b7_out  ,
    output logic [`D_width-1:0] ROM1_b8_out  ,
    output logic [`D_width-1:0] ROM1_b9_out  ,
    output logic [`D_width-1:0] ROM1_b10_out ,
    output logic [`D_width-1:0] ROM1_b11_out ,
    output logic [`D_width-1:0] ROM1_b12_out ,
    output logic [`D_width-1:0] ROM1_b13_out ,
    output logic [`D_width-1:0] ROM1_b14_out ,
    output logic [`D_width-1:0] ROM1_b15_out ,
    // ROM2 Data out
    output logic [`D_width-1:0] ROM2_b0_out  ,
    output logic [`D_width-1:0] ROM2_b1_out  ,
    output logic [`D_width-1:0] ROM2_b2_out  ,
    output logic [`D_width-1:0] ROM2_b3_out  ,
    output logic [`D_width-1:0] ROM2_b4_out  ,
    output logic [`D_width-1:0] ROM2_b5_out  ,
    output logic [`D_width-1:0] ROM2_b6_out  ,
    output logic [`D_width-1:0] ROM2_b7_out  ,
    output logic [`D_width-1:0] ROM2_b8_out  ,
    output logic [`D_width-1:0] ROM2_b9_out  ,
    output logic [`D_width-1:0] ROM2_b10_out ,
    output logic [`D_width-1:0] ROM2_b11_out ,
    output logic [`D_width-1:0] ROM2_b12_out ,
    output logic [`D_width-1:0] ROM2_b13_out ,
    output logic [`D_width-1:0] ROM2_b14_out ,
    output logic [`D_width-1:0] ROM2_b15_out 
);

    logic [1:0] cnt_MA;
    logic [1:0] cnt_Q;

    logic [`ROMA_width-1:0] MA0_delay[0:3];
    logic [`ROMA_width-1:0] MA1_delay[0:3];
    logic [`ROMA_width-1:0] MA2_delay[0:3];
    logic [`ROMA_width-1:0] MA0_b0b3;
    logic [`ROMA_width-1:0] MA0_b4b7;
    logic [`ROMA_width-1:0] MA0_b8b11;
    logic [`ROMA_width-1:0] MA0_b12b15;
    logic [`ROMA_width-1:0] MA1_b0b3;
    logic [`ROMA_width-1:0] MA1_b4b7;
    logic [`ROMA_width-1:0] MA1_b8b11;
    logic [`ROMA_width-1:0] MA1_b12b15;
    logic [`ROMA_width-1:0] MA2_b0b3;
    logic [`ROMA_width-1:0] MA2_b4b7;
    logic [`ROMA_width-1:0] MA2_b8b11;
    logic [`ROMA_width-1:0] MA2_b12b15;
    logic [`ROMA_width-1:0] ROM0_addr_in;
    logic [`ROMA_width-1:0] ROM1_addr_in;
    logic [`ROMA_width-1:0] ROM2_addr_in;

    logic [`doulbe_D_width-1:0] ROM0_B0_Q;
    logic [`doulbe_D_width-1:0] ROM0_B1_Q;
    logic [`doulbe_D_width-1:0] ROM1_B0_Q;
    logic [`doulbe_D_width-1:0] ROM1_B1_Q;
    logic [`doulbe_D_width-1:0] ROM2_B0_Q;
    logic [`doulbe_D_width-1:0] ROM2_B1_Q;
    logic [`doulbe_D_width-1:0] ROM0_B0_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM0_B1_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM1_B0_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM1_B1_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM2_B0_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM2_B1_Q_delay[0:3];
    logic [`doulbe_D_width-1:0] ROM0_b0b1_Q     ;
    logic [`doulbe_D_width-1:0] ROM0_b2b3_Q     ;
    logic [`doulbe_D_width-1:0] ROM0_b4b5_Q     ;
    logic [`doulbe_D_width-1:0] ROM0_b6b7_Q     ;
    logic [`doulbe_D_width-1:0] ROM0_b8b9_Q     ;
    logic [`doulbe_D_width-1:0] ROM0_b10b11_Q   ;
    logic [`doulbe_D_width-1:0] ROM0_b12b13_Q   ;
    logic [`doulbe_D_width-1:0] ROM0_b14b15_Q   ;
    logic [`doulbe_D_width-1:0] ROM1_b0b1_Q     ;
    logic [`doulbe_D_width-1:0] ROM1_b2b3_Q     ;
    logic [`doulbe_D_width-1:0] ROM1_b4b5_Q     ;
    logic [`doulbe_D_width-1:0] ROM1_b6b7_Q     ;
    logic [`doulbe_D_width-1:0] ROM1_b8b9_Q     ;
    logic [`doulbe_D_width-1:0] ROM1_b10b11_Q   ;
    logic [`doulbe_D_width-1:0] ROM1_b12b13_Q   ;
    logic [`doulbe_D_width-1:0] ROM1_b14b15_Q   ;
    logic [`doulbe_D_width-1:0] ROM2_b0b1_Q     ;
    logic [`doulbe_D_width-1:0] ROM2_b2b3_Q     ;
    logic [`doulbe_D_width-1:0] ROM2_b4b5_Q     ;
    logic [`doulbe_D_width-1:0] ROM2_b6b7_Q     ;
    logic [`doulbe_D_width-1:0] ROM2_b8b9_Q     ;
    logic [`doulbe_D_width-1:0] ROM2_b10b11_Q   ;
    logic [`doulbe_D_width-1:0] ROM2_b12b13_Q   ;
    logic [`doulbe_D_width-1:0] ROM2_b14b15_Q   ;

    assign MA0_delay[0] = MA0;
    assign MA1_delay[0] = MA1;
    assign MA2_delay[0] = MA2;
    
    always_ff @( posedge clk or posedge rst ) begin : MA_delay_4_clk
        integer i;
        if (rst) begin
            for (i = 0; i < 3 ; i = i + 1) begin
                MA0_delay[i+1] <= 6'd0;
                MA1_delay[i+1] <= 6'd0;
                MA2_delay[i+1] <= 6'd0;
                cnt_MA <= 2'd0;
            end
        end else begin
            for (i = 0; i < 3; i = i + 1 ) begin
                MA0_delay[i+1] <= MA0_delay[i];
                MA1_delay[i+1] <= MA1_delay[i];
                MA2_delay[i+1] <= MA2_delay[i];
                if (cnt_MA == 2'd3) begin
                    cnt_MA <= 2'd0;
                end begin
                    cnt_MA <= cnt_MA + 2'd1;
                end
            end
        end
    end

    assign MA0_b0b3 = {2'b00, MA0_delay[0]};
    assign MA0_b4b7 = {2'b01, MA0_delay[1]};
    assign MA0_b8b11 = {2'b10, MA0_delay[2]};
    assign MA0_b12b15 = {2'b11, MA0_delay[3]};

    assign MA1_b0b3 = {2'b00, MA1_delay[0]};
    assign MA1_b4b7 = {2'b01, MA1_delay[1]};
    assign MA1_b8b11 = {2'b10, MA1_delay[2]};
    assign MA1_b12b15 = {2'b11, MA1_delay[3]};

    assign MA2_b0b3 = {2'b00, MA2_delay[0]};
    assign MA2_b4b7 = {2'b01, MA2_delay[1]};
    assign MA2_b8b11 = {2'b10, MA2_delay[2]};
    assign MA2_b12b15 = {2'b11, MA2_delay[3]};

    always_comb begin : ROM_addr_sel
        case (cnt_MA)
            2'd0: begin
                ROM0_addr_in = MA0_b0b3;
                ROM1_addr_in = MA1_b0b3;
                ROM2_addr_in = MA2_b0b3;
            end
            2'd1: begin
                ROM0_addr_in = MA0_b4b7;
                ROM1_addr_in = MA1_b4b7;
                ROM2_addr_in = MA2_b4b7;
            end
            2'd2: begin
                ROM0_addr_in = MA0_b8b11;
                ROM1_addr_in = MA1_b8b11;
                ROM2_addr_in = MA2_b8b11;
            end
            2'd3: begin
                ROM0_addr_in = MA0_b12b15;
                ROM1_addr_in = MA1_b12b15;
                ROM2_addr_in = MA2_b12b15;
            end  
        endcase
    end


    assign ROM0_B0_Q_delay[0] = ROM0_B0_Q;
    assign ROM0_B1_Q_delay[0] = ROM0_B1_Q;
    assign ROM1_B0_Q_delay[0] = ROM1_B0_Q;
    assign ROM1_B1_Q_delay[0] = ROM1_B1_Q;
    assign ROM2_B0_Q_delay[0] = ROM2_B0_Q;
    assign ROM2_B1_Q_delay[0] = ROM2_B1_Q;
    always_ff @( posedge clk or posedge rst ) begin : ROM_D_out_buf
        integer i;
        if (rst) begin
            for (i = 0; i < 3; i = i + 1) begin
                ROM0_B0_Q_delay[i+1] <= 128'd0;
                ROM0_B1_Q_delay[i+1] <= 128'd0;
                ROM1_B0_Q_delay[i+1] <= 128'd0;
                ROM1_B1_Q_delay[i+1] <= 128'd0;
                ROM2_B0_Q_delay[i+1] <= 128'd0;
                ROM2_B1_Q_delay[i+1] <= 128'd0;
            end
            cnt_Q <= 2'd0;
        end else begin
            for (i = 0; i < 3 ; i = i + 1) begin
                ROM0_B0_Q_delay[i+1] <= ROM0_B0_Q_delay[i];
                ROM0_B1_Q_delay[i+1] <= ROM0_B1_Q_delay[i];
                ROM1_B0_Q_delay[i+1] <= ROM1_B0_Q_delay[i];
                ROM1_B1_Q_delay[i+1] <= ROM1_B1_Q_delay[i];
                ROM2_B0_Q_delay[i+1] <= ROM2_B0_Q_delay[i];
                ROM2_B1_Q_delay[i+1] <= ROM2_B1_Q_delay[i];
            end
            if (cnt_Q == 2'd3) begin
                cnt_Q <= 2'd0;
            end else begin
                cnt_Q <= cnt_Q + 2'd1;
            end
        end
    end

    always_comb begin : ROM_D_out
        if (cnt_Q == 2'd3) begin
            ROM0_b0b1_Q     = ROM0_B0_Q_delay[3];
            ROM0_b2b3_Q     = ROM0_B1_Q_delay[3];
            ROM0_b4b5_Q     = ROM0_B0_Q_delay[2];
            ROM0_b6b7_Q     = ROM0_B1_Q_delay[2];
            ROM0_b8b9_Q     = ROM0_B0_Q_delay[1];
            ROM0_b10b11_Q   = ROM0_B1_Q_delay[1];
            ROM0_b12b13_Q   = ROM0_B0_Q_delay[0];
            ROM0_b14b15_Q   = ROM0_B1_Q_delay[0];

            ROM1_b0b1_Q     = ROM1_B0_Q_delay[3];
            ROM1_b2b3_Q     = ROM1_B1_Q_delay[3];
            ROM1_b4b5_Q     = ROM1_B0_Q_delay[2];
            ROM1_b6b7_Q     = ROM1_B1_Q_delay[2];
            ROM1_b8b9_Q     = ROM1_B0_Q_delay[1];
            ROM1_b10b11_Q   = ROM1_B1_Q_delay[1];
            ROM1_b12b13_Q   = ROM1_B0_Q_delay[0];
            ROM1_b14b15_Q   = ROM1_B1_Q_delay[0];

            ROM2_b0b1_Q     = ROM2_B0_Q_delay[3];
            ROM2_b2b3_Q     = ROM2_B1_Q_delay[3];
            ROM2_b4b5_Q     = ROM2_B0_Q_delay[2];
            ROM2_b6b7_Q     = ROM2_B1_Q_delay[2];
            ROM2_b8b9_Q     = ROM2_B0_Q_delay[1];
            ROM2_b10b11_Q   = ROM2_B1_Q_delay[1];
            ROM2_b12b13_Q   = ROM2_B0_Q_delay[0];
            ROM2_b14b15_Q   = ROM2_B1_Q_delay[0];
        end else begin
            ROM0_b0b1_Q     = 128'd0;
            ROM0_b2b3_Q     = 128'd0;
            ROM0_b4b5_Q     = 128'd0;
            ROM0_b6b7_Q     = 128'd0;
            ROM0_b8b9_Q     = 128'd0;
            ROM0_b10b11_Q   = 128'd0;
            ROM0_b12b13_Q   = 128'd0;
            ROM0_b14b15_Q   = 128'd0;

            ROM1_b0b1_Q     = 128'd0;
            ROM1_b2b3_Q     = 128'd0;
            ROM1_b4b5_Q     = 128'd0;
            ROM1_b6b7_Q     = 128'd0;
            ROM1_b8b9_Q     = 128'd0;
            ROM1_b10b11_Q   = 128'd0;
            ROM1_b12b13_Q   = 128'd0;
            ROM1_b14b15_Q   = 128'd0;

            ROM2_b0b1_Q     = 128'd0;
            ROM2_b2b3_Q     = 128'd0;
            ROM2_b4b5_Q     = 128'd0;
            ROM2_b6b7_Q     = 128'd0;
            ROM2_b8b9_Q     = 128'd0;
            ROM2_b10b11_Q   = 128'd0;
            ROM2_b12b13_Q   = 128'd0;
            ROM2_b14b15_Q   = 128'd0;
        end
    end


    Mux_ROMQ_decompose ROM0_decompose(
        // input
        .ROM_b0b1_Q     (ROM0_b0b1_Q  ),
        .ROM_b2b3_Q     (ROM0_b2b3_Q  ),
        .ROM_b4b5_Q     (ROM0_b4b5_Q  ),
        .ROM_b6b7_Q     (ROM0_b6b7_Q  ),
        .ROM_b8b9_Q     (ROM0_b8b9_Q  ),
        .ROM_b10b11_Q   (ROM0_b10b11_Q),
        .ROM_b12b13_Q   (ROM0_b12b13_Q),
        .ROM_b14b15_Q   (ROM0_b14b15_Q),
        // output
        .ROM_b0_out     (ROM0_b0_out ),
        .ROM_b1_out     (ROM0_b1_out ),
        .ROM_b2_out     (ROM0_b2_out ),
        .ROM_b3_out     (ROM0_b3_out ),
        .ROM_b4_out     (ROM0_b4_out ),
        .ROM_b5_out     (ROM0_b5_out ),
        .ROM_b6_out     (ROM0_b6_out ),
        .ROM_b7_out     (ROM0_b7_out ),
        .ROM_b8_out     (ROM0_b8_out ),
        .ROM_b9_out     (ROM0_b9_out ),
        .ROM_b10_out    (ROM0_b10_out),
        .ROM_b11_out    (ROM0_b11_out),
        .ROM_b12_out    (ROM0_b12_out),
        .ROM_b13_out    (ROM0_b13_out),
        .ROM_b14_out    (ROM0_b14_out),
        .ROM_b15_out    (ROM0_b15_out)
    );

    Mux_ROMQ_decompose ROM1_decompose(
        // input
        .ROM_b0b1_Q     (ROM1_b0b1_Q  ),
        .ROM_b2b3_Q     (ROM1_b2b3_Q  ),
        .ROM_b4b5_Q     (ROM1_b4b5_Q  ),
        .ROM_b6b7_Q     (ROM1_b6b7_Q  ),
        .ROM_b8b9_Q     (ROM1_b8b9_Q  ),
        .ROM_b10b11_Q   (ROM1_b10b11_Q),
        .ROM_b12b13_Q   (ROM1_b12b13_Q),
        .ROM_b14b15_Q   (ROM1_b14b15_Q),
        // output
        .ROM_b0_out     (ROM1_b0_out ),
        .ROM_b1_out     (ROM1_b1_out ),
        .ROM_b2_out     (ROM1_b2_out ),
        .ROM_b3_out     (ROM1_b3_out ),
        .ROM_b4_out     (ROM1_b4_out ),
        .ROM_b5_out     (ROM1_b5_out ),
        .ROM_b6_out     (ROM1_b6_out ),
        .ROM_b7_out     (ROM1_b7_out ),
        .ROM_b8_out     (ROM1_b8_out ),
        .ROM_b9_out     (ROM1_b9_out ),
        .ROM_b10_out    (ROM1_b10_out),
        .ROM_b11_out    (ROM1_b11_out),
        .ROM_b12_out    (ROM1_b12_out),
        .ROM_b13_out    (ROM1_b13_out),
        .ROM_b14_out    (ROM1_b14_out),
        .ROM_b15_out    (ROM1_b15_out)
    );

    Mux_ROMQ_decompose ROM2_decompose(
        // input
        .ROM_b0b1_Q     (ROM2_b0b1_Q  ),
        .ROM_b2b3_Q     (ROM2_b2b3_Q  ),
        .ROM_b4b5_Q     (ROM2_b4b5_Q  ),
        .ROM_b6b7_Q     (ROM2_b6b7_Q  ),
        .ROM_b8b9_Q     (ROM2_b8b9_Q  ),
        .ROM_b10b11_Q   (ROM2_b10b11_Q),
        .ROM_b12b13_Q   (ROM2_b12b13_Q),
        .ROM_b14b15_Q   (ROM2_b14b15_Q),
        // output
        .ROM_b0_out     (ROM2_b0_out ),
        .ROM_b1_out     (ROM2_b1_out ),
        .ROM_b2_out     (ROM2_b2_out ),
        .ROM_b3_out     (ROM2_b3_out ),
        .ROM_b4_out     (ROM2_b4_out ),
        .ROM_b5_out     (ROM2_b5_out ),
        .ROM_b6_out     (ROM2_b6_out ),
        .ROM_b7_out     (ROM2_b7_out ),
        .ROM_b8_out     (ROM2_b8_out ),
        .ROM_b9_out     (ROM2_b9_out ),
        .ROM_b10_out    (ROM2_b10_out),
        .ROM_b11_out    (ROM2_b11_out),
        .ROM_b12_out    (ROM2_b12_out),
        .ROM_b13_out    (ROM2_b13_out),
        .ROM_b14_out    (ROM2_b14_out),
        .ROM_b15_out    (ROM2_b15_out)
    );

    // ROM0
    ROM0_B0_64_128 ROM0_B0(
        .Q       (ROM0_B0_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM0_addr_in)
    );

    ROM0_B1_64_128 ROM0_B1(
        .Q       (ROM0_B1_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM0_addr_in)
    );

    // ROM1
    ROM1_B0_64_128 ROM1_B0(
        .Q       (ROM1_B0_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM1_addr_in)
    );

    ROM1_B1_64_128 ROM1_B1(
        .Q       (ROM1_B1_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM1_addr_in)
    );

    // ROM2
    ROM2_B0_64_128 ROM2_B0(
        .Q       (ROM2_B0_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM2_addr_in)
    );

    ROM2_B1_64_128 ROM2_B1(
        .Q       (ROM2_B1_Q),
        .CLK     (clk),
        .CEN     (ROM_CEN),
        .A       (ROM2_addr_in)
    );
    

endmodule