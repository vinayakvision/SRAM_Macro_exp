module sram32_wrapper (
    input  logic        clk,
    input  logic        cs,
    input  logic        we,
    input  logic [6:0]  addr,
    input  logic [31:0] din,
    output logic [31:0] dout
);

`ifdef SYNTHESIS

    /* Lower 16 bits */
    ram_128x16A ram_lo (
        .CLK(clk),
        .CEN(~cs),
        .OEN(1'b0),
        .WEN(~we),
        .A(addr),
        .D(din[15:0]),
        .Q(dout[15:0])
    );

    /* Upper 16 bits */
    ram_128x16A ram_hi (
        .CLK(clk),
        .CEN(~cs),
        .OEN(1'b0),
        .WEN(~we),
        .A(addr),
        .D(din[31:16]),
        .Q(dout[31:16])
    );

`else

    /* Behavioral memory for simulation */
    logic [31:0] mem [0:127];

    always_ff @(posedge clk) begin
        if (cs) begin
            if (we)
                mem[addr] <= din;
            dout <= mem[addr];
        end
    end

`endif

endmodule

