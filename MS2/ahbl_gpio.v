/*
    A 32-bit GPIO Port
*/

module ahbl_gpio(
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
    output  wire [31:0] HRDATA,
    
    input  wire [31:0]   GPIO_IN_0,
    output wire [31:0]   GPIO_OUT_0,
    output wire [31:0]   GPIO_OE_0,

    input  wire [31:0]   GPIO_IN_1,
    output wire [31:0]   GPIO_OUT_1,
    output wire [31:0]   GPIO_OE_1,

    input  wire [31:0]   GPIO_IN_2,
    output wire [31:0]   GPIO_OUT_2,
    output wire [31:0]   GPIO_OE_2
);

localparam  DATA_REG_OFF_0 = 'h00,
            DIR_REG_OFF_0  = 'h04,
            DATA_REG_OFF_1 = 'h08,
            DIR_REG_OFF_1  = 'h0C,
            DATA_REG_OFF_2 = 'h10,
            DIR_REG_OFF_2  = 'h14;
            
// store the address phase signals
reg [31:0]  HADDR_d;
reg [2:0]   HSIZE_d;
reg [1:0]   HTRANS_d;
reg         HWRITE_d;
reg         HSEL_d;


wire DATA_REG_OFF_0_sel = (HADDR_d[23:0] == DATA_REG_OFF_0);
wire DIR_REG_OFF_0_sel  = (HADDR_d[23:0] == DIR_REG_OFF_0);
wire DATA_REG_OFF_1_sel = (HADDR_d[23:0] == DATA_REG_OFF_1);
wire DIR_REG_OFF_1_sel  = (HADDR_d[23:0] == DIR_REG_OFF_1);
wire DATA_REG_OFF_2_sel = (HADDR_d[23:0] == DATA_REG_OFF_2);
wire DIR_REG_OFF_2_sel  = (HADDR_d[23:0] == DIR_REG_OFF_2);

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

    reg [31:0] DATAO_REG[2:0], DATAI_REG_d[2:0], DATAI_REG[2:0], DIR_REG[2:0];
    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn) begin
            DATAO_REG[0] <= 'h0;
            DATAO_REG[1] <= 'h0;
            DATAO_REG[2] <= 'h0;
        end
        else if(ahbl_we) begin 
            if(DATA_REG_OFF_0_sel)
                DATAO_REG[0] <= HWDATA;
            if(DATA_REG_OFF_1_sel)
                DATAO_REG[1] <= HWDATA;
            if(DATA_REG_OFF_2_sel)
                DATAO_REG[2] <= HWDATA;

        end

    always @ (posedge HCLK or negedge HRESETn) 
        if(~HRESETn) begin
            DIR_REG[0] <= 'h0;
            DIR_REG[1] <= 'h0;
            DIR_REG[2] <= 'h0;
        end else if(ahbl_we) begin
            if(DIR_REG_OFF_0_sel)
                DIR_REG[0] <= HWDATA;
            if(DIR_REG_OFF_1_sel)
                DIR_REG[1] <= HWDATA;
            if(DIR_REG_OFF_2_sel)
                DIR_REG[2] <= HWDATA;
        end

    always @ (posedge HCLK or negedge HRESETn)
        if(~HRESETn) begin
            DATAI_REG_d[0] <= 32'h0;
            DATAI_REG_d[1] <= 32'h0;
            DATAI_REG_d[2] <= 32'h0;
            DATAI_REG[0] <= 32'h0;
            DATAI_REG[1] <= 32'h0;
            DATAI_REG[2] <= 32'h0;
        end else begin
            DATAI_REG_d[0] <= GPIO_IN_0;
            DATAI_REG[0] <= DATAI_REG_d[0];
            DATAI_REG_d[1] <= GPIO_IN_1;
            DATAI_REG[1] <= DATAI_REG_d[1];
            DATAI_REG_d[2] <= GPIO_IN_2;
            DATAI_REG[2] <= DATAI_REG_d[2];
        end


    assign HRDATA = DATA_REG_OFF_0_sel ? DATAI_REG[0] :
                    DATA_REG_OFF_1_sel ? DATAI_REG[1] :
                    DATA_REG_OFF_2_sel ? DATAI_REG[2] :

                    DIR_REG_OFF_0_sel  ? DIR_REG[0] :
                    DIR_REG_OFF_1_sel  ? DIR_REG[1] :
                    DIR_REG_OFF_2_sel  ? DIR_REG[2] :

                    32'hBADDBEEF;

    assign HREADYOUT = 1'b1; // Always ready

    assign GPIO_OUT_0   = DATAO_REG[0];
    assign GPIO_OE_0    = DIR_REG[0];

    assign GPIO_OUT_1   = DATAO_REG[1];
    assign GPIO_OE_1  = DIR_REG[1];

    assign GPIO_OUT_2   = DATAO_REG[2];
    assign GPIO_OE_2  = DIR_REG[2];

endmodule