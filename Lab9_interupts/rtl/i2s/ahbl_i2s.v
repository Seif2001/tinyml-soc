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
                    DATA_REG_OFF = 'h08;

        // store the address phase signals
        reg [31:0]  HADDR_d;
        reg [2:0]   HSIZE_d;
        reg [1:0]   HTRANS_d;
        reg         HWRITE_d;
        reg         HSEL_d;

        wire tick, rdy, count;
        wire [31:0] sample;

        wire CTRL_REG_SEL       = (HADDR_d[23:0] == CTRL_REG_OFF);
        wire DONE_REG_SEL       = (HADDR_d[23:0] == DONE_REG_OFF);
        wire DATA_REG_SEL       = (HADDR_d[23:0] == DATA_REG_OFF);

        

        wire ahbl_we            = HTRANS_d[1] & HSEL_d & HWRITE_d;
        wire ahbl_re            = HTRANS_d[1] & HSEL_d & !HWRITE_d;

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
                CTRL_REG <= 4'b0;
            else if(ahbl_we & CTRL_REG_SEL)
                CTRL_REG <= HWDATA[3:0];

        

        assign HRDATA = DATA_REG_SEL   ? DATA_REG             :  
                        CTRL_REG_SEL   ? {31'h0, CTRL_REG}    :
                        DONE_REG_SEL   ? {31'h0, DONE_REG}    :
                        32'hBADDBEEF;
    


        reg rdy_sync1, rdy_sync2;

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        rdy_sync1 <= 1'b0;
        rdy_sync2 <= 1'b0;
    end else begin
        rdy_sync1 <= rdy;       // First stage
        rdy_sync2 <= rdy_sync1; // Second stage
    end
end



always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn)
        DONE_REG <= 2'b00;
    else if (rdy_sync2)  // Prioritize `rdy`
        DONE_REG <= {rdy_sync2, WS};
    else if (ahbl_re && DONE_REG_SEL)  // Clear `DONE_REG` on AHB read
        DONE_REG <= {1'b0, WS};
end

        always@(posedge HCLK, negedge HRESETn) begin
            if(!HRESETn)
                DATA_REG<=32'd0;
            else
                if (ahbl_re && DATA_REG_SEL)
                    DATA_REG<=DATA_REG;
                else if(rdy)
                    DATA_REG <= sample;
        end


        assign HREADYOUT = 1'b1; // Always ready

    

        i2s i2s_wrap(
            .clk(HCLK),
            .rst_n(HRESETn),
            .data(sample),
            .done(rdy),
            .en(CTRL_REG[0]),
            .DIN(SD),
            .BCLK(SCK),
            .WS(WS)
        );
    
    assign IRQ = rdy;
    

    endmodule