module ahbl_mult (
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

    localparam  MULTIPLICAND_A_REG_OFF = 'h00,
                MULTIPLICAND_B_REG_OFF = 'h04,
                PROD_REG_OFF    = 'h08;

    wire        done;

    // store the address phase signals
    reg [32:0]  HADDR_d;
    reg [2:0]   HSIZE_d;
    reg [1:0]   HTRANS_d;
    reg         HWRITE_d;
    reg         HSEL_d;

    wire MULTIPLICAND_A_REG_SEL       = (HADDR_d[23:0] == MULTIPLICAND_A_REG_OFF);
    wire MULTIPLICAND_B_REG_SEL       = (HADDR_d[23:0] == MULTIPLICAND_B_REG_OFF);
    wire PROD_REG_SEL     = (HADDR_d[23:0] == PROD_REG_OFF);
    

    wire ahbl_we        = HTRANS_d[1] & HSEL_d & HWRITE_d;

    always @(posedge HCLK) begin
        if(!HRESETn) begin
            HADDR_d     <= 'h0;
            HSIZE_d     <= 'h0;
            HTRANS_d    <= 'h00;
            HWRITE_d    <= 'h0;
            HSEL_d      <= 'h00;
        end else if(HREADY) begin
            HADDR_d     <= HADDR;
            HSIZE_d     <= HSIZE;
            HTRANS_d    <= HTRANS;
            HWRITE_d    <= HWRITE;
            HSEL_d      <= HSEL;
        end
    end

    reg [31:0]  MULTIPLICAND_A_REG;
    reg [31:0]  MULTIPLICAND_B_REG;
    reg [31:0]  PROD_REG;

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            MULTIPLICAND_A_REG <= 'h0;
        else if(ahbl_we & MULTIPLICAND_A_REG_SEL)
            MULTIPLICAND_A_REG <= HWDATA;

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            MULTIPLICAND_B_REG <= 'h0;
        else if(ahbl_we & MULTIPLICAND_B_REG_SEL)
            MULTIPLICAND_B_REG <= HWDATA;

    multiplier mult (
        .clk(HCLK),
        .rst_n(HRESETn),
        .a(MULTIPLICAND_A_REG),
        .b(MULTIPLICAND_B_REG),
        .p(PROD_REG)
    );

    //wire [31:0] rd; 
    assign HRDATA = MULTIPLICAND_A_REG_SEL    ? MULTIPLICAND_A_REG     :
                    MULTIPLICAND_B_REG_SEL    ? MULTIPLICAND_B_REG     :
                    PROD_REG_SEL              ? PROD_REG               :
                    32'hBADDBEEF;

    assign HREADYOUT = 1'b1; // Always ready

endmodule