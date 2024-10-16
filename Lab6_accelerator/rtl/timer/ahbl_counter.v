`default_nettype none

module ahbl_counter (
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
    output wire        HREADYOUT
);

    localparam  CTRL_REG_OFF    = 'h00,
                CFG_REG_OFF = 'h04,
                PS_REG_OFF = 'h08,
                LOAD_REG_OFF  = 'h0C,
                STATUS_REG_OFF    = 'h0F,
                TICK_REG_OFF    = 'h10;
                

    // store the address phase signals
    reg [32:0]  HADDR_d;
    reg [2:0]   HSIZE_d;
    reg [1:0]   HTRANS_d;
    reg         HWRITE_d;
    reg         HSEL_d;

    wire tick;

    wire CTRL_REG_SEL       = (HADDR_d[23:0] == CTRL_REG_OFF);
    wire CFG_REG_SEL        = (HADDR_d[23:0] == CFG_REG_OFF);
    wire PS_REG_SEL         = (HADDR_d[23:0] == PS_REG_OFF);
    wire LOAD_REG_SEL       = (HADDR_d[23:0] == LOAD_REG_OFF);
    wire STATUS_REG_SEL     = (HADDR_d[23:0] == STATUS_REG_OFF);
    wire TICK_REG_SEL       = (HADDR_d[23:0] == TICK_REG_OFF);
    

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

    wire [31:0]  STATUS_REG;
    reg [ 2:0]  CFG_REG;
    reg [ 0:0]  CTRL_REG;
    reg [31:0]  LOAD_REG;
    reg [15:0]  PS_REG;

    reg start_pulse;


    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            CTRL_REG <= 'b0;
        else if(ahbl_we & CTRL_REG_SEL)
            CTRL_REG <= HWDATA[0];

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            CFG_REG <= 'h0;
        else if(ahbl_we & CFG_REG_SEL)
            CFG_REG <= HWDATA[2:0];

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            PS_REG <= 'h0;
        else if(ahbl_we & PS_REG_SEL)
            PS_REG <= HWDATA[15:0];

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            LOAD_REG <= 'h0;
        else if(ahbl_we & LOAD_REG_SEL)
            LOAD_REG <= HWDATA[31:0];


    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            start_pulse <= 1'b0;
        else if(ahbl_we & CTRL_REG_SEL & HWDATA[0])
            start_pulse <= 1'b1;
        else
            start_pulse <= 1'b0;

    assign HRDATA = STATUS_REG_SEL ? STATUS_REG :
                    CFG_REG_SEL    ? {29'h0, CFG_REG}     :
                    PS_REG_SEL     ? {16'h0, PS_REG}      :
                    LOAD_REG_SEL   ?  LOAD_REG    :
                    CTRL_REG_SEL   ? {31'h0, CTRL_REG}    :
                    TICK_REG_SEL   ? {31'h0, tick}        :
                    32'hBADDBEEF;
 

    assign HREADYOUT = 1'b1; // Always ready

    counter counter (
        .clk(HCLK),
        .rst_n(HRESETn),
        .en(CTRL_REG[0]),
        .prescaler(PS_REG),
        .reset_tim(start_pulse),
        .load(LOAD_REG),
        .up_down(CFG_REG[0]),
        .one_shot(CFG_REG[1]),
        .tick(tick),
        .count(STATUS_REG)
    );
  

endmodule