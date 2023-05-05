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
    input rst_n,
    input ROM_CEN,
    input [`radix_width-1:0] MA0,
    input [`radix_width-1:0] MA1,
    input [`radix_width-1:0] MA2,
    // ROM0 Data out
    output logic [`D_width-1:0] ROM0_B0_HA_out  ,
    output logic [`D_width-1:0] ROM0_B0_LA_out  ,
    output logic [`D_width-1:0] ROM0_B1_HA_out  ,
    output logic [`D_width-1:0] ROM0_B1_LA_out  ,

    // ROM1 Data out
    output logic [`D_width-1:0] ROM1_B0_HA_out  ,
    output logic [`D_width-1:0] ROM1_B0_LA_out  ,
    output logic [`D_width-1:0] ROM1_B1_HA_out  ,
    output logic [`D_width-1:0] ROM1_B1_LA_out  ,

    // ROM2 Data out
    output logic [`D_width-1:0] ROM2_B0_HA_out  ,
    output logic [`D_width-1:0] ROM2_B0_LA_out  ,
    output logic [`D_width-1:0] ROM2_B1_HA_out  ,
    output logic [`D_width-1:0] ROM2_B1_LA_out  

);

    logic [1:0] cnt_MA;
    logic [1:0] cnt_Q;

    logic [`radix_width-1:0] MA0_delay[0:3];
    logic [`radix_width-1:0] MA1_delay[0:3];
    logic [`radix_width-1:0] MA2_delay[0:3];
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

    assign MA0_delay[0] = MA0;
    assign MA1_delay[0] = MA1;
    assign MA2_delay[0] = MA2;
    
    always_ff @( posedge clk or posedge rst_n ) begin : MA_delay_4_clk
        integer i;
        if (~rst_n) begin
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
                    if (!ROM_CEN) begin
                        cnt_MA <= cnt_MA + 2'd1;
                    end else begin
                        cnt_MA <= 2'd0;
                    end
                    
                end
            end
        end
    end
    
    logic [`ROMA_width-1:0] test;
    always_ff @( posedge clk or posedge rst_n ) begin
        if (~rst_n) begin
            test <= 6'd0;
        end else begin
            if (cnt_MA == 2'd3) begin
                test <= MA0_delay[2];
            end else begin
                test <= test;
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


    Mux_ROMQ_decompose ROM0_decompose(
        // input
        .ROM_B0_D_in  (ROM0_B0_Q),
        .ROM_B1_D_in  (ROM0_B1_Q),
        // output
        .ROM_B0_HA_out  (ROM0_B0_HA_out),
        .ROM_B0_LA_out  (ROM0_B0_LA_out),
        .ROM_B1_HA_out  (ROM0_B1_HA_out),
        .ROM_B1_LA_out  (ROM0_B1_LA_out)
    );

    Mux_ROMQ_decompose ROM1_decompose(
        // input
        .ROM_B0_D_in  (ROM1_B0_Q),
        .ROM_B1_D_in  (ROM1_B1_Q),
        // output
        .ROM_B0_HA_out  (ROM1_B0_HA_out),
        .ROM_B0_LA_out  (ROM1_B0_LA_out),
        .ROM_B1_HA_out  (ROM1_B1_HA_out),
        .ROM_B1_LA_out  (ROM1_B1_LA_out)
    );

    Mux_ROMQ_decompose ROM2_decompose(
        // input
        .ROM_B0_D_in  (ROM2_B0_Q),
        .ROM_B1_D_in  (ROM2_B1_Q),
        // output
        .ROM_B0_HA_out  (ROM2_B0_HA_out),
        .ROM_B0_LA_out  (ROM2_B0_LA_out),
        .ROM_B1_HA_out  (ROM2_B1_HA_out),
        .ROM_B1_LA_out  (ROM2_B1_LA_out)
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