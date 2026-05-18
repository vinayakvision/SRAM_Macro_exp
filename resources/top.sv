module top (
    input  logic        clk,
    input  logic        cs,
    input  logic        we,
    input  logic [6:0]  addr,
    input  logic [31:0] din,
    output logic [31:0] dout
);

    sram32_wrapper u_mem (
        .clk(clk),
        .cs(cs),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

endmodule

