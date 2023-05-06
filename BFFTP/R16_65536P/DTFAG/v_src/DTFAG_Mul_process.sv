`include "../v_include/define.v"
`include "./../../MulMod128.v"
module DTFAG_Mul_process (
    input clk,
    input rst_n,
    input [`D_width-1:0] D_in0,
    input [`D_width-1:0] D_in1,
    input [`D_width-1:0] D_in2,
    input [`D_width-1:0] D_in3,
    input [`D_width-1:0] ROM0_B0_HA_out,
    input [`D_width-1:0] ROM0_B0_LA_out,
    input [`D_width-1:0] ROM0_B1_HA_out,
    input [`D_width-1:0] ROM0_B1_LA_out,

);
    
    // Process 1
    MulMod128 u0_Mul(
        .S_out(), 
        .A_in(),       
        .B_in(),        
        .N_in(),         
        .rst_n(),            
        .clk(clk)                
    );

    always_ff @( posedge clk or posedge rst_n ) begin : pip0
        if (~rst_n) begin
            
        end else begin
            
        end
    end



endmodule