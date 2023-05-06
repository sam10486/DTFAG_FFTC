`include "../v_include/define.v"

module Register_file (
    input clk,
    input rst_n,
    input [`ROMA_width-1:0] MA0,
    input [`ROMA_width-1:0] MA1,
    input [`ROMA_width-1:0] MA2,
    input ROM_CEN,

    output reg [`D_width-1:0] ROM0_b0   ,
    output reg [`D_width-1:0] ROM0_b1   ,
    output reg [`D_width-1:0] ROM0_b2   ,
    output reg [`D_width-1:0] ROM0_b3   ,
    output reg [`D_width-1:0] ROM0_b4   ,
    output reg [`D_width-1:0] ROM0_b5   ,
    output reg [`D_width-1:0] ROM0_b6   ,
    output reg [`D_width-1:0] ROM0_b7   ,
    output reg [`D_width-1:0] ROM0_b8   ,
    output reg [`D_width-1:0] ROM0_b9   ,
    output reg [`D_width-1:0] ROM0_b10  ,
    output reg [`D_width-1:0] ROM0_b11  ,
    output reg [`D_width-1:0] ROM0_b12  ,
    output reg [`D_width-1:0] ROM0_b13  ,
    output reg [`D_width-1:0] ROM0_b14  ,
    output reg [`D_width-1:0] ROM0_b15  ,
    // ROM1
    output reg [`D_width-1:0] ROM1_b0   ,
    output reg [`D_width-1:0] ROM1_b1   ,
    output reg [`D_width-1:0] ROM1_b2   ,
    output reg [`D_width-1:0] ROM1_b3   ,
    output reg [`D_width-1:0] ROM1_b4   ,
    output reg [`D_width-1:0] ROM1_b5   ,
    output reg [`D_width-1:0] ROM1_b6   ,
    output reg [`D_width-1:0] ROM1_b7   ,
    output reg [`D_width-1:0] ROM1_b8   ,
    output reg [`D_width-1:0] ROM1_b9   ,
    output reg [`D_width-1:0] ROM1_b10  ,
    output reg [`D_width-1:0] ROM1_b11  ,
    output reg [`D_width-1:0] ROM1_b12  ,
    output reg [`D_width-1:0] ROM1_b13  ,
    output reg [`D_width-1:0] ROM1_b14  ,
    output reg [`D_width-1:0] ROM1_b15  ,
    // ROM2
    output reg [`D_width-1:0] ROM2_b0   ,
    output reg [`D_width-1:0] ROM2_b1   ,
    output reg [`D_width-1:0] ROM2_b2   ,
    output reg [`D_width-1:0] ROM2_b3   ,
    output reg [`D_width-1:0] ROM2_b4   ,
    output reg [`D_width-1:0] ROM2_b5   ,
    output reg [`D_width-1:0] ROM2_b6   ,
    output reg [`D_width-1:0] ROM2_b7   ,
    output reg [`D_width-1:0] ROM2_b8   ,
    output reg [`D_width-1:0] ROM2_b9   ,
    output reg [`D_width-1:0] ROM2_b10  ,
    output reg [`D_width-1:0] ROM2_b11  ,
    output reg [`D_width-1:0] ROM2_b12  ,
    output reg [`D_width-1:0] ROM2_b13  ,
    output reg [`D_width-1:0] ROM2_b14  ,
    output reg [`D_width-1:0] ROM2_b15  
);

    reg [`D_width-1:0] ROM0_arr [0:15][0:15];
    reg [`D_width-1:0] ROM1_arr [0:15][0:15];
    reg [`D_width-1:0] ROM2_arr [0:15][0:15];
    
    always@( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            // ROM0 init
            ROM0_arr[0][0] <= 64'd0;
            ROM0_arr[1][0] <= 64'd0;
            ROM0_arr[2][0] <= 64'd0;
            ROM0_arr[3][0] <= 64'd0;
            ROM0_arr[4][0] <= 64'd0;
            ROM0_arr[5][0] <= 64'd0;
            ROM0_arr[6][0] <= 64'd0;
            ROM0_arr[7][0] <= 64'd0;
            ROM0_arr[8][0] <= 64'd0;
            ROM0_arr[9][0] <= 64'd0;
            ROM0_arr[10][0] <= 64'd0;
            ROM0_arr[11][0] <= 64'd0;
            ROM0_arr[12][0] <= 64'd0;
            ROM0_arr[13][0] <= 64'd0;
            ROM0_arr[14][0] <= 64'd0;
            ROM0_arr[15][0] <= 64'd0;
            ROM0_arr[0][1] <= 64'd0;
            ROM0_arr[1][1] <= 64'd256;
            ROM0_arr[2][1] <= 64'd512;
            ROM0_arr[3][1] <= 64'd768;
            ROM0_arr[4][1] <= 64'd1024;
            ROM0_arr[5][1] <= 64'd1280;
            ROM0_arr[6][1] <= 64'd1536;
            ROM0_arr[7][1] <= 64'd1792;
            ROM0_arr[8][1] <= 64'd2048;
            ROM0_arr[9][1] <= 64'd2304;
            ROM0_arr[10][1] <= 64'd2560;
            ROM0_arr[11][1] <= 64'd2816;
            ROM0_arr[12][1] <= 64'd3072;
            ROM0_arr[13][1] <= 64'd3328;
            ROM0_arr[14][1] <= 64'd3584;
            ROM0_arr[15][1] <= 64'd3840;
            ROM0_arr[0][2] <= 64'd0;
            ROM0_arr[1][2] <= 64'd512;
            ROM0_arr[2][2] <= 64'd1024;
            ROM0_arr[3][2] <= 64'd1536;
            ROM0_arr[4][2] <= 64'd2048;
            ROM0_arr[5][2] <= 64'd2560;
            ROM0_arr[6][2] <= 64'd3072;
            ROM0_arr[7][2] <= 64'd3584;
            ROM0_arr[8][2] <= 64'd4096;
            ROM0_arr[9][2] <= 64'd4608;
            ROM0_arr[10][2] <= 64'd5120;
            ROM0_arr[11][2] <= 64'd5632;
            ROM0_arr[12][2] <= 64'd6144;
            ROM0_arr[13][2] <= 64'd6656;
            ROM0_arr[14][2] <= 64'd7168;
            ROM0_arr[15][2] <= 64'd7680;
            ROM0_arr[0][3] <= 64'd0;
            ROM0_arr[1][3] <= 64'd768;
            ROM0_arr[2][3] <= 64'd1536;
            ROM0_arr[3][3] <= 64'd2304;
            ROM0_arr[4][3] <= 64'd3072;
            ROM0_arr[5][3] <= 64'd3840;
            ROM0_arr[6][3] <= 64'd4608;
            ROM0_arr[7][3] <= 64'd5376;
            ROM0_arr[8][3] <= 64'd6144;
            ROM0_arr[9][3] <= 64'd6912;
            ROM0_arr[10][3] <= 64'd7680;
            ROM0_arr[11][3] <= 64'd8448;
            ROM0_arr[12][3] <= 64'd9216;
            ROM0_arr[13][3] <= 64'd9984;
            ROM0_arr[14][3] <= 64'd10752;
            ROM0_arr[15][3] <= 64'd11520;
            ROM0_arr[0][4] <= 64'd0;
            ROM0_arr[1][4] <= 64'd1024;
            ROM0_arr[2][4] <= 64'd2048;
            ROM0_arr[3][4] <= 64'd3072;
            ROM0_arr[4][4] <= 64'd4096;
            ROM0_arr[5][4] <= 64'd5120;
            ROM0_arr[6][4] <= 64'd6144;
            ROM0_arr[7][4] <= 64'd7168;
            ROM0_arr[8][4] <= 64'd8192;
            ROM0_arr[9][4] <= 64'd9216;
            ROM0_arr[10][4] <= 64'd10240;
            ROM0_arr[11][4] <= 64'd11264;
            ROM0_arr[12][4] <= 64'd12288;
            ROM0_arr[13][4] <= 64'd13312;
            ROM0_arr[14][4] <= 64'd14336;
            ROM0_arr[15][4] <= 64'd15360;
            ROM0_arr[0][5] <= 64'd0;
            ROM0_arr[1][5] <= 64'd1280;
            ROM0_arr[2][5] <= 64'd2560;
            ROM0_arr[3][5] <= 64'd3840;
            ROM0_arr[4][5] <= 64'd5120;
            ROM0_arr[5][5] <= 64'd6400;
            ROM0_arr[6][5] <= 64'd7680;
            ROM0_arr[7][5] <= 64'd8960;
            ROM0_arr[8][5] <= 64'd10240;
            ROM0_arr[9][5] <= 64'd11520;
            ROM0_arr[10][5] <= 64'd12800;
            ROM0_arr[11][5] <= 64'd14080;
            ROM0_arr[12][5] <= 64'd15360;
            ROM0_arr[13][5] <= 64'd16640;
            ROM0_arr[14][5] <= 64'd17920;
            ROM0_arr[15][5] <= 64'd19200;
            ROM0_arr[0][6] <= 64'd0;
            ROM0_arr[1][6] <= 64'd1536;
            ROM0_arr[2][6] <= 64'd3072;
            ROM0_arr[3][6] <= 64'd4608;
            ROM0_arr[4][6] <= 64'd6144;
            ROM0_arr[5][6] <= 64'd7680;
            ROM0_arr[6][6] <= 64'd9216;
            ROM0_arr[7][6] <= 64'd10752;
            ROM0_arr[8][6] <= 64'd12288;
            ROM0_arr[9][6] <= 64'd13824;
            ROM0_arr[10][6] <= 64'd15360;
            ROM0_arr[11][6] <= 64'd16896;
            ROM0_arr[12][6] <= 64'd18432;
            ROM0_arr[13][6] <= 64'd19968;
            ROM0_arr[14][6] <= 64'd21504;
            ROM0_arr[15][6] <= 64'd23040;
            ROM0_arr[0][7] <= 64'd0;
            ROM0_arr[1][7] <= 64'd1792;
            ROM0_arr[2][7] <= 64'd3584;
            ROM0_arr[3][7] <= 64'd5376;
            ROM0_arr[4][7] <= 64'd7168;
            ROM0_arr[5][7] <= 64'd8960;
            ROM0_arr[6][7] <= 64'd10752;
            ROM0_arr[7][7] <= 64'd12544;
            ROM0_arr[8][7] <= 64'd14336;
            ROM0_arr[9][7] <= 64'd16128;
            ROM0_arr[10][7] <= 64'd17920;
            ROM0_arr[11][7] <= 64'd19712;
            ROM0_arr[12][7] <= 64'd21504;
            ROM0_arr[13][7] <= 64'd23296;
            ROM0_arr[14][7] <= 64'd25088;
            ROM0_arr[15][7] <= 64'd26880;
            ROM0_arr[0][8] <= 64'd0;
            ROM0_arr[1][8] <= 64'd2048;
            ROM0_arr[2][8] <= 64'd4096;
            ROM0_arr[3][8] <= 64'd6144;
            ROM0_arr[4][8] <= 64'd8192;
            ROM0_arr[5][8] <= 64'd10240;
            ROM0_arr[6][8] <= 64'd12288;
            ROM0_arr[7][8] <= 64'd14336;
            ROM0_arr[8][8] <= 64'd16384;
            ROM0_arr[9][8] <= 64'd18432;
            ROM0_arr[10][8] <= 64'd20480;
            ROM0_arr[11][8] <= 64'd22528;
            ROM0_arr[12][8] <= 64'd24576;
            ROM0_arr[13][8] <= 64'd26624;
            ROM0_arr[14][8] <= 64'd28672;
            ROM0_arr[15][8] <= 64'd30720;
            ROM0_arr[0][9] <= 64'd0;
            ROM0_arr[1][9] <= 64'd2304;
            ROM0_arr[2][9] <= 64'd4608;
            ROM0_arr[3][9] <= 64'd6912;
            ROM0_arr[4][9] <= 64'd9216;
            ROM0_arr[5][9] <= 64'd11520;
            ROM0_arr[6][9] <= 64'd13824;
            ROM0_arr[7][9] <= 64'd16128;
            ROM0_arr[8][9] <= 64'd18432;
            ROM0_arr[9][9] <= 64'd20736;
            ROM0_arr[10][9] <= 64'd23040;
            ROM0_arr[11][9] <= 64'd25344;
            ROM0_arr[12][9] <= 64'd27648;
            ROM0_arr[13][9] <= 64'd29952;
            ROM0_arr[14][9] <= 64'd32256;
            ROM0_arr[15][9] <= 64'd34560;
            ROM0_arr[0][10] <= 64'd0;
            ROM0_arr[1][10] <= 64'd2560;
            ROM0_arr[2][10] <= 64'd5120;
            ROM0_arr[3][10] <= 64'd7680;
            ROM0_arr[4][10] <= 64'd10240;
            ROM0_arr[5][10] <= 64'd12800;
            ROM0_arr[6][10] <= 64'd15360;
            ROM0_arr[7][10] <= 64'd17920;
            ROM0_arr[8][10] <= 64'd20480;
            ROM0_arr[9][10] <= 64'd23040;
            ROM0_arr[10][10] <= 64'd25600;
            ROM0_arr[11][10] <= 64'd28160;
            ROM0_arr[12][10] <= 64'd30720;
            ROM0_arr[13][10] <= 64'd33280;
            ROM0_arr[14][10] <= 64'd35840;
            ROM0_arr[15][10] <= 64'd38400;
            ROM0_arr[0][11] <= 64'd0;
            ROM0_arr[1][11] <= 64'd2816;
            ROM0_arr[2][11] <= 64'd5632;
            ROM0_arr[3][11] <= 64'd8448;
            ROM0_arr[4][11] <= 64'd11264;
            ROM0_arr[5][11] <= 64'd14080;
            ROM0_arr[6][11] <= 64'd16896;
            ROM0_arr[7][11] <= 64'd19712;
            ROM0_arr[8][11] <= 64'd22528;
            ROM0_arr[9][11] <= 64'd25344;
            ROM0_arr[10][11] <= 64'd28160;
            ROM0_arr[11][11] <= 64'd30976;
            ROM0_arr[12][11] <= 64'd33792;
            ROM0_arr[13][11] <= 64'd36608;
            ROM0_arr[14][11] <= 64'd39424;
            ROM0_arr[15][11] <= 64'd42240;
            ROM0_arr[0][12] <= 64'd0;
            ROM0_arr[1][12] <= 64'd3072;
            ROM0_arr[2][12] <= 64'd6144;
            ROM0_arr[3][12] <= 64'd9216;
            ROM0_arr[4][12] <= 64'd12288;
            ROM0_arr[5][12] <= 64'd15360;
            ROM0_arr[6][12] <= 64'd18432;
            ROM0_arr[7][12] <= 64'd21504;
            ROM0_arr[8][12] <= 64'd24576;
            ROM0_arr[9][12] <= 64'd27648;
            ROM0_arr[10][12] <= 64'd30720;
            ROM0_arr[11][12] <= 64'd33792;
            ROM0_arr[12][12] <= 64'd36864;
            ROM0_arr[13][12] <= 64'd39936;
            ROM0_arr[14][12] <= 64'd43008;
            ROM0_arr[15][12] <= 64'd46080;
            ROM0_arr[0][13] <= 64'd0;
            ROM0_arr[1][13] <= 64'd3328;
            ROM0_arr[2][13] <= 64'd6656;
            ROM0_arr[3][13] <= 64'd9984;
            ROM0_arr[4][13] <= 64'd13312;
            ROM0_arr[5][13] <= 64'd16640;
            ROM0_arr[6][13] <= 64'd19968;
            ROM0_arr[7][13] <= 64'd23296;
            ROM0_arr[8][13] <= 64'd26624;
            ROM0_arr[9][13] <= 64'd29952;
            ROM0_arr[10][13] <= 64'd33280;
            ROM0_arr[11][13] <= 64'd36608;
            ROM0_arr[12][13] <= 64'd39936;
            ROM0_arr[13][13] <= 64'd43264;
            ROM0_arr[14][13] <= 64'd46592;
            ROM0_arr[15][13] <= 64'd49920;
            ROM0_arr[0][14] <= 64'd0;
            ROM0_arr[1][14] <= 64'd3584;
            ROM0_arr[2][14] <= 64'd7168;
            ROM0_arr[3][14] <= 64'd10752;
            ROM0_arr[4][14] <= 64'd14336;
            ROM0_arr[5][14] <= 64'd17920;
            ROM0_arr[6][14] <= 64'd21504;
            ROM0_arr[7][14] <= 64'd25088;
            ROM0_arr[8][14] <= 64'd28672;
            ROM0_arr[9][14] <= 64'd32256;
            ROM0_arr[10][14] <= 64'd35840;
            ROM0_arr[11][14] <= 64'd39424;
            ROM0_arr[12][14] <= 64'd43008;
            ROM0_arr[13][14] <= 64'd46592;
            ROM0_arr[14][14] <= 64'd50176;
            ROM0_arr[15][14] <= 64'd53760;
            ROM0_arr[0][15] <= 64'd0;
            ROM0_arr[1][15] <= 64'd3840;
            ROM0_arr[2][15] <= 64'd7680;
            ROM0_arr[3][15] <= 64'd11520;
            ROM0_arr[4][15] <= 64'd15360;
            ROM0_arr[5][15] <= 64'd19200;
            ROM0_arr[6][15] <= 64'd23040;
            ROM0_arr[7][15] <= 64'd26880;
            ROM0_arr[8][15] <= 64'd30720;
            ROM0_arr[9][15] <= 64'd34560;
            ROM0_arr[10][15] <= 64'd38400;
            ROM0_arr[11][15] <= 64'd42240;
            ROM0_arr[12][15] <= 64'd46080;
            ROM0_arr[13][15] <= 64'd49920;
            ROM0_arr[14][15] <= 64'd53760;
            ROM0_arr[15][15] <= 64'd57600;

            // ROM1 init
            ROM1_arr[0][0] <= 64'd0;
            ROM1_arr[1][0] <= 64'd0;
            ROM1_arr[2][0] <= 64'd0;
            ROM1_arr[3][0] <= 64'd0;
            ROM1_arr[4][0] <= 64'd0;
            ROM1_arr[5][0] <= 64'd0;
            ROM1_arr[6][0] <= 64'd0;
            ROM1_arr[7][0] <= 64'd0;
            ROM1_arr[8][0] <= 64'd0;
            ROM1_arr[9][0] <= 64'd0;
            ROM1_arr[10][0] <= 64'd0;
            ROM1_arr[11][0] <= 64'd0;
            ROM1_arr[12][0] <= 64'd0;
            ROM1_arr[13][0] <= 64'd0;
            ROM1_arr[14][0] <= 64'd0;
            ROM1_arr[15][0] <= 64'd0;
            ROM1_arr[0][1] <= 64'd0;
            ROM1_arr[1][1] <= 64'd16;
            ROM1_arr[2][1] <= 64'd32;
            ROM1_arr[3][1] <= 64'd48;
            ROM1_arr[4][1] <= 64'd64;
            ROM1_arr[5][1] <= 64'd80;
            ROM1_arr[6][1] <= 64'd96;
            ROM1_arr[7][1] <= 64'd112;
            ROM1_arr[8][1] <= 64'd128;
            ROM1_arr[9][1] <= 64'd144;
            ROM1_arr[10][1] <= 64'd160;
            ROM1_arr[11][1] <= 64'd176;
            ROM1_arr[12][1] <= 64'd192;
            ROM1_arr[13][1] <= 64'd208;
            ROM1_arr[14][1] <= 64'd224;
            ROM1_arr[15][1] <= 64'd240;
            ROM1_arr[0][2] <= 64'd0;
            ROM1_arr[1][2] <= 64'd32;
            ROM1_arr[2][2] <= 64'd64;
            ROM1_arr[3][2] <= 64'd96;
            ROM1_arr[4][2] <= 64'd128;
            ROM1_arr[5][2] <= 64'd160;
            ROM1_arr[6][2] <= 64'd192;
            ROM1_arr[7][2] <= 64'd224;
            ROM1_arr[8][2] <= 64'd256;
            ROM1_arr[9][2] <= 64'd288;
            ROM1_arr[10][2] <= 64'd320;
            ROM1_arr[11][2] <= 64'd352;
            ROM1_arr[12][2] <= 64'd384;
            ROM1_arr[13][2] <= 64'd416;
            ROM1_arr[14][2] <= 64'd448;
            ROM1_arr[15][2] <= 64'd480;
            ROM1_arr[0][3] <= 64'd0;
            ROM1_arr[1][3] <= 64'd48;
            ROM1_arr[2][3] <= 64'd96;
            ROM1_arr[3][3] <= 64'd144;
            ROM1_arr[4][3] <= 64'd192;
            ROM1_arr[5][3] <= 64'd240;
            ROM1_arr[6][3] <= 64'd288;
            ROM1_arr[7][3] <= 64'd336;
            ROM1_arr[8][3] <= 64'd384;
            ROM1_arr[9][3] <= 64'd432;
            ROM1_arr[10][3] <= 64'd480;
            ROM1_arr[11][3] <= 64'd528;
            ROM1_arr[12][3] <= 64'd576;
            ROM1_arr[13][3] <= 64'd624;
            ROM1_arr[14][3] <= 64'd672;
            ROM1_arr[15][3] <= 64'd720;
            ROM1_arr[0][4] <= 64'd0;
            ROM1_arr[1][4] <= 64'd64;
            ROM1_arr[2][4] <= 64'd128;
            ROM1_arr[3][4] <= 64'd192;
            ROM1_arr[4][4] <= 64'd256;
            ROM1_arr[5][4] <= 64'd320;
            ROM1_arr[6][4] <= 64'd384;
            ROM1_arr[7][4] <= 64'd448;
            ROM1_arr[8][4] <= 64'd512;
            ROM1_arr[9][4] <= 64'd576;
            ROM1_arr[10][4] <= 64'd640;
            ROM1_arr[11][4] <= 64'd704;
            ROM1_arr[12][4] <= 64'd768;
            ROM1_arr[13][4] <= 64'd832;
            ROM1_arr[14][4] <= 64'd896;
            ROM1_arr[15][4] <= 64'd960;
            ROM1_arr[0][5] <= 64'd0;
            ROM1_arr[1][5] <= 64'd80;
            ROM1_arr[2][5] <= 64'd160;
            ROM1_arr[3][5] <= 64'd240;
            ROM1_arr[4][5] <= 64'd320;
            ROM1_arr[5][5] <= 64'd400;
            ROM1_arr[6][5] <= 64'd480;
            ROM1_arr[7][5] <= 64'd560;
            ROM1_arr[8][5] <= 64'd640;
            ROM1_arr[9][5] <= 64'd720;
            ROM1_arr[10][5] <= 64'd800;
            ROM1_arr[11][5] <= 64'd880;
            ROM1_arr[12][5] <= 64'd960;
            ROM1_arr[13][5] <= 64'd1040;
            ROM1_arr[14][5] <= 64'd1120;
            ROM1_arr[15][5] <= 64'd1200;
            ROM1_arr[0][6] <= 64'd0;
            ROM1_arr[1][6] <= 64'd96;
            ROM1_arr[2][6] <= 64'd192;
            ROM1_arr[3][6] <= 64'd288;
            ROM1_arr[4][6] <= 64'd384;
            ROM1_arr[5][6] <= 64'd480;
            ROM1_arr[6][6] <= 64'd576;
            ROM1_arr[7][6] <= 64'd672;
            ROM1_arr[8][6] <= 64'd768;
            ROM1_arr[9][6] <= 64'd864;
            ROM1_arr[10][6] <= 64'd960;
            ROM1_arr[11][6] <= 64'd1056;
            ROM1_arr[12][6] <= 64'd1152;
            ROM1_arr[13][6] <= 64'd1248;
            ROM1_arr[14][6] <= 64'd1344;
            ROM1_arr[15][6] <= 64'd1440;
            ROM1_arr[0][7] <= 64'd0;
            ROM1_arr[1][7] <= 64'd112;
            ROM1_arr[2][7] <= 64'd224;
            ROM1_arr[3][7] <= 64'd336;
            ROM1_arr[4][7] <= 64'd448;
            ROM1_arr[5][7] <= 64'd560;
            ROM1_arr[6][7] <= 64'd672;
            ROM1_arr[7][7] <= 64'd784;
            ROM1_arr[8][7] <= 64'd896;
            ROM1_arr[9][7] <= 64'd1008;
            ROM1_arr[10][7] <= 64'd1120;
            ROM1_arr[11][7] <= 64'd1232;
            ROM1_arr[12][7] <= 64'd1344;
            ROM1_arr[13][7] <= 64'd1456;
            ROM1_arr[14][7] <= 64'd1568;
            ROM1_arr[15][7] <= 64'd1680;
            ROM1_arr[0][8] <= 64'd0;
            ROM1_arr[1][8] <= 64'd128;
            ROM1_arr[2][8] <= 64'd256;
            ROM1_arr[3][8] <= 64'd384;
            ROM1_arr[4][8] <= 64'd512;
            ROM1_arr[5][8] <= 64'd640;
            ROM1_arr[6][8] <= 64'd768;
            ROM1_arr[7][8] <= 64'd896;
            ROM1_arr[8][8] <= 64'd1024;
            ROM1_arr[9][8] <= 64'd1152;
            ROM1_arr[10][8] <= 64'd1280;
            ROM1_arr[11][8] <= 64'd1408;
            ROM1_arr[12][8] <= 64'd1536;
            ROM1_arr[13][8] <= 64'd1664;
            ROM1_arr[14][8] <= 64'd1792;
            ROM1_arr[15][8] <= 64'd1920;
            ROM1_arr[0][9] <= 64'd0;
            ROM1_arr[1][9] <= 64'd144;
            ROM1_arr[2][9] <= 64'd288;
            ROM1_arr[3][9] <= 64'd432;
            ROM1_arr[4][9] <= 64'd576;
            ROM1_arr[5][9] <= 64'd720;
            ROM1_arr[6][9] <= 64'd864;
            ROM1_arr[7][9] <= 64'd1008;
            ROM1_arr[8][9] <= 64'd1152;
            ROM1_arr[9][9] <= 64'd1296;
            ROM1_arr[10][9] <= 64'd1440;
            ROM1_arr[11][9] <= 64'd1584;
            ROM1_arr[12][9] <= 64'd1728;
            ROM1_arr[13][9] <= 64'd1872;
            ROM1_arr[14][9] <= 64'd2016;
            ROM1_arr[15][9] <= 64'd2160;
            ROM1_arr[0][10] <= 64'd0;
            ROM1_arr[1][10] <= 64'd160;
            ROM1_arr[2][10] <= 64'd320;
            ROM1_arr[3][10] <= 64'd480;
            ROM1_arr[4][10] <= 64'd640;
            ROM1_arr[5][10] <= 64'd800;
            ROM1_arr[6][10] <= 64'd960;
            ROM1_arr[7][10] <= 64'd1120;
            ROM1_arr[8][10] <= 64'd1280;
            ROM1_arr[9][10] <= 64'd1440;
            ROM1_arr[10][10] <= 64'd1600;
            ROM1_arr[11][10] <= 64'd1760;
            ROM1_arr[12][10] <= 64'd1920;
            ROM1_arr[13][10] <= 64'd2080;
            ROM1_arr[14][10] <= 64'd2240;
            ROM1_arr[15][10] <= 64'd2400;
            ROM1_arr[0][11] <= 64'd0;
            ROM1_arr[1][11] <= 64'd176;
            ROM1_arr[2][11] <= 64'd352;
            ROM1_arr[3][11] <= 64'd528;
            ROM1_arr[4][11] <= 64'd704;
            ROM1_arr[5][11] <= 64'd880;
            ROM1_arr[6][11] <= 64'd1056;
            ROM1_arr[7][11] <= 64'd1232;
            ROM1_arr[8][11] <= 64'd1408;
            ROM1_arr[9][11] <= 64'd1584;
            ROM1_arr[10][11] <= 64'd1760;
            ROM1_arr[11][11] <= 64'd1936;
            ROM1_arr[12][11] <= 64'd2112;
            ROM1_arr[13][11] <= 64'd2288;
            ROM1_arr[14][11] <= 64'd2464;
            ROM1_arr[15][11] <= 64'd2640;
            ROM1_arr[0][12] <= 64'd0;
            ROM1_arr[1][12] <= 64'd192;
            ROM1_arr[2][12] <= 64'd384;
            ROM1_arr[3][12] <= 64'd576;
            ROM1_arr[4][12] <= 64'd768;
            ROM1_arr[5][12] <= 64'd960;
            ROM1_arr[6][12] <= 64'd1152;
            ROM1_arr[7][12] <= 64'd1344;
            ROM1_arr[8][12] <= 64'd1536;
            ROM1_arr[9][12] <= 64'd1728;
            ROM1_arr[10][12] <= 64'd1920;
            ROM1_arr[11][12] <= 64'd2112;
            ROM1_arr[12][12] <= 64'd2304;
            ROM1_arr[13][12] <= 64'd2496;
            ROM1_arr[14][12] <= 64'd2688;
            ROM1_arr[15][12] <= 64'd2880;
            ROM1_arr[0][13] <= 64'd0;
            ROM1_arr[1][13] <= 64'd208;
            ROM1_arr[2][13] <= 64'd416;
            ROM1_arr[3][13] <= 64'd624;
            ROM1_arr[4][13] <= 64'd832;
            ROM1_arr[5][13] <= 64'd1040;
            ROM1_arr[6][13] <= 64'd1248;
            ROM1_arr[7][13] <= 64'd1456;
            ROM1_arr[8][13] <= 64'd1664;
            ROM1_arr[9][13] <= 64'd1872;
            ROM1_arr[10][13] <= 64'd2080;
            ROM1_arr[11][13] <= 64'd2288;
            ROM1_arr[12][13] <= 64'd2496;
            ROM1_arr[13][13] <= 64'd2704;
            ROM1_arr[14][13] <= 64'd2912;
            ROM1_arr[15][13] <= 64'd3120;
            ROM1_arr[0][14] <= 64'd0;
            ROM1_arr[1][14] <= 64'd224;
            ROM1_arr[2][14] <= 64'd448;
            ROM1_arr[3][14] <= 64'd672;
            ROM1_arr[4][14] <= 64'd896;
            ROM1_arr[5][14] <= 64'd1120;
            ROM1_arr[6][14] <= 64'd1344;
            ROM1_arr[7][14] <= 64'd1568;
            ROM1_arr[8][14] <= 64'd1792;
            ROM1_arr[9][14] <= 64'd2016;
            ROM1_arr[10][14] <= 64'd2240;
            ROM1_arr[11][14] <= 64'd2464;
            ROM1_arr[12][14] <= 64'd2688;
            ROM1_arr[13][14] <= 64'd2912;
            ROM1_arr[14][14] <= 64'd3136;
            ROM1_arr[15][14] <= 64'd3360;
            ROM1_arr[0][15] <= 64'd0;
            ROM1_arr[1][15] <= 64'd240;
            ROM1_arr[2][15] <= 64'd480;
            ROM1_arr[3][15] <= 64'd720;
            ROM1_arr[4][15] <= 64'd960;
            ROM1_arr[5][15] <= 64'd1200;
            ROM1_arr[6][15] <= 64'd1440;
            ROM1_arr[7][15] <= 64'd1680;
            ROM1_arr[8][15] <= 64'd1920;
            ROM1_arr[9][15] <= 64'd2160;
            ROM1_arr[10][15] <= 64'd2400;
            ROM1_arr[11][15] <= 64'd2640;
            ROM1_arr[12][15] <= 64'd2880;
            ROM1_arr[13][15] <= 64'd3120;
            ROM1_arr[14][15] <= 64'd3360;
            ROM1_arr[15][15] <= 64'd3600;
            // ROM2 init
            ROM2_arr[0][0] <= 64'd0;
            ROM2_arr[1][0] <= 64'd0;
            ROM2_arr[2][0] <= 64'd0;
            ROM2_arr[3][0] <= 64'd0;
            ROM2_arr[4][0] <= 64'd0;
            ROM2_arr[5][0] <= 64'd0;
            ROM2_arr[6][0] <= 64'd0;
            ROM2_arr[7][0] <= 64'd0;
            ROM2_arr[8][0] <= 64'd0;
            ROM2_arr[9][0] <= 64'd0;
            ROM2_arr[10][0] <= 64'd0;
            ROM2_arr[11][0] <= 64'd0;
            ROM2_arr[12][0] <= 64'd0;
            ROM2_arr[13][0] <= 64'd0;
            ROM2_arr[14][0] <= 64'd0;
            ROM2_arr[15][0] <= 64'd0;
            ROM2_arr[0][1] <= 64'd0;
            ROM2_arr[1][1] <= 64'd1;
            ROM2_arr[2][1] <= 64'd2;
            ROM2_arr[3][1] <= 64'd3;
            ROM2_arr[4][1] <= 64'd4;
            ROM2_arr[5][1] <= 64'd5;
            ROM2_arr[6][1] <= 64'd6;
            ROM2_arr[7][1] <= 64'd7;
            ROM2_arr[8][1] <= 64'd8;
            ROM2_arr[9][1] <= 64'd9;
            ROM2_arr[10][1] <= 64'd10;
            ROM2_arr[11][1] <= 64'd11;
            ROM2_arr[12][1] <= 64'd12;
            ROM2_arr[13][1] <= 64'd13;
            ROM2_arr[14][1] <= 64'd14;
            ROM2_arr[15][1] <= 64'd15;
            ROM2_arr[0][2] <= 64'd0;
            ROM2_arr[1][2] <= 64'd2;
            ROM2_arr[2][2] <= 64'd4;
            ROM2_arr[3][2] <= 64'd6;
            ROM2_arr[4][2] <= 64'd8;
            ROM2_arr[5][2] <= 64'd10;
            ROM2_arr[6][2] <= 64'd12;
            ROM2_arr[7][2] <= 64'd14;
            ROM2_arr[8][2] <= 64'd16;
            ROM2_arr[9][2] <= 64'd18;
            ROM2_arr[10][2] <= 64'd20;
            ROM2_arr[11][2] <= 64'd22;
            ROM2_arr[12][2] <= 64'd24;
            ROM2_arr[13][2] <= 64'd26;
            ROM2_arr[14][2] <= 64'd28;
            ROM2_arr[15][2] <= 64'd30;
            ROM2_arr[0][3] <= 64'd0;
            ROM2_arr[1][3] <= 64'd3;
            ROM2_arr[2][3] <= 64'd6;
            ROM2_arr[3][3] <= 64'd9;
            ROM2_arr[4][3] <= 64'd12;
            ROM2_arr[5][3] <= 64'd15;
            ROM2_arr[6][3] <= 64'd18;
            ROM2_arr[7][3] <= 64'd21;
            ROM2_arr[8][3] <= 64'd24;
            ROM2_arr[9][3] <= 64'd27;
            ROM2_arr[10][3] <= 64'd30;
            ROM2_arr[11][3] <= 64'd33;
            ROM2_arr[12][3] <= 64'd36;
            ROM2_arr[13][3] <= 64'd39;
            ROM2_arr[14][3] <= 64'd42;
            ROM2_arr[15][3] <= 64'd45;
            ROM2_arr[0][4] <= 64'd0;
            ROM2_arr[1][4] <= 64'd4;
            ROM2_arr[2][4] <= 64'd8;
            ROM2_arr[3][4] <= 64'd12;
            ROM2_arr[4][4] <= 64'd16;
            ROM2_arr[5][4] <= 64'd20;
            ROM2_arr[6][4] <= 64'd24;
            ROM2_arr[7][4] <= 64'd28;
            ROM2_arr[8][4] <= 64'd32;
            ROM2_arr[9][4] <= 64'd36;
            ROM2_arr[10][4] <= 64'd40;
            ROM2_arr[11][4] <= 64'd44;
            ROM2_arr[12][4] <= 64'd48;
            ROM2_arr[13][4] <= 64'd52;
            ROM2_arr[14][4] <= 64'd56;
            ROM2_arr[15][4] <= 64'd60;
            ROM2_arr[0][5] <= 64'd0;
            ROM2_arr[1][5] <= 64'd5;
            ROM2_arr[2][5] <= 64'd10;
            ROM2_arr[3][5] <= 64'd15;
            ROM2_arr[4][5] <= 64'd20;
            ROM2_arr[5][5] <= 64'd25;
            ROM2_arr[6][5] <= 64'd30;
            ROM2_arr[7][5] <= 64'd35;
            ROM2_arr[8][5] <= 64'd40;
            ROM2_arr[9][5] <= 64'd45;
            ROM2_arr[10][5] <= 64'd50;
            ROM2_arr[11][5] <= 64'd55;
            ROM2_arr[12][5] <= 64'd60;
            ROM2_arr[13][5] <= 64'd65;
            ROM2_arr[14][5] <= 64'd70;
            ROM2_arr[15][5] <= 64'd75;
            ROM2_arr[0][6] <= 64'd0;
            ROM2_arr[1][6] <= 64'd6;
            ROM2_arr[2][6] <= 64'd12;
            ROM2_arr[3][6] <= 64'd18;
            ROM2_arr[4][6] <= 64'd24;
            ROM2_arr[5][6] <= 64'd30;
            ROM2_arr[6][6] <= 64'd36;
            ROM2_arr[7][6] <= 64'd42;
            ROM2_arr[8][6] <= 64'd48;
            ROM2_arr[9][6] <= 64'd54;
            ROM2_arr[10][6] <= 64'd60;
            ROM2_arr[11][6] <= 64'd66;
            ROM2_arr[12][6] <= 64'd72;
            ROM2_arr[13][6] <= 64'd78;
            ROM2_arr[14][6] <= 64'd84;
            ROM2_arr[15][6] <= 64'd90;
            ROM2_arr[0][7] <= 64'd0;
            ROM2_arr[1][7] <= 64'd7;
            ROM2_arr[2][7] <= 64'd14;
            ROM2_arr[3][7] <= 64'd21;
            ROM2_arr[4][7] <= 64'd28;
            ROM2_arr[5][7] <= 64'd35;
            ROM2_arr[6][7] <= 64'd42;
            ROM2_arr[7][7] <= 64'd49;
            ROM2_arr[8][7] <= 64'd56;
            ROM2_arr[9][7] <= 64'd63;
            ROM2_arr[10][7] <= 64'd70;
            ROM2_arr[11][7] <= 64'd77;
            ROM2_arr[12][7] <= 64'd84;
            ROM2_arr[13][7] <= 64'd91;
            ROM2_arr[14][7] <= 64'd98;
            ROM2_arr[15][7] <= 64'd105;
            ROM2_arr[0][8] <= 64'd0;
            ROM2_arr[1][8] <= 64'd8;
            ROM2_arr[2][8] <= 64'd16;
            ROM2_arr[3][8] <= 64'd24;
            ROM2_arr[4][8] <= 64'd32;
            ROM2_arr[5][8] <= 64'd40;
            ROM2_arr[6][8] <= 64'd48;
            ROM2_arr[7][8] <= 64'd56;
            ROM2_arr[8][8] <= 64'd64;
            ROM2_arr[9][8] <= 64'd72;
            ROM2_arr[10][8] <= 64'd80;
            ROM2_arr[11][8] <= 64'd88;
            ROM2_arr[12][8] <= 64'd96;
            ROM2_arr[13][8] <= 64'd104;
            ROM2_arr[14][8] <= 64'd112;
            ROM2_arr[15][8] <= 64'd120;
            ROM2_arr[0][9] <= 64'd0;
            ROM2_arr[1][9] <= 64'd9;
            ROM2_arr[2][9] <= 64'd18;
            ROM2_arr[3][9] <= 64'd27;
            ROM2_arr[4][9] <= 64'd36;
            ROM2_arr[5][9] <= 64'd45;
            ROM2_arr[6][9] <= 64'd54;
            ROM2_arr[7][9] <= 64'd63;
            ROM2_arr[8][9] <= 64'd72;
            ROM2_arr[9][9] <= 64'd81;
            ROM2_arr[10][9] <= 64'd90;
            ROM2_arr[11][9] <= 64'd99;
            ROM2_arr[12][9] <= 64'd108;
            ROM2_arr[13][9] <= 64'd117;
            ROM2_arr[14][9] <= 64'd126;
            ROM2_arr[15][9] <= 64'd135;
            ROM2_arr[0][10] <= 64'd0;
            ROM2_arr[1][10] <= 64'd10;
            ROM2_arr[2][10] <= 64'd20;
            ROM2_arr[3][10] <= 64'd30;
            ROM2_arr[4][10] <= 64'd40;
            ROM2_arr[5][10] <= 64'd50;
            ROM2_arr[6][10] <= 64'd60;
            ROM2_arr[7][10] <= 64'd70;
            ROM2_arr[8][10] <= 64'd80;
            ROM2_arr[9][10] <= 64'd90;
            ROM2_arr[10][10] <= 64'd100;
            ROM2_arr[11][10] <= 64'd110;
            ROM2_arr[12][10] <= 64'd120;
            ROM2_arr[13][10] <= 64'd130;
            ROM2_arr[14][10] <= 64'd140;
            ROM2_arr[15][10] <= 64'd150;
            ROM2_arr[0][11] <= 64'd0;
            ROM2_arr[1][11] <= 64'd11;
            ROM2_arr[2][11] <= 64'd22;
            ROM2_arr[3][11] <= 64'd33;
            ROM2_arr[4][11] <= 64'd44;
            ROM2_arr[5][11] <= 64'd55;
            ROM2_arr[6][11] <= 64'd66;
            ROM2_arr[7][11] <= 64'd77;
            ROM2_arr[8][11] <= 64'd88;
            ROM2_arr[9][11] <= 64'd99;
            ROM2_arr[10][11] <= 64'd110;
            ROM2_arr[11][11] <= 64'd121;
            ROM2_arr[12][11] <= 64'd132;
            ROM2_arr[13][11] <= 64'd143;
            ROM2_arr[14][11] <= 64'd154;
            ROM2_arr[15][11] <= 64'd165;
            ROM2_arr[0][12] <= 64'd0;
            ROM2_arr[1][12] <= 64'd12;
            ROM2_arr[2][12] <= 64'd24;
            ROM2_arr[3][12] <= 64'd36;
            ROM2_arr[4][12] <= 64'd48;
            ROM2_arr[5][12] <= 64'd60;
            ROM2_arr[6][12] <= 64'd72;
            ROM2_arr[7][12] <= 64'd84;
            ROM2_arr[8][12] <= 64'd96;
            ROM2_arr[9][12] <= 64'd108;
            ROM2_arr[10][12] <= 64'd120;
            ROM2_arr[11][12] <= 64'd132;
            ROM2_arr[12][12] <= 64'd144;
            ROM2_arr[13][12] <= 64'd156;
            ROM2_arr[14][12] <= 64'd168;
            ROM2_arr[15][12] <= 64'd180;
            ROM2_arr[0][13] <= 64'd0;
            ROM2_arr[1][13] <= 64'd13;
            ROM2_arr[2][13] <= 64'd26;
            ROM2_arr[3][13] <= 64'd39;
            ROM2_arr[4][13] <= 64'd52;
            ROM2_arr[5][13] <= 64'd65;
            ROM2_arr[6][13] <= 64'd78;
            ROM2_arr[7][13] <= 64'd91;
            ROM2_arr[8][13] <= 64'd104;
            ROM2_arr[9][13] <= 64'd117;
            ROM2_arr[10][13] <= 64'd130;
            ROM2_arr[11][13] <= 64'd143;
            ROM2_arr[12][13] <= 64'd156;
            ROM2_arr[13][13] <= 64'd169;
            ROM2_arr[14][13] <= 64'd182;
            ROM2_arr[15][13] <= 64'd195;
            ROM2_arr[0][14] <= 64'd0;
            ROM2_arr[1][14] <= 64'd14;
            ROM2_arr[2][14] <= 64'd28;
            ROM2_arr[3][14] <= 64'd42;
            ROM2_arr[4][14] <= 64'd56;
            ROM2_arr[5][14] <= 64'd70;
            ROM2_arr[6][14] <= 64'd84;
            ROM2_arr[7][14] <= 64'd98;
            ROM2_arr[8][14] <= 64'd112;
            ROM2_arr[9][14] <= 64'd126;
            ROM2_arr[10][14] <= 64'd140;
            ROM2_arr[11][14] <= 64'd154;
            ROM2_arr[12][14] <= 64'd168;
            ROM2_arr[13][14] <= 64'd182;
            ROM2_arr[14][14] <= 64'd196;
            ROM2_arr[15][14] <= 64'd210;
            ROM2_arr[0][15] <= 64'd0;
            ROM2_arr[1][15] <= 64'd15;
            ROM2_arr[2][15] <= 64'd30;
            ROM2_arr[3][15] <= 64'd45;
            ROM2_arr[4][15] <= 64'd60;
            ROM2_arr[5][15] <= 64'd75;
            ROM2_arr[6][15] <= 64'd90;
            ROM2_arr[7][15] <= 64'd105;
            ROM2_arr[8][15] <= 64'd120;
            ROM2_arr[9][15] <= 64'd135;
            ROM2_arr[10][15] <= 64'd150;
            ROM2_arr[11][15] <= 64'd165;
            ROM2_arr[12][15] <= 64'd180;
            ROM2_arr[13][15] <= 64'd195;
            ROM2_arr[14][15] <= 64'd210;
            ROM2_arr[15][15] <= 64'd225;
        end
    end

    always @( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            ROM0_b0     <= 64'd0    ;
            ROM0_b1     <= 64'd0    ;
            ROM0_b2     <= 64'd0    ;
            ROM0_b3     <= 64'd0    ;
            ROM0_b4     <= 64'd0    ;
            ROM0_b5     <= 64'd0    ;
            ROM0_b6     <= 64'd0    ;
            ROM0_b7     <= 64'd0    ;
            ROM0_b8     <= 64'd0    ;
            ROM0_b9     <= 64'd0    ;
            ROM0_b10    <= 64'd0    ;
            ROM0_b11    <= 64'd0    ;
            ROM0_b12    <= 64'd0    ; 
            ROM0_b13    <= 64'd0    ;
            ROM0_b14    <= 64'd0    ; 
            ROM0_b15    <= 64'd0    ;
        end else begin
            if (~ROM_CEN) begin
                case (MA0)
                    4'd0:
                        begin
                            ROM0_b0     <=  ROM0_arr[0][0]  ;
                            ROM0_b1     <=  ROM0_arr[0][1]  ;
                            ROM0_b2     <=  ROM0_arr[0][2]  ;
                            ROM0_b3     <=  ROM0_arr[0][3]  ;
                            ROM0_b4     <=  ROM0_arr[0][4]  ;
                            ROM0_b5     <=  ROM0_arr[0][5]  ;
                            ROM0_b6     <=  ROM0_arr[0][6]  ;
                            ROM0_b7     <=  ROM0_arr[0][7]  ;
                            ROM0_b8     <=  ROM0_arr[0][8]  ;
                            ROM0_b9     <=  ROM0_arr[0][9]  ;
                            ROM0_b10    <=  ROM0_arr[0][10] ;
                            ROM0_b11    <=  ROM0_arr[0][11] ;
                            ROM0_b12    <=  ROM0_arr[0][12] ;
                            ROM0_b13    <=  ROM0_arr[0][13] ;
                            ROM0_b14    <=  ROM0_arr[0][14] ;
                            ROM0_b15    <=  ROM0_arr[0][15] ;
                        end
                    4'd1:
                        begin
                            ROM0_b0     <=  ROM0_arr[1][0]  ;
                            ROM0_b1     <=  ROM0_arr[1][1]  ;
                            ROM0_b2     <=  ROM0_arr[1][2]  ;
                            ROM0_b3     <=  ROM0_arr[1][3]  ;
                            ROM0_b4     <=  ROM0_arr[1][4]  ;
                            ROM0_b5     <=  ROM0_arr[1][5]  ;
                            ROM0_b6     <=  ROM0_arr[1][6]  ;
                            ROM0_b7     <=  ROM0_arr[1][7]  ;
                            ROM0_b8     <=  ROM0_arr[1][8]  ;
                            ROM0_b9     <=  ROM0_arr[1][9]  ;
                            ROM0_b10    <=  ROM0_arr[1][10] ;
                            ROM0_b11    <=  ROM0_arr[1][11] ;
                            ROM0_b12    <=  ROM0_arr[1][12] ;
                            ROM0_b13    <=  ROM0_arr[1][13] ;
                            ROM0_b14    <=  ROM0_arr[1][14] ;
                            ROM0_b15    <=  ROM0_arr[1][15] ;
                        end
                    4'd2:
                        begin
                            ROM0_b0     <=  ROM0_arr[2][0]  ;
                            ROM0_b1     <=  ROM0_arr[2][1]  ;
                            ROM0_b2     <=  ROM0_arr[2][2]  ;
                            ROM0_b3     <=  ROM0_arr[2][3]  ;
                            ROM0_b4     <=  ROM0_arr[2][4]  ;
                            ROM0_b5     <=  ROM0_arr[2][5]  ;
                            ROM0_b6     <=  ROM0_arr[2][6]  ;
                            ROM0_b7     <=  ROM0_arr[2][7]  ;
                            ROM0_b8     <=  ROM0_arr[2][8]  ;
                            ROM0_b9     <=  ROM0_arr[2][9]  ;
                            ROM0_b10    <=  ROM0_arr[2][10] ;
                            ROM0_b11    <=  ROM0_arr[2][11] ;
                            ROM0_b12    <=  ROM0_arr[2][12] ;
                            ROM0_b13    <=  ROM0_arr[2][13] ;
                            ROM0_b14    <=  ROM0_arr[2][14] ;
                            ROM0_b15    <=  ROM0_arr[2][15] ;
                        end
                    4'd3:
                        begin
                            ROM0_b0     <=  ROM0_arr[3][0]  ;
                            ROM0_b1     <=  ROM0_arr[3][1]  ;
                            ROM0_b2     <=  ROM0_arr[3][2]  ;
                            ROM0_b3     <=  ROM0_arr[3][3]  ;
                            ROM0_b4     <=  ROM0_arr[3][4]  ;
                            ROM0_b5     <=  ROM0_arr[3][5]  ;
                            ROM0_b6     <=  ROM0_arr[3][6]  ;
                            ROM0_b7     <=  ROM0_arr[3][7]  ;
                            ROM0_b8     <=  ROM0_arr[3][8]  ;
                            ROM0_b9     <=  ROM0_arr[3][9]  ;
                            ROM0_b10    <=  ROM0_arr[3][10] ;
                            ROM0_b11    <=  ROM0_arr[3][11] ;
                            ROM0_b12    <=  ROM0_arr[3][12] ;
                            ROM0_b13    <=  ROM0_arr[3][13] ;
                            ROM0_b14    <=  ROM0_arr[3][14] ;
                            ROM0_b15    <=  ROM0_arr[3][15] ;
                        end
                    4'd4:
                        begin
                            ROM0_b0     <=  ROM0_arr[4][0]  ;
                            ROM0_b1     <=  ROM0_arr[4][1]  ;
                            ROM0_b2     <=  ROM0_arr[4][2]  ;
                            ROM0_b3     <=  ROM0_arr[4][3]  ;
                            ROM0_b4     <=  ROM0_arr[4][4]  ;
                            ROM0_b5     <=  ROM0_arr[4][5]  ;
                            ROM0_b6     <=  ROM0_arr[4][6]  ;
                            ROM0_b7     <=  ROM0_arr[4][7]  ;
                            ROM0_b8     <=  ROM0_arr[4][8]  ;
                            ROM0_b9     <=  ROM0_arr[4][9]  ;
                            ROM0_b10    <=  ROM0_arr[4][10] ;
                            ROM0_b11    <=  ROM0_arr[4][11] ;
                            ROM0_b12    <=  ROM0_arr[4][12] ;
                            ROM0_b13    <=  ROM0_arr[4][13] ;
                            ROM0_b14    <=  ROM0_arr[4][14] ;
                            ROM0_b15    <=  ROM0_arr[4][15] ;
                        end
                    4'd5:
                        begin
                            ROM0_b0     <=  ROM0_arr[5][0]  ;
                            ROM0_b1     <=  ROM0_arr[5][1]  ;
                            ROM0_b2     <=  ROM0_arr[5][2]  ;
                            ROM0_b3     <=  ROM0_arr[5][3]  ;
                            ROM0_b4     <=  ROM0_arr[5][4]  ;
                            ROM0_b5     <=  ROM0_arr[5][5]  ;
                            ROM0_b6     <=  ROM0_arr[5][6]  ;
                            ROM0_b7     <=  ROM0_arr[5][7]  ;
                            ROM0_b8     <=  ROM0_arr[5][8]  ;
                            ROM0_b9     <=  ROM0_arr[5][9]  ;
                            ROM0_b10    <=  ROM0_arr[5][10] ;
                            ROM0_b11    <=  ROM0_arr[5][11] ;
                            ROM0_b12    <=  ROM0_arr[5][12] ;
                            ROM0_b13    <=  ROM0_arr[5][13] ;
                            ROM0_b14    <=  ROM0_arr[5][14] ;
                            ROM0_b15    <=  ROM0_arr[5][15] ;
                        end
                    4'd6:
                        begin
                            ROM0_b0     <=  ROM0_arr[6][0]  ;
                            ROM0_b1     <=  ROM0_arr[6][1]  ;
                            ROM0_b2     <=  ROM0_arr[6][2]  ;
                            ROM0_b3     <=  ROM0_arr[6][3]  ;
                            ROM0_b4     <=  ROM0_arr[6][4]  ;
                            ROM0_b5     <=  ROM0_arr[6][5]  ;
                            ROM0_b6     <=  ROM0_arr[6][6]  ;
                            ROM0_b7     <=  ROM0_arr[6][7]  ;
                            ROM0_b8     <=  ROM0_arr[6][8]  ;
                            ROM0_b9     <=  ROM0_arr[6][9]  ;
                            ROM0_b10    <=  ROM0_arr[6][10] ;
                            ROM0_b11    <=  ROM0_arr[6][11] ;
                            ROM0_b12    <=  ROM0_arr[6][12] ;
                            ROM0_b13    <=  ROM0_arr[6][13] ;
                            ROM0_b14    <=  ROM0_arr[6][14] ;
                            ROM0_b15    <=  ROM0_arr[6][15] ;
                        end
                    4'd7:
                        begin
                            ROM0_b0     <=  ROM0_arr[7][0]  ;
                            ROM0_b1     <=  ROM0_arr[7][1]  ;
                            ROM0_b2     <=  ROM0_arr[7][2]  ;
                            ROM0_b3     <=  ROM0_arr[7][3]  ;
                            ROM0_b4     <=  ROM0_arr[7][4]  ;
                            ROM0_b5     <=  ROM0_arr[7][5]  ;
                            ROM0_b6     <=  ROM0_arr[7][6]  ;
                            ROM0_b7     <=  ROM0_arr[7][7]  ;
                            ROM0_b8     <=  ROM0_arr[7][8]  ;
                            ROM0_b9     <=  ROM0_arr[7][9]  ;
                            ROM0_b10    <=  ROM0_arr[7][10] ;
                            ROM0_b11    <=  ROM0_arr[7][11] ;
                            ROM0_b12    <=  ROM0_arr[7][12] ;
                            ROM0_b13    <=  ROM0_arr[7][13] ;
                            ROM0_b14    <=  ROM0_arr[7][14] ;
                            ROM0_b15    <=  ROM0_arr[7][15] ;
                        end
                    4'd8:
                        begin
                            ROM0_b0     <=  ROM0_arr[8][0]  ;
                            ROM0_b1     <=  ROM0_arr[8][1]  ;
                            ROM0_b2     <=  ROM0_arr[8][2]  ;
                            ROM0_b3     <=  ROM0_arr[8][3]  ;
                            ROM0_b4     <=  ROM0_arr[8][4]  ;
                            ROM0_b5     <=  ROM0_arr[8][5]  ;
                            ROM0_b6     <=  ROM0_arr[8][6]  ;
                            ROM0_b7     <=  ROM0_arr[8][7]  ;
                            ROM0_b8     <=  ROM0_arr[8][8]  ;
                            ROM0_b9     <=  ROM0_arr[8][9]  ;
                            ROM0_b10    <=  ROM0_arr[8][10] ;
                            ROM0_b11    <=  ROM0_arr[8][11] ;
                            ROM0_b12    <=  ROM0_arr[8][12] ;
                            ROM0_b13    <=  ROM0_arr[8][13] ;
                            ROM0_b14    <=  ROM0_arr[8][14] ;
                            ROM0_b15    <=  ROM0_arr[8][15] ;
                        end
                    4'd9:
                        begin
                            ROM0_b0     <=  ROM0_arr[9][0]  ;
                            ROM0_b1     <=  ROM0_arr[9][1]  ;
                            ROM0_b2     <=  ROM0_arr[9][2]  ;
                            ROM0_b3     <=  ROM0_arr[9][3]  ;
                            ROM0_b4     <=  ROM0_arr[9][4]  ;
                            ROM0_b5     <=  ROM0_arr[9][5]  ;
                            ROM0_b6     <=  ROM0_arr[9][6]  ;
                            ROM0_b7     <=  ROM0_arr[9][7]  ;
                            ROM0_b8     <=  ROM0_arr[9][8]  ;
                            ROM0_b9     <=  ROM0_arr[9][9]  ;
                            ROM0_b10    <=  ROM0_arr[9][10] ;
                            ROM0_b11    <=  ROM0_arr[9][11] ;
                            ROM0_b12    <=  ROM0_arr[9][12] ;
                            ROM0_b13    <=  ROM0_arr[9][13] ;
                            ROM0_b14    <=  ROM0_arr[9][14] ;
                            ROM0_b15    <=  ROM0_arr[9][15] ;
                        end
                    4'd10:
                        begin
                            ROM0_b0     <=  ROM0_arr[10][0]  ;
                            ROM0_b1     <=  ROM0_arr[10][1]  ;
                            ROM0_b2     <=  ROM0_arr[10][2]  ;
                            ROM0_b3     <=  ROM0_arr[10][3]  ;
                            ROM0_b4     <=  ROM0_arr[10][4]  ;
                            ROM0_b5     <=  ROM0_arr[10][5]  ;
                            ROM0_b6     <=  ROM0_arr[10][6]  ;
                            ROM0_b7     <=  ROM0_arr[10][7]  ;
                            ROM0_b8     <=  ROM0_arr[10][8]  ;
                            ROM0_b9     <=  ROM0_arr[10][9]  ;
                            ROM0_b10    <=  ROM0_arr[10][10] ;
                            ROM0_b11    <=  ROM0_arr[10][11] ;
                            ROM0_b12    <=  ROM0_arr[10][12] ;
                            ROM0_b13    <=  ROM0_arr[10][13] ;
                            ROM0_b14    <=  ROM0_arr[10][14] ;
                            ROM0_b15    <=  ROM0_arr[10][15] ;
                        end
                    4'd11:
                        begin
                            ROM0_b0     <=  ROM0_arr[11][0]  ;
                            ROM0_b1     <=  ROM0_arr[11][1]  ;
                            ROM0_b2     <=  ROM0_arr[11][2]  ;
                            ROM0_b3     <=  ROM0_arr[11][3]  ;
                            ROM0_b4     <=  ROM0_arr[11][4]  ;
                            ROM0_b5     <=  ROM0_arr[11][5]  ;
                            ROM0_b6     <=  ROM0_arr[11][6]  ;
                            ROM0_b7     <=  ROM0_arr[11][7]  ;
                            ROM0_b8     <=  ROM0_arr[11][8]  ;
                            ROM0_b9     <=  ROM0_arr[11][9]  ;
                            ROM0_b10    <=  ROM0_arr[11][10] ;
                            ROM0_b11    <=  ROM0_arr[11][11] ;
                            ROM0_b12    <=  ROM0_arr[11][12] ;
                            ROM0_b13    <=  ROM0_arr[11][13] ;
                            ROM0_b14    <=  ROM0_arr[11][14] ;
                            ROM0_b15    <=  ROM0_arr[11][15] ;
                        end
                    4'd12:
                        begin
                            ROM0_b0     <=  ROM0_arr[12][0]  ;
                            ROM0_b1     <=  ROM0_arr[12][1]  ;
                            ROM0_b2     <=  ROM0_arr[12][2]  ;
                            ROM0_b3     <=  ROM0_arr[12][3]  ;
                            ROM0_b4     <=  ROM0_arr[12][4]  ;
                            ROM0_b5     <=  ROM0_arr[12][5]  ;
                            ROM0_b6     <=  ROM0_arr[12][6]  ;
                            ROM0_b7     <=  ROM0_arr[12][7]  ;
                            ROM0_b8     <=  ROM0_arr[12][8]  ;
                            ROM0_b9     <=  ROM0_arr[12][9]  ;
                            ROM0_b10    <=  ROM0_arr[12][10] ;
                            ROM0_b11    <=  ROM0_arr[12][11] ;
                            ROM0_b12    <=  ROM0_arr[12][12] ;
                            ROM0_b13    <=  ROM0_arr[12][13] ;
                            ROM0_b14    <=  ROM0_arr[12][14] ;
                            ROM0_b15    <=  ROM0_arr[12][15] ;
                        end
                    4'd13:
                        begin
                            ROM0_b0     <=  ROM0_arr[13][0]  ;
                            ROM0_b1     <=  ROM0_arr[13][1]  ;
                            ROM0_b2     <=  ROM0_arr[13][2]  ;
                            ROM0_b3     <=  ROM0_arr[13][3]  ;
                            ROM0_b4     <=  ROM0_arr[13][4]  ;
                            ROM0_b5     <=  ROM0_arr[13][5]  ;
                            ROM0_b6     <=  ROM0_arr[13][6]  ;
                            ROM0_b7     <=  ROM0_arr[13][7]  ;
                            ROM0_b8     <=  ROM0_arr[13][8]  ;
                            ROM0_b9     <=  ROM0_arr[13][9]  ;
                            ROM0_b10    <=  ROM0_arr[13][10] ;
                            ROM0_b11    <=  ROM0_arr[13][11] ;
                            ROM0_b12    <=  ROM0_arr[13][12] ;
                            ROM0_b13    <=  ROM0_arr[13][13] ;
                            ROM0_b14    <=  ROM0_arr[13][14] ;
                            ROM0_b15    <=  ROM0_arr[13][15] ;
                        end
                    4'd14:
                        begin
                            ROM0_b0     <=  ROM0_arr[14][0]  ;
                            ROM0_b1     <=  ROM0_arr[14][1]  ;
                            ROM0_b2     <=  ROM0_arr[14][2]  ;
                            ROM0_b3     <=  ROM0_arr[14][3]  ;
                            ROM0_b4     <=  ROM0_arr[14][4]  ;
                            ROM0_b5     <=  ROM0_arr[14][5]  ;
                            ROM0_b6     <=  ROM0_arr[14][6]  ;
                            ROM0_b7     <=  ROM0_arr[14][7]  ;
                            ROM0_b8     <=  ROM0_arr[14][8]  ;
                            ROM0_b9     <=  ROM0_arr[14][9]  ;
                            ROM0_b10    <=  ROM0_arr[14][10] ;
                            ROM0_b11    <=  ROM0_arr[14][11] ;
                            ROM0_b12    <=  ROM0_arr[14][12] ;
                            ROM0_b13    <=  ROM0_arr[14][13] ;
                            ROM0_b14    <=  ROM0_arr[14][14] ;
                            ROM0_b15    <=  ROM0_arr[14][15] ;
                        end
                    4'd15:
                        begin
                            ROM0_b0     <=  ROM0_arr[15][0]  ;
                            ROM0_b1     <=  ROM0_arr[15][1]  ;
                            ROM0_b2     <=  ROM0_arr[15][2]  ;
                            ROM0_b3     <=  ROM0_arr[15][3]  ;
                            ROM0_b4     <=  ROM0_arr[15][4]  ;
                            ROM0_b5     <=  ROM0_arr[15][5]  ;
                            ROM0_b6     <=  ROM0_arr[15][6]  ;
                            ROM0_b7     <=  ROM0_arr[15][7]  ;
                            ROM0_b8     <=  ROM0_arr[15][8]  ;
                            ROM0_b9     <=  ROM0_arr[15][9]  ;
                            ROM0_b10    <=  ROM0_arr[15][10] ;
                            ROM0_b11    <=  ROM0_arr[15][11] ;
                            ROM0_b12    <=  ROM0_arr[15][12] ;
                            ROM0_b13    <=  ROM0_arr[15][13] ;
                            ROM0_b14    <=  ROM0_arr[15][14] ;
                            ROM0_b15    <=  ROM0_arr[15][15] ;
                        end
                endcase
            end
        end
    end

    always @( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            ROM1_b0     <= 64'd0    ;
            ROM1_b1     <= 64'd0    ;
            ROM1_b2     <= 64'd0    ;
            ROM1_b3     <= 64'd0    ;
            ROM1_b4     <= 64'd0    ;
            ROM1_b5     <= 64'd0    ;
            ROM1_b6     <= 64'd0    ;
            ROM1_b7     <= 64'd0    ;
            ROM1_b8     <= 64'd0    ;
            ROM1_b9     <= 64'd0    ;
            ROM1_b10    <= 64'd0    ;
            ROM1_b11    <= 64'd0    ;
            ROM1_b12    <= 64'd0    ; 
            ROM1_b13    <= 64'd0    ;
            ROM1_b14    <= 64'd0    ; 
            ROM1_b15    <= 64'd0    ;
        end else begin
            if (~ROM_CEN) begin
                case (MA1)
                    4'd0:
                        begin
                            ROM1_b0     <=  ROM1_arr[0][0]  ;
                            ROM1_b1     <=  ROM1_arr[0][1]  ;
                            ROM1_b2     <=  ROM1_arr[0][2]  ;
                            ROM1_b3     <=  ROM1_arr[0][3]  ;
                            ROM1_b4     <=  ROM1_arr[0][4]  ;
                            ROM1_b5     <=  ROM1_arr[0][5]  ;
                            ROM1_b6     <=  ROM1_arr[0][6]  ;
                            ROM1_b7     <=  ROM1_arr[0][7]  ;
                            ROM1_b8     <=  ROM1_arr[0][8]  ;
                            ROM1_b9     <=  ROM1_arr[0][9]  ;
                            ROM1_b10    <=  ROM1_arr[0][10] ;
                            ROM1_b11    <=  ROM1_arr[0][11] ;
                            ROM1_b12    <=  ROM1_arr[0][12] ;
                            ROM1_b13    <=  ROM1_arr[0][13] ;
                            ROM1_b14    <=  ROM1_arr[0][14] ;
                            ROM1_b15    <=  ROM1_arr[0][15] ;
                        end
                    4'd1:
                        begin
                            ROM1_b0     <=  ROM1_arr[1][0]  ;
                            ROM1_b1     <=  ROM1_arr[1][1]  ;
                            ROM1_b2     <=  ROM1_arr[1][2]  ;
                            ROM1_b3     <=  ROM1_arr[1][3]  ;
                            ROM1_b4     <=  ROM1_arr[1][4]  ;
                            ROM1_b5     <=  ROM1_arr[1][5]  ;
                            ROM1_b6     <=  ROM1_arr[1][6]  ;
                            ROM1_b7     <=  ROM1_arr[1][7]  ;
                            ROM1_b8     <=  ROM1_arr[1][8]  ;
                            ROM1_b9     <=  ROM1_arr[1][9]  ;
                            ROM1_b10    <=  ROM1_arr[1][10] ;
                            ROM1_b11    <=  ROM1_arr[1][11] ;
                            ROM1_b12    <=  ROM1_arr[1][12] ;
                            ROM1_b13    <=  ROM1_arr[1][13] ;
                            ROM1_b14    <=  ROM1_arr[1][14] ;
                            ROM1_b15    <=  ROM1_arr[1][15] ;
                        end
                    4'd2:
                        begin
                            ROM1_b0     <=  ROM1_arr[2][0]  ;
                            ROM1_b1     <=  ROM1_arr[2][1]  ;
                            ROM1_b2     <=  ROM1_arr[2][2]  ;
                            ROM1_b3     <=  ROM1_arr[2][3]  ;
                            ROM1_b4     <=  ROM1_arr[2][4]  ;
                            ROM1_b5     <=  ROM1_arr[2][5]  ;
                            ROM1_b6     <=  ROM1_arr[2][6]  ;
                            ROM1_b7     <=  ROM1_arr[2][7]  ;
                            ROM1_b8     <=  ROM1_arr[2][8]  ;
                            ROM1_b9     <=  ROM1_arr[2][9]  ;
                            ROM1_b10    <=  ROM1_arr[2][10] ;
                            ROM1_b11    <=  ROM1_arr[2][11] ;
                            ROM1_b12    <=  ROM1_arr[2][12] ;
                            ROM1_b13    <=  ROM1_arr[2][13] ;
                            ROM1_b14    <=  ROM1_arr[2][14] ;
                            ROM1_b15    <=  ROM1_arr[2][15] ;
                        end
                    4'd3:
                        begin
                            ROM1_b0     <=  ROM1_arr[3][0]  ;
                            ROM1_b1     <=  ROM1_arr[3][1]  ;
                            ROM1_b2     <=  ROM1_arr[3][2]  ;
                            ROM1_b3     <=  ROM1_arr[3][3]  ;
                            ROM1_b4     <=  ROM1_arr[3][4]  ;
                            ROM1_b5     <=  ROM1_arr[3][5]  ;
                            ROM1_b6     <=  ROM1_arr[3][6]  ;
                            ROM1_b7     <=  ROM1_arr[3][7]  ;
                            ROM1_b8     <=  ROM1_arr[3][8]  ;
                            ROM1_b9     <=  ROM1_arr[3][9]  ;
                            ROM1_b10    <=  ROM1_arr[3][10] ;
                            ROM1_b11    <=  ROM1_arr[3][11] ;
                            ROM1_b12    <=  ROM1_arr[3][12] ;
                            ROM1_b13    <=  ROM1_arr[3][13] ;
                            ROM1_b14    <=  ROM1_arr[3][14] ;
                            ROM1_b15    <=  ROM1_arr[3][15] ;
                        end
                    4'd4:
                        begin
                            ROM1_b0     <=  ROM1_arr[4][0]  ;
                            ROM1_b1     <=  ROM1_arr[4][1]  ;
                            ROM1_b2     <=  ROM1_arr[4][2]  ;
                            ROM1_b3     <=  ROM1_arr[4][3]  ;
                            ROM1_b4     <=  ROM1_arr[4][4]  ;
                            ROM1_b5     <=  ROM1_arr[4][5]  ;
                            ROM1_b6     <=  ROM1_arr[4][6]  ;
                            ROM1_b7     <=  ROM1_arr[4][7]  ;
                            ROM1_b8     <=  ROM1_arr[4][8]  ;
                            ROM1_b9     <=  ROM1_arr[4][9]  ;
                            ROM1_b10    <=  ROM1_arr[4][10] ;
                            ROM1_b11    <=  ROM1_arr[4][11] ;
                            ROM1_b12    <=  ROM1_arr[4][12] ;
                            ROM1_b13    <=  ROM1_arr[4][13] ;
                            ROM1_b14    <=  ROM1_arr[4][14] ;
                            ROM1_b15    <=  ROM1_arr[4][15] ;
                        end
                    4'd5:
                        begin
                            ROM1_b0     <=  ROM1_arr[5][0]  ;
                            ROM1_b1     <=  ROM1_arr[5][1]  ;
                            ROM1_b2     <=  ROM1_arr[5][2]  ;
                            ROM1_b3     <=  ROM1_arr[5][3]  ;
                            ROM1_b4     <=  ROM1_arr[5][4]  ;
                            ROM1_b5     <=  ROM1_arr[5][5]  ;
                            ROM1_b6     <=  ROM1_arr[5][6]  ;
                            ROM1_b7     <=  ROM1_arr[5][7]  ;
                            ROM1_b8     <=  ROM1_arr[5][8]  ;
                            ROM1_b9     <=  ROM1_arr[5][9]  ;
                            ROM1_b10    <=  ROM1_arr[5][10] ;
                            ROM1_b11    <=  ROM1_arr[5][11] ;
                            ROM1_b12    <=  ROM1_arr[5][12] ;
                            ROM1_b13    <=  ROM1_arr[5][13] ;
                            ROM1_b14    <=  ROM1_arr[5][14] ;
                            ROM1_b15    <=  ROM1_arr[5][15] ;
                        end
                    4'd6:
                        begin
                            ROM1_b0     <=  ROM1_arr[6][0]  ;
                            ROM1_b1     <=  ROM1_arr[6][1]  ;
                            ROM1_b2     <=  ROM1_arr[6][2]  ;
                            ROM1_b3     <=  ROM1_arr[6][3]  ;
                            ROM1_b4     <=  ROM1_arr[6][4]  ;
                            ROM1_b5     <=  ROM1_arr[6][5]  ;
                            ROM1_b6     <=  ROM1_arr[6][6]  ;
                            ROM1_b7     <=  ROM1_arr[6][7]  ;
                            ROM1_b8     <=  ROM1_arr[6][8]  ;
                            ROM1_b9     <=  ROM1_arr[6][9]  ;
                            ROM1_b10    <=  ROM1_arr[6][10] ;
                            ROM1_b11    <=  ROM1_arr[6][11] ;
                            ROM1_b12    <=  ROM1_arr[6][12] ;
                            ROM1_b13    <=  ROM1_arr[6][13] ;
                            ROM1_b14    <=  ROM1_arr[6][14] ;
                            ROM1_b15    <=  ROM1_arr[6][15] ;
                        end
                    4'd7:
                        begin
                            ROM1_b0     <=  ROM1_arr[7][0]  ;
                            ROM1_b1     <=  ROM1_arr[7][1]  ;
                            ROM1_b2     <=  ROM1_arr[7][2]  ;
                            ROM1_b3     <=  ROM1_arr[7][3]  ;
                            ROM1_b4     <=  ROM1_arr[7][4]  ;
                            ROM1_b5     <=  ROM1_arr[7][5]  ;
                            ROM1_b6     <=  ROM1_arr[7][6]  ;
                            ROM1_b7     <=  ROM1_arr[7][7]  ;
                            ROM1_b8     <=  ROM1_arr[7][8]  ;
                            ROM1_b9     <=  ROM1_arr[7][9]  ;
                            ROM1_b10    <=  ROM1_arr[7][10] ;
                            ROM1_b11    <=  ROM1_arr[7][11] ;
                            ROM1_b12    <=  ROM1_arr[7][12] ;
                            ROM1_b13    <=  ROM1_arr[7][13] ;
                            ROM1_b14    <=  ROM1_arr[7][14] ;
                            ROM1_b15    <=  ROM1_arr[7][15] ;
                        end
                    4'd8:
                        begin
                            ROM1_b0     <=  ROM1_arr[8][0]  ;
                            ROM1_b1     <=  ROM1_arr[8][1]  ;
                            ROM1_b2     <=  ROM1_arr[8][2]  ;
                            ROM1_b3     <=  ROM1_arr[8][3]  ;
                            ROM1_b4     <=  ROM1_arr[8][4]  ;
                            ROM1_b5     <=  ROM1_arr[8][5]  ;
                            ROM1_b6     <=  ROM1_arr[8][6]  ;
                            ROM1_b7     <=  ROM1_arr[8][7]  ;
                            ROM1_b8     <=  ROM1_arr[8][8]  ;
                            ROM1_b9     <=  ROM1_arr[8][9]  ;
                            ROM1_b10    <=  ROM1_arr[8][10] ;
                            ROM1_b11    <=  ROM1_arr[8][11] ;
                            ROM1_b12    <=  ROM1_arr[8][12] ;
                            ROM1_b13    <=  ROM1_arr[8][13] ;
                            ROM1_b14    <=  ROM1_arr[8][14] ;
                            ROM1_b15    <=  ROM1_arr[8][15] ;
                        end
                    4'd9:
                        begin
                            ROM1_b0     <=  ROM1_arr[9][0]  ;
                            ROM1_b1     <=  ROM1_arr[9][1]  ;
                            ROM1_b2     <=  ROM1_arr[9][2]  ;
                            ROM1_b3     <=  ROM1_arr[9][3]  ;
                            ROM1_b4     <=  ROM1_arr[9][4]  ;
                            ROM1_b5     <=  ROM1_arr[9][5]  ;
                            ROM1_b6     <=  ROM1_arr[9][6]  ;
                            ROM1_b7     <=  ROM1_arr[9][7]  ;
                            ROM1_b8     <=  ROM1_arr[9][8]  ;
                            ROM1_b9     <=  ROM1_arr[9][9]  ;
                            ROM1_b10    <=  ROM1_arr[9][10] ;
                            ROM1_b11    <=  ROM1_arr[9][11] ;
                            ROM1_b12    <=  ROM1_arr[9][12] ;
                            ROM1_b13    <=  ROM1_arr[9][13] ;
                            ROM1_b14    <=  ROM1_arr[9][14] ;
                            ROM1_b15    <=  ROM1_arr[9][15] ;
                        end
                    4'd10:
                        begin
                            ROM1_b0     <=  ROM1_arr[10][0]  ;
                            ROM1_b1     <=  ROM1_arr[10][1]  ;
                            ROM1_b2     <=  ROM1_arr[10][2]  ;
                            ROM1_b3     <=  ROM1_arr[10][3]  ;
                            ROM1_b4     <=  ROM1_arr[10][4]  ;
                            ROM1_b5     <=  ROM1_arr[10][5]  ;
                            ROM1_b6     <=  ROM1_arr[10][6]  ;
                            ROM1_b7     <=  ROM1_arr[10][7]  ;
                            ROM1_b8     <=  ROM1_arr[10][8]  ;
                            ROM1_b9     <=  ROM1_arr[10][9]  ;
                            ROM1_b10    <=  ROM1_arr[10][10] ;
                            ROM1_b11    <=  ROM1_arr[10][11] ;
                            ROM1_b12    <=  ROM1_arr[10][12] ;
                            ROM1_b13    <=  ROM1_arr[10][13] ;
                            ROM1_b14    <=  ROM1_arr[10][14] ;
                            ROM1_b15    <=  ROM1_arr[10][15] ;
                        end
                    4'd11:
                        begin
                            ROM1_b0     <=  ROM1_arr[11][0]  ;
                            ROM1_b1     <=  ROM1_arr[11][1]  ;
                            ROM1_b2     <=  ROM1_arr[11][2]  ;
                            ROM1_b3     <=  ROM1_arr[11][3]  ;
                            ROM1_b4     <=  ROM1_arr[11][4]  ;
                            ROM1_b5     <=  ROM1_arr[11][5]  ;
                            ROM1_b6     <=  ROM1_arr[11][6]  ;
                            ROM1_b7     <=  ROM1_arr[11][7]  ;
                            ROM1_b8     <=  ROM1_arr[11][8]  ;
                            ROM1_b9     <=  ROM1_arr[11][9]  ;
                            ROM1_b10    <=  ROM1_arr[11][10] ;
                            ROM1_b11    <=  ROM1_arr[11][11] ;
                            ROM1_b12    <=  ROM1_arr[11][12] ;
                            ROM1_b13    <=  ROM1_arr[11][13] ;
                            ROM1_b14    <=  ROM1_arr[11][14] ;
                            ROM1_b15    <=  ROM1_arr[11][15] ;
                        end
                    4'd12:
                        begin
                            ROM1_b0     <=  ROM1_arr[12][0]  ;
                            ROM1_b1     <=  ROM1_arr[12][1]  ;
                            ROM1_b2     <=  ROM1_arr[12][2]  ;
                            ROM1_b3     <=  ROM1_arr[12][3]  ;
                            ROM1_b4     <=  ROM1_arr[12][4]  ;
                            ROM1_b5     <=  ROM1_arr[12][5]  ;
                            ROM1_b6     <=  ROM1_arr[12][6]  ;
                            ROM1_b7     <=  ROM1_arr[12][7]  ;
                            ROM1_b8     <=  ROM1_arr[12][8]  ;
                            ROM1_b9     <=  ROM1_arr[12][9]  ;
                            ROM1_b10    <=  ROM1_arr[12][10] ;
                            ROM1_b11    <=  ROM1_arr[12][11] ;
                            ROM1_b12    <=  ROM1_arr[12][12] ;
                            ROM1_b13    <=  ROM1_arr[12][13] ;
                            ROM1_b14    <=  ROM1_arr[12][14] ;
                            ROM1_b15    <=  ROM1_arr[12][15] ;
                        end
                    4'd13:
                        begin
                            ROM1_b0     <=  ROM1_arr[13][0]  ;
                            ROM1_b1     <=  ROM1_arr[13][1]  ;
                            ROM1_b2     <=  ROM1_arr[13][2]  ;
                            ROM1_b3     <=  ROM1_arr[13][3]  ;
                            ROM1_b4     <=  ROM1_arr[13][4]  ;
                            ROM1_b5     <=  ROM1_arr[13][5]  ;
                            ROM1_b6     <=  ROM1_arr[13][6]  ;
                            ROM1_b7     <=  ROM1_arr[13][7]  ;
                            ROM1_b8     <=  ROM1_arr[13][8]  ;
                            ROM1_b9     <=  ROM1_arr[13][9]  ;
                            ROM1_b10    <=  ROM1_arr[13][10] ;
                            ROM1_b11    <=  ROM1_arr[13][11] ;
                            ROM1_b12    <=  ROM1_arr[13][12] ;
                            ROM1_b13    <=  ROM1_arr[13][13] ;
                            ROM1_b14    <=  ROM1_arr[13][14] ;
                            ROM1_b15    <=  ROM1_arr[13][15] ;
                        end
                    4'd14:
                        begin
                            ROM1_b0     <=  ROM1_arr[14][0]  ;
                            ROM1_b1     <=  ROM1_arr[14][1]  ;
                            ROM1_b2     <=  ROM1_arr[14][2]  ;
                            ROM1_b3     <=  ROM1_arr[14][3]  ;
                            ROM1_b4     <=  ROM1_arr[14][4]  ;
                            ROM1_b5     <=  ROM1_arr[14][5]  ;
                            ROM1_b6     <=  ROM1_arr[14][6]  ;
                            ROM1_b7     <=  ROM1_arr[14][7]  ;
                            ROM1_b8     <=  ROM1_arr[14][8]  ;
                            ROM1_b9     <=  ROM1_arr[14][9]  ;
                            ROM1_b10    <=  ROM1_arr[14][10] ;
                            ROM1_b11    <=  ROM1_arr[14][11] ;
                            ROM1_b12    <=  ROM1_arr[14][12] ;
                            ROM1_b13    <=  ROM1_arr[14][13] ;
                            ROM1_b14    <=  ROM1_arr[14][14] ;
                            ROM1_b15    <=  ROM1_arr[14][15] ;
                        end
                    4'd15:
                        begin
                            ROM1_b0     <=  ROM1_arr[15][0]  ;
                            ROM1_b1     <=  ROM1_arr[15][1]  ;
                            ROM1_b2     <=  ROM1_arr[15][2]  ;
                            ROM1_b3     <=  ROM1_arr[15][3]  ;
                            ROM1_b4     <=  ROM1_arr[15][4]  ;
                            ROM1_b5     <=  ROM1_arr[15][5]  ;
                            ROM1_b6     <=  ROM1_arr[15][6]  ;
                            ROM1_b7     <=  ROM1_arr[15][7]  ;
                            ROM1_b8     <=  ROM1_arr[15][8]  ;
                            ROM1_b9     <=  ROM1_arr[15][9]  ;
                            ROM1_b10    <=  ROM1_arr[15][10] ;
                            ROM1_b11    <=  ROM1_arr[15][11] ;
                            ROM1_b12    <=  ROM1_arr[15][12] ;
                            ROM1_b13    <=  ROM1_arr[15][13] ;
                            ROM1_b14    <=  ROM1_arr[15][14] ;
                            ROM1_b15    <=  ROM1_arr[15][15] ;
                        end
                endcase
            end
        end
    end

    always @( posedge clk or negedge rst_n ) begin
        if (~rst_n) begin
            ROM2_b0     <= 64'd0    ;
            ROM2_b1     <= 64'd0    ;
            ROM2_b2     <= 64'd0    ;
            ROM2_b3     <= 64'd0    ;
            ROM2_b4     <= 64'd0    ;
            ROM2_b5     <= 64'd0    ;
            ROM2_b6     <= 64'd0    ;
            ROM2_b7     <= 64'd0    ;
            ROM2_b8     <= 64'd0    ;
            ROM2_b9     <= 64'd0    ;
            ROM2_b10    <= 64'd0    ;
            ROM2_b11    <= 64'd0    ;
            ROM2_b12    <= 64'd0    ; 
            ROM2_b13    <= 64'd0    ;
            ROM2_b14    <= 64'd0    ; 
            ROM2_b15    <= 64'd0    ;
        end else begin
            if (~ROM_CEN) begin
                case (MA2)
                    4'd0:
                        begin
                            ROM2_b0     <=  ROM2_arr[0][0]  ;
                            ROM2_b1     <=  ROM2_arr[0][1]  ;
                            ROM2_b2     <=  ROM2_arr[0][2]  ;
                            ROM2_b3     <=  ROM2_arr[0][3]  ;
                            ROM2_b4     <=  ROM2_arr[0][4]  ;
                            ROM2_b5     <=  ROM2_arr[0][5]  ;
                            ROM2_b6     <=  ROM2_arr[0][6]  ;
                            ROM2_b7     <=  ROM2_arr[0][7]  ;
                            ROM2_b8     <=  ROM2_arr[0][8]  ;
                            ROM2_b9     <=  ROM2_arr[0][9]  ;
                            ROM2_b10    <=  ROM2_arr[0][10] ;
                            ROM2_b11    <=  ROM2_arr[0][11] ;
                            ROM2_b12    <=  ROM2_arr[0][12] ;
                            ROM2_b13    <=  ROM2_arr[0][13] ;
                            ROM2_b14    <=  ROM2_arr[0][14] ;
                            ROM2_b15    <=  ROM2_arr[0][15] ;
                        end
                    4'd1:
                        begin
                            ROM2_b0     <=  ROM2_arr[1][0]  ;
                            ROM2_b1     <=  ROM2_arr[1][1]  ;
                            ROM2_b2     <=  ROM2_arr[1][2]  ;
                            ROM2_b3     <=  ROM2_arr[1][3]  ;
                            ROM2_b4     <=  ROM2_arr[1][4]  ;
                            ROM2_b5     <=  ROM2_arr[1][5]  ;
                            ROM2_b6     <=  ROM2_arr[1][6]  ;
                            ROM2_b7     <=  ROM2_arr[1][7]  ;
                            ROM2_b8     <=  ROM2_arr[1][8]  ;
                            ROM2_b9     <=  ROM2_arr[1][9]  ;
                            ROM2_b10    <=  ROM2_arr[1][10] ;
                            ROM2_b11    <=  ROM2_arr[1][11] ;
                            ROM2_b12    <=  ROM2_arr[1][12] ;
                            ROM2_b13    <=  ROM2_arr[1][13] ;
                            ROM2_b14    <=  ROM2_arr[1][14] ;
                            ROM2_b15    <=  ROM2_arr[1][15] ;
                        end
                    4'd2:
                        begin
                            ROM2_b0     <=  ROM2_arr[2][0]  ;
                            ROM2_b1     <=  ROM2_arr[2][1]  ;
                            ROM2_b2     <=  ROM2_arr[2][2]  ;
                            ROM2_b3     <=  ROM2_arr[2][3]  ;
                            ROM2_b4     <=  ROM2_arr[2][4]  ;
                            ROM2_b5     <=  ROM2_arr[2][5]  ;
                            ROM2_b6     <=  ROM2_arr[2][6]  ;
                            ROM2_b7     <=  ROM2_arr[2][7]  ;
                            ROM2_b8     <=  ROM2_arr[2][8]  ;
                            ROM2_b9     <=  ROM2_arr[2][9]  ;
                            ROM2_b10    <=  ROM2_arr[2][10] ;
                            ROM2_b11    <=  ROM2_arr[2][11] ;
                            ROM2_b12    <=  ROM2_arr[2][12] ;
                            ROM2_b13    <=  ROM2_arr[2][13] ;
                            ROM2_b14    <=  ROM2_arr[2][14] ;
                            ROM2_b15    <=  ROM2_arr[2][15] ;
                        end
                    4'd3:
                        begin
                            ROM2_b0     <=  ROM2_arr[3][0]  ;
                            ROM2_b1     <=  ROM2_arr[3][1]  ;
                            ROM2_b2     <=  ROM2_arr[3][2]  ;
                            ROM2_b3     <=  ROM2_arr[3][3]  ;
                            ROM2_b4     <=  ROM2_arr[3][4]  ;
                            ROM2_b5     <=  ROM2_arr[3][5]  ;
                            ROM2_b6     <=  ROM2_arr[3][6]  ;
                            ROM2_b7     <=  ROM2_arr[3][7]  ;
                            ROM2_b8     <=  ROM2_arr[3][8]  ;
                            ROM2_b9     <=  ROM2_arr[3][9]  ;
                            ROM2_b10    <=  ROM2_arr[3][10] ;
                            ROM2_b11    <=  ROM2_arr[3][11] ;
                            ROM2_b12    <=  ROM2_arr[3][12] ;
                            ROM2_b13    <=  ROM2_arr[3][13] ;
                            ROM2_b14    <=  ROM2_arr[3][14] ;
                            ROM2_b15    <=  ROM2_arr[3][15] ;
                        end
                    4'd4:
                        begin
                            ROM2_b0     <=  ROM2_arr[4][0]  ;
                            ROM2_b1     <=  ROM2_arr[4][1]  ;
                            ROM2_b2     <=  ROM2_arr[4][2]  ;
                            ROM2_b3     <=  ROM2_arr[4][3]  ;
                            ROM2_b4     <=  ROM2_arr[4][4]  ;
                            ROM2_b5     <=  ROM2_arr[4][5]  ;
                            ROM2_b6     <=  ROM2_arr[4][6]  ;
                            ROM2_b7     <=  ROM2_arr[4][7]  ;
                            ROM2_b8     <=  ROM2_arr[4][8]  ;
                            ROM2_b9     <=  ROM2_arr[4][9]  ;
                            ROM2_b10    <=  ROM2_arr[4][10] ;
                            ROM2_b11    <=  ROM2_arr[4][11] ;
                            ROM2_b12    <=  ROM2_arr[4][12] ;
                            ROM2_b13    <=  ROM2_arr[4][13] ;
                            ROM2_b14    <=  ROM2_arr[4][14] ;
                            ROM2_b15    <=  ROM2_arr[4][15] ;
                        end
                    4'd5:
                        begin
                            ROM2_b0     <=  ROM2_arr[5][0]  ;
                            ROM2_b1     <=  ROM2_arr[5][1]  ;
                            ROM2_b2     <=  ROM2_arr[5][2]  ;
                            ROM2_b3     <=  ROM2_arr[5][3]  ;
                            ROM2_b4     <=  ROM2_arr[5][4]  ;
                            ROM2_b5     <=  ROM2_arr[5][5]  ;
                            ROM2_b6     <=  ROM2_arr[5][6]  ;
                            ROM2_b7     <=  ROM2_arr[5][7]  ;
                            ROM2_b8     <=  ROM2_arr[5][8]  ;
                            ROM2_b9     <=  ROM2_arr[5][9]  ;
                            ROM2_b10    <=  ROM2_arr[5][10] ;
                            ROM2_b11    <=  ROM2_arr[5][11] ;
                            ROM2_b12    <=  ROM2_arr[5][12] ;
                            ROM2_b13    <=  ROM2_arr[5][13] ;
                            ROM2_b14    <=  ROM2_arr[5][14] ;
                            ROM2_b15    <=  ROM2_arr[5][15] ;
                        end
                    4'd6:
                        begin
                            ROM2_b0     <=  ROM2_arr[6][0]  ;
                            ROM2_b1     <=  ROM2_arr[6][1]  ;
                            ROM2_b2     <=  ROM2_arr[6][2]  ;
                            ROM2_b3     <=  ROM2_arr[6][3]  ;
                            ROM2_b4     <=  ROM2_arr[6][4]  ;
                            ROM2_b5     <=  ROM2_arr[6][5]  ;
                            ROM2_b6     <=  ROM2_arr[6][6]  ;
                            ROM2_b7     <=  ROM2_arr[6][7]  ;
                            ROM2_b8     <=  ROM2_arr[6][8]  ;
                            ROM2_b9     <=  ROM2_arr[6][9]  ;
                            ROM2_b10    <=  ROM2_arr[6][10] ;
                            ROM2_b11    <=  ROM2_arr[6][11] ;
                            ROM2_b12    <=  ROM2_arr[6][12] ;
                            ROM2_b13    <=  ROM2_arr[6][13] ;
                            ROM2_b14    <=  ROM2_arr[6][14] ;
                            ROM2_b15    <=  ROM2_arr[6][15] ;
                        end
                    4'd7:
                        begin
                            ROM2_b0     <=  ROM2_arr[7][0]  ;
                            ROM2_b1     <=  ROM2_arr[7][1]  ;
                            ROM2_b2     <=  ROM2_arr[7][2]  ;
                            ROM2_b3     <=  ROM2_arr[7][3]  ;
                            ROM2_b4     <=  ROM2_arr[7][4]  ;
                            ROM2_b5     <=  ROM2_arr[7][5]  ;
                            ROM2_b6     <=  ROM2_arr[7][6]  ;
                            ROM2_b7     <=  ROM2_arr[7][7]  ;
                            ROM2_b8     <=  ROM2_arr[7][8]  ;
                            ROM2_b9     <=  ROM2_arr[7][9]  ;
                            ROM2_b10    <=  ROM2_arr[7][10] ;
                            ROM2_b11    <=  ROM2_arr[7][11] ;
                            ROM2_b12    <=  ROM2_arr[7][12] ;
                            ROM2_b13    <=  ROM2_arr[7][13] ;
                            ROM2_b14    <=  ROM2_arr[7][14] ;
                            ROM2_b15    <=  ROM2_arr[7][15] ;
                        end
                    4'd8:
                        begin
                            ROM2_b0     <=  ROM2_arr[8][0]  ;
                            ROM2_b1     <=  ROM2_arr[8][1]  ;
                            ROM2_b2     <=  ROM2_arr[8][2]  ;
                            ROM2_b3     <=  ROM2_arr[8][3]  ;
                            ROM2_b4     <=  ROM2_arr[8][4]  ;
                            ROM2_b5     <=  ROM2_arr[8][5]  ;
                            ROM2_b6     <=  ROM2_arr[8][6]  ;
                            ROM2_b7     <=  ROM2_arr[8][7]  ;
                            ROM2_b8     <=  ROM2_arr[8][8]  ;
                            ROM2_b9     <=  ROM2_arr[8][9]  ;
                            ROM2_b10    <=  ROM2_arr[8][10] ;
                            ROM2_b11    <=  ROM2_arr[8][11] ;
                            ROM2_b12    <=  ROM2_arr[8][12] ;
                            ROM2_b13    <=  ROM2_arr[8][13] ;
                            ROM2_b14    <=  ROM2_arr[8][14] ;
                            ROM2_b15    <=  ROM2_arr[8][15] ;
                        end
                    4'd9:
                        begin
                            ROM2_b0     <=  ROM2_arr[9][0]  ;
                            ROM2_b1     <=  ROM2_arr[9][1]  ;
                            ROM2_b2     <=  ROM2_arr[9][2]  ;
                            ROM2_b3     <=  ROM2_arr[9][3]  ;
                            ROM2_b4     <=  ROM2_arr[9][4]  ;
                            ROM2_b5     <=  ROM2_arr[9][5]  ;
                            ROM2_b6     <=  ROM2_arr[9][6]  ;
                            ROM2_b7     <=  ROM2_arr[9][7]  ;
                            ROM2_b8     <=  ROM2_arr[9][8]  ;
                            ROM2_b9     <=  ROM2_arr[9][9]  ;
                            ROM2_b10    <=  ROM2_arr[9][10] ;
                            ROM2_b11    <=  ROM2_arr[9][11] ;
                            ROM2_b12    <=  ROM2_arr[9][12] ;
                            ROM2_b13    <=  ROM2_arr[9][13] ;
                            ROM2_b14    <=  ROM2_arr[9][14] ;
                            ROM2_b15    <=  ROM2_arr[9][15] ;
                        end
                    4'd10:
                        begin
                            ROM2_b0     <=  ROM2_arr[10][0]  ;
                            ROM2_b1     <=  ROM2_arr[10][1]  ;
                            ROM2_b2     <=  ROM2_arr[10][2]  ;
                            ROM2_b3     <=  ROM2_arr[10][3]  ;
                            ROM2_b4     <=  ROM2_arr[10][4]  ;
                            ROM2_b5     <=  ROM2_arr[10][5]  ;
                            ROM2_b6     <=  ROM2_arr[10][6]  ;
                            ROM2_b7     <=  ROM2_arr[10][7]  ;
                            ROM2_b8     <=  ROM2_arr[10][8]  ;
                            ROM2_b9     <=  ROM2_arr[10][9]  ;
                            ROM2_b10    <=  ROM2_arr[10][10] ;
                            ROM2_b11    <=  ROM2_arr[10][11] ;
                            ROM2_b12    <=  ROM2_arr[10][12] ;
                            ROM2_b13    <=  ROM2_arr[10][13] ;
                            ROM2_b14    <=  ROM2_arr[10][14] ;
                            ROM2_b15    <=  ROM2_arr[10][15] ;
                        end
                    4'd11:
                        begin
                            ROM2_b0     <=  ROM2_arr[11][0]  ;
                            ROM2_b1     <=  ROM2_arr[11][1]  ;
                            ROM2_b2     <=  ROM2_arr[11][2]  ;
                            ROM2_b3     <=  ROM2_arr[11][3]  ;
                            ROM2_b4     <=  ROM2_arr[11][4]  ;
                            ROM2_b5     <=  ROM2_arr[11][5]  ;
                            ROM2_b6     <=  ROM2_arr[11][6]  ;
                            ROM2_b7     <=  ROM2_arr[11][7]  ;
                            ROM2_b8     <=  ROM2_arr[11][8]  ;
                            ROM2_b9     <=  ROM2_arr[11][9]  ;
                            ROM2_b10    <=  ROM2_arr[11][10] ;
                            ROM2_b11    <=  ROM2_arr[11][11] ;
                            ROM2_b12    <=  ROM2_arr[11][12] ;
                            ROM2_b13    <=  ROM2_arr[11][13] ;
                            ROM2_b14    <=  ROM2_arr[11][14] ;
                            ROM2_b15    <=  ROM2_arr[11][15] ;
                        end
                    4'd12:
                        begin
                            ROM2_b0     <=  ROM2_arr[12][0]  ;
                            ROM2_b1     <=  ROM2_arr[12][1]  ;
                            ROM2_b2     <=  ROM2_arr[12][2]  ;
                            ROM2_b3     <=  ROM2_arr[12][3]  ;
                            ROM2_b4     <=  ROM2_arr[12][4]  ;
                            ROM2_b5     <=  ROM2_arr[12][5]  ;
                            ROM2_b6     <=  ROM2_arr[12][6]  ;
                            ROM2_b7     <=  ROM2_arr[12][7]  ;
                            ROM2_b8     <=  ROM2_arr[12][8]  ;
                            ROM2_b9     <=  ROM2_arr[12][9]  ;
                            ROM2_b10    <=  ROM2_arr[12][10] ;
                            ROM2_b11    <=  ROM2_arr[12][11] ;
                            ROM2_b12    <=  ROM2_arr[12][12] ;
                            ROM2_b13    <=  ROM2_arr[12][13] ;
                            ROM2_b14    <=  ROM2_arr[12][14] ;
                            ROM2_b15    <=  ROM2_arr[12][15] ;
                        end
                    4'd13:
                        begin
                            ROM2_b0     <=  ROM2_arr[13][0]  ;
                            ROM2_b1     <=  ROM2_arr[13][1]  ;
                            ROM2_b2     <=  ROM2_arr[13][2]  ;
                            ROM2_b3     <=  ROM2_arr[13][3]  ;
                            ROM2_b4     <=  ROM2_arr[13][4]  ;
                            ROM2_b5     <=  ROM2_arr[13][5]  ;
                            ROM2_b6     <=  ROM2_arr[13][6]  ;
                            ROM2_b7     <=  ROM2_arr[13][7]  ;
                            ROM2_b8     <=  ROM2_arr[13][8]  ;
                            ROM2_b9     <=  ROM2_arr[13][9]  ;
                            ROM2_b10    <=  ROM2_arr[13][10] ;
                            ROM2_b11    <=  ROM2_arr[13][11] ;
                            ROM2_b12    <=  ROM2_arr[13][12] ;
                            ROM2_b13    <=  ROM2_arr[13][13] ;
                            ROM2_b14    <=  ROM2_arr[13][14] ;
                            ROM2_b15    <=  ROM2_arr[13][15] ;
                        end
                    4'd14:
                        begin
                            ROM2_b0     <=  ROM2_arr[14][0]  ;
                            ROM2_b1     <=  ROM2_arr[14][1]  ;
                            ROM2_b2     <=  ROM2_arr[14][2]  ;
                            ROM2_b3     <=  ROM2_arr[14][3]  ;
                            ROM2_b4     <=  ROM2_arr[14][4]  ;
                            ROM2_b5     <=  ROM2_arr[14][5]  ;
                            ROM2_b6     <=  ROM2_arr[14][6]  ;
                            ROM2_b7     <=  ROM2_arr[14][7]  ;
                            ROM2_b8     <=  ROM2_arr[14][8]  ;
                            ROM2_b9     <=  ROM2_arr[14][9]  ;
                            ROM2_b10    <=  ROM2_arr[14][10] ;
                            ROM2_b11    <=  ROM2_arr[14][11] ;
                            ROM2_b12    <=  ROM2_arr[14][12] ;
                            ROM2_b13    <=  ROM2_arr[14][13] ;
                            ROM2_b14    <=  ROM2_arr[14][14] ;
                            ROM2_b15    <=  ROM2_arr[14][15] ;
                        end
                    4'd15:
                        begin
                            ROM2_b0     <=  ROM2_arr[15][0]  ;
                            ROM2_b1     <=  ROM2_arr[15][1]  ;
                            ROM2_b2     <=  ROM2_arr[15][2]  ;
                            ROM2_b3     <=  ROM2_arr[15][3]  ;
                            ROM2_b4     <=  ROM2_arr[15][4]  ;
                            ROM2_b5     <=  ROM2_arr[15][5]  ;
                            ROM2_b6     <=  ROM2_arr[15][6]  ;
                            ROM2_b7     <=  ROM2_arr[15][7]  ;
                            ROM2_b8     <=  ROM2_arr[15][8]  ;
                            ROM2_b9     <=  ROM2_arr[15][9]  ;
                            ROM2_b10    <=  ROM2_arr[15][10] ;
                            ROM2_b11    <=  ROM2_arr[15][11] ;
                            ROM2_b12    <=  ROM2_arr[15][12] ;
                            ROM2_b13    <=  ROM2_arr[15][13] ;
                            ROM2_b14    <=  ROM2_arr[15][14] ;
                            ROM2_b15    <=  ROM2_arr[15][15] ;
                        end
                endcase
            end
        end
    end
endmodule