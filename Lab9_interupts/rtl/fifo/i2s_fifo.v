module i2s_fifo #(parameter DW=32, AW=4)(
    input wire clk,
    input wire rst_n,
    input wire en,
    output wire empty,
    output wire full,
    output wire [DW-1:0] rdata,
    input wire rd,
    output wire SCK,
    output wire WS,
    input wire SD,
    output wire led_output
);

// i2s signals
wire tick;
wire [DW-1:0] sample;
wire rdy;
wire wr = WS & rdy;
// fifo signals
wire level;

i2s i2s (
    .clk(clk),
    .rst_n(rst_n),
    .mode(en),
    .rdy(rdy),
    .tick(tick),
    .sample(sample),
    .SD(SD),
    .SCK(SCK),
    .WS(WS)
);

tmr timer (
    .clk(clk),
    .rst_n(rst_n),
    .clkdiv('h00),
    .load('h03),
    .en(en),
    .irq(tick)
);

aucohl_fifo #(DW, AW) fifo (
    .clk(clk),
    .rst_n(rst_n),
    .rd(rd),
    .wr(wr),
    .flush(1'b0),
    .wdata(sample),
    .empty(empty),
    .full(full),
    .rdata(rdata),
    .level(level)
);

i2s_vad vad_inst (
    .clk(clk),
    .rst_n(rst_n),
    .sample(sample),
    .rdy(rdy),
    .led_output(led_output)
);

endmodule

