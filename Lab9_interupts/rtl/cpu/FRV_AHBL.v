module FRV_AHBL(
    input   wire        HCLK,
    input   wire        HRESETn,
    output  wire [31:0] HADDR,
    output  wire [1:0]  HTRANS,
    output  wire [2:0] 	HSIZE,
    output  wire        HWRITE,
    output  wire [31:0] HWDATA,
    input   wire        HREADY,
    input   wire [31:0] HRDATA,
    input   wire        IRQ
  );

    wire [3:0]  mem_wmask;
    wire        mem_rstrb;
    wire        mem_rbusy;
    wire        mem_wbusy;

    FemtoRV32 #(.ADDR_WIDTH(32)) CPU (
        .clk(HCLK),
        .mem_addr(HADDR),
        .mem_wdata(HWDATA),
        .mem_wmask(mem_wmask),
        .mem_rdata(HRDATA),
        .mem_rstrb(mem_rstrb),
        .mem_rbusy(mem_rbusy),
        .mem_wbusy(mem_wbusy),
        .interrupt_request(IRQ),
        .rst_n(HRESETn)
    );

    assign HSIZE    =   (^mem_wmask) ? 3'b000 :
                        (&mem_wmask) ? 3'b010 : 3'b001;

    assign HWRITE   =   (mem_wmask != 0);

    assign HTRANS   =   {(HWRITE | mem_rstrb), 1'b0};

    assign mem_rbusy=   !HREADY;
    assign mem_wbusy=   !HREADY;

endmodule