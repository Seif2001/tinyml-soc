module ahbl_rom (
    input   wire        HCLK,
    input   wire        HRESETn,

    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    input   wire     	HREADY,
    input   wire [2:0]  HSIZE,
    input   wire        HWRITE,
    input   wire        HSEL,
    input   wire [31:0] HWDATA,

    output  wire        HREADYOUT,
    output  wire [31:0] HRDATA
);

    parameter   SIZE = 8 * 1024;
    parameter   VERBOSE = 1;
    parameter   HEX_FILE = "/home/seif/dev/projects/tinyml-soc/test.hex";
    localparam  A_WIDTH = $clog2(SIZE) - 2;

    reg [31:0] RAM[SIZE/4-1 : 0];

    reg [31:0] HADDR_d;
    reg [1:0]  HTRANS_d;
    reg [2:0]  HSIZE_d;
    reg        HWRITE_d;
    reg        HSEL_d;

    always @(posedge HCLK or negedge HRESETn) begin
        if(HRESETn == 1'b0) begin
            HADDR_d     <= 0;
            HTRANS_d    <= 0;
            HSIZE_d     <= 0;
            HWRITE_d    <= 0;
            HSEL_d      <= 0;
        end else if(HREADY == 1'b1) begin
            HADDR_d     <= HADDR;
            HTRANS_d    <= HTRANS;
            HSIZE_d     <= HSIZE;
            HWRITE_d    <= HWRITE;
            HSEL_d      <= HSEL;
        end 
    end

    assign HRDATA = RAM[HADDR_d[A_WIDTH-1 : 2]];

    assign HREADYOUT = 1'b1; // Always ready

    initial begin
        $readmemh(HEX_FILE, RAM);
    end

endmodule

