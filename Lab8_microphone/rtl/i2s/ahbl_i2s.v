`default_nettype none

module ahbl_i2s (
    // AHB-Lite Interface
    input  wire        HCLK,
    input  wire        HRESETn,
    input  wire [31:0] HADDR,
    input  wire [1:0]  HTRANS,
    input  wire        HWRITE,
    input  wire [2:0]  HSIZE,
    input  wire [31:0] HWDATA,
    input  wire        HSEL,
    input  wire        HREADY,

    output wire [31:0] HRDATA,
    output wire        HREADYOUT,

    output wire        WS,
    output wire        BCLK,
    input  wire        DIN
);

    localparam  CTRL_REG_OFF    = 'h00,
                DONE_REG_OFF = 'h04,
                DATA_REG_OFF = 'h08;

    // store the address phase signals
    reg [31:0]  HADDR_d;
    reg [2:0]   HSIZE_d;
    reg [1:0]   HTRANS_d;
    reg         HWRITE_d;
    reg         HSEL_d;

    wire tick;

    wire CTRL_REG_SEL       = (HADDR_d[23:0] == CTRL_REG_OFF);
    wire DONE_REG_SEL       = (HADDR_d[23:0] == DONE_REG_OFF);
    wire DATA_REG_SEL       = (HADDR_d[23:0] == DATA_REG_OFF);

    

    wire ahbl_we            = HTRANS_d[1] & HSEL_d & HWRITE_d;

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


    reg [ 0:0]  CTRL_REG;
    wire [31:0]  DATA_REG;
    wire [ 0:0]  DONE_REG;


    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            CTRL_REG <= 'b0;
        else if(ahbl_we & CTRL_REG_SEL)
            CTRL_REG <= HWDATA[0];

 

    assign HRDATA = DATA_REG_SEL   ? DATA_REG             :  
                    CTRL_REG_SEL   ? {31'h0, CTRL_REG}    :
                    DONE_REG_SEL   ? {31'h0, DONE_REG}    :
                    32'hBADDBEEF;
 

    assign HREADYOUT = 1'b1; // Always ready

    i2s i2s (
        .clk(HCLK),
        .rst_n(HRESETn),
        .WS(WS),
        .BCLK(BCLK),
        .DIN(DIN),
        .done(DONE_REG),
        .data(DATA_REG),
        .en(CTRL_REG),
        .ack_data(DATA_REG_SEL),
        .ack_done(DONE_REG_SEL)
    );
  

endmodule