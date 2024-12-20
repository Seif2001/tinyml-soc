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

        input  wire        SD,
        output wire        SCK,
        output wire        WS,
        output wire        IRQ
    );

        localparam  CTRL_REG_OFF    = 'h00,
                    DONE_REG_OFF = 'h04,
                    DATA_REG_OFF = 'h08,
                    STATUS_REG_OFF = 'h0C;

        

        wire empty;
        wire full;

        // store the address phase signals
        reg [31:0]  HADDR_d;
        reg [2:0]   HSIZE_d;
        reg [1:0]   HTRANS_d;
        reg         HWRITE_d;
        reg         HSEL_d;

        wire [31:0] data;

        wire CTRL_REG_SEL       = (HADDR_d[23:0] == CTRL_REG_OFF);
        wire DONE_REG_SEL       = (HADDR_d[23:0] == DONE_REG_OFF);
        wire DATA_REG_SEL       = (HADDR_d[23:0] == DATA_REG_OFF);
        wire STATUS_REG_OFF_SEL = (HADDR_d[23:0] == STATUS_REG_OFF);

        

        wire ahbl_we            = HTRANS_d[1] & HSEL_d & HWRITE_d;
        wire ahbl_re            = HTRANS_d[1] & HSEL_d & !HWRITE_d;
        wire rdy;

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


        reg [ 3:0]  CTRL_REG;
        reg [31:0]  DATA_REG;
        reg [ 1:0]  DONE_REG;


        always @ (posedge HCLK or negedge HRESETn)
            if(~HRESETn)
                CTRL_REG <= 2'b0;
            else if(ahbl_we & CTRL_REG_SEL)
                CTRL_REG <= HWDATA[1:0];

        

        assign HRDATA = DATA_REG_SEL   ? DATA_REG             :  
                        CTRL_REG_SEL   ? {31'h0, CTRL_REG}    :
                        DONE_REG_SEL   ? {31'h0, DONE_REG}    :
                        STATUS_REG_OFF_SEL ? {31'h0, empty}    :
                        32'hBADDBEEF;
    
        wire rd = ahbl_re & DATA_REG_SEL;
        always@(posedge HCLK, negedge HRESETn) begin
            if(!HRESETn)
                DATA_REG<=32'd0;
            else
                
                DATA_REG<=data;
                
        end


    assign HREADYOUT = 1'b1; // Always ready
    reg irq_reg;
  

reg full_d1;  // Register to store previous value of full

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        irq_reg <= 1'b0;
        full_d1 <= 1'b0;
    end else begin
        // Detect rising edge of 'full' signal
        if (full & ~full_d1) begin
            irq_reg <= 1'b1;  // Pulse irq_reg high when 'full' goes high
        end else begin
            irq_reg <= 1'b0;  // Reset irq_reg on the next clock cycle
        end

        // Update previous value of full for the next cycle
        full_d1 <= full;
    end
end
    assign IRQ = irq_reg;
    i2s_fifo i2s (
        .clk(HCLK),
        .rst_n(HRESETn),
        .en(CTRL_REG[0]),
        .empty(empty),
        .full(full),
        .rdata(data),
        .rd(rd),
        .SCK(SCK),
        .WS(WS),
        .SD(SD)
    );
        

    
  

    endmodule