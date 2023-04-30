`include "../v_include/define.svh"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B0_64_64.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B1_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B2_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B3_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B4_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B5_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B6_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM0_B7_64_128.v"

`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B0_64_64.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B1_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B2_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B3_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B4_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B5_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B6_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM1_B7_64_128.v"

`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B0_64_64.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B1_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B2_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B3_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B4_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B5_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B6_64_128.v"
`include "../ROM_DATA/ROM0/ROM0_v/ROM2_B7_64_128.v"

module ROM_wrapper (
    input clk,
    input rst,
    
);

    // ROM0
    ROM0_B0_64_64 ROM0_B0(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B1_64_128 ROM0_B1(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );
    
    ROM0_B2_64_128 ROM0_B2(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B3_64_128 ROM0_B3(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B4_64_128 ROM0_B4(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B5_64_128 ROM0_B5(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B6_64_128 ROM0_B6(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM0_B7_64_128 ROM0_B7(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    // ROM1
    ROM1_B0_64_64 ROM1_B0(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B1_64_128 ROM1_B1(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );
    
    ROM1_B2_64_128 ROM1_B2(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B3_64_128 ROM1_B3(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B4_64_128 ROM1_B4(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B5_64_128 ROM1_B5(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B6_64_128 ROM1_B6(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM1_B7_64_128 ROM1_B7(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    // ROM2
    ROM2_B0_64_64 ROM2_B0(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B1_64_128 ROM2_B1(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );
    
    ROM2_B2_64_128 ROM2_B2(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B3_64_128 ROM2_B3(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B4_64_128 ROM2_B4(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B5_64_128 ROM2_B5(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B6_64_128 ROM2_B6(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );

    ROM2_B7_64_128 ROM2_B7(
        Q       (),
        CLK     (clk),
        CEN     (),
        A       ()
    );
endmodule