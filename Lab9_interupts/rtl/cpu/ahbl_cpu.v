module ahbl_cpu (
    input   wire        HCLK,
    input   wire        HRESETn,

    output  wire [31:0] HADDR,
    output  reg  [1:0]  HTRANS,
    output  reg  [2:0] 	HSIZE,
    output  wire        HWRITE,
    output  wire [31:0] HWDATA,
    input   wire        HREADY,
    input   wire [31:0] HRDATA,
    input   wire        interrupt_request
);

    wire [3:0] mem_wmask;
    wire mem_rstrb;


    FemtoRV32 cpu (
        .clk(HCLK),
        .resetn(HRESETn),

        .mem_addr(HADDR),
        .mem_wdata(HWDATA),
        .mem_wmask(mem_wmask),
        .mem_rdata(HRDATA),
        .mem_rstrb(mem_rstrb),
        .mem_rbusy(!HREADY),
        .mem_wbusy(!HREADY),
        .interrupt_request(interrupt_request)
    );

    assign HWRITE = |mem_wmask;

    

  // HTRANS logic
    always @(posedge HCLK, negedge HRESETn) begin
        if (~HRESETn) begin
            HTRANS = 2'b00; // IDLE on reset
        end else if (HREADY && (mem_rstrb || HWRITE)) begin
            HTRANS = 2'b10; // NONSEQ if ready and a valid transaction exists
        end else begin
            HTRANS = 2'b00; // IDLE if not ready or no transaction
        end
    end

    // HSIZE logic

    always @(posedge HCLK, negedge HRESETn) begin
        if (~HRESETn) begin
            HSIZE = 3'b010; // 32-bit on reset
        end
        else if (HREADY && (mem_rstrb || HWRITE)) begin
            case (mem_wmask)
                4'b0001: HSIZE = 3'b000; // 8-bit
                4'b0011: HSIZE = 3'b001; // 16-bit
                4'b1111: HSIZE = 3'b010; // 32-bit
                default: HSIZE = 3'b010; // 32-bit
            endcase
        end
        else begin
            HSIZE = 3'b010; // 32-bit
        end
    end




    

endmodule