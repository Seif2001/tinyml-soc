module ahbl_ram (
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
    localparam  A_WIDTH = $clog2(SIZE) - 2;

    reg [7:0] BRAM0[SIZE/4-1 : 0];
    reg [7:0] BRAM1[SIZE/4-1 : 0];
    reg [7:0] BRAM2[SIZE/4-1 : 0];
    reg [7:0] BRAM3[SIZE/4-1 : 0];


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

    wire ahbl_we        = HTRANS_d[1] & HSEL_d & HWRITE_d;

    // Data Size Decoder
    wire ds_byte = (HSIZE_d == 3'b000); 
    wire ds_half = (HSIZE_d == 3'b001);
    wire ds_word = (HSIZE_d == 3'b010);

    // Byte Location within the Memory Word
    wire byte_at_00 = ds_byte & (HADDR_d[1:0] == 2'b00);
    wire byte_at_01 = ds_byte & (HADDR_d[1:0] == 2'b01);
    wire byte_at_10 = ds_byte & (HADDR_d[1:0] == 2'b10);
    wire byte_at_11 = ds_byte & (HADDR_d[1:0] == 2'b11);

    // Half-word Location within the Memory Word
    wire half_at_00 = ds_half & ~HADDR_d[1];
    wire half_at_10 = ds_half &  HADDR_d[1];

    wire word_at_00 = ds_word;

    // Which byte to write -- Byte write enables
    wire byte0 = word_at_00 | half_at_00 | byte_at_00;
    wire byte1 = word_at_00 | half_at_00 | byte_at_01;
    wire byte2 = word_at_00 | half_at_10 | byte_at_10;
    wire byte3 = word_at_00 | half_at_10 | byte_at_11;

    // Writing to the memory
    always @(posedge HCLK)
    begin
        if(ahbl_we) begin
            if(VERBOSE)
                $display("Write [%x] to SRAM: [%x]=%x (%0t)", HSIZE_d, HADDR_d, HWDATA, $time);
            if(byte0) BRAM0[HADDR_d[A_WIDTH-1 : 2]]  <= HWDATA[7:0];
            if(byte1) BRAM1[HADDR_d[A_WIDTH-1 : 2]]  <= HWDATA[15:8];
            if(byte2) BRAM2[HADDR_d[A_WIDTH-1 : 2]]  <= HWDATA[23:16];
            if(byte3) BRAM3[HADDR_d[A_WIDTH-1 : 2]]  <= HWDATA[31:24];
        end
    end

    assign HRDATA = {BRAM3[HADDR_d[A_WIDTH-1 : 2]],BRAM2[HADDR_d[A_WIDTH-1 : 2]],BRAM1[HADDR_d[A_WIDTH-1 : 2]],BRAM0[HADDR_d[A_WIDTH-1 : 2]]};

    assign HREADYOUT = 1'b1; // Always ready


endmodule

