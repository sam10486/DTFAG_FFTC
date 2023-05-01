`include "../v_include/define.svh"
`include "DTFAG_AGU.sv"
`include "ROM_wrapper.sv"


module DTFAG_top (
    input clk,
    input rst,
);

    DTFAG_AGU AGU(
        .clk        (clk    ),
        .rst        (rst    ),
        .DTFAG_i    (DTFAG_i),
        .DTFAG_t    (DTFAG_t),
        .DTFAG_j    (DTFAG_j),
        .MA0        (MA0    ),
        .MA1        (MA1    ),
        .MA2        (MA2    ),
        .MA3        (MA3    )
    );


    ROM_wrapper ROM_wrapper(
        .clk(),
    );
endmodule