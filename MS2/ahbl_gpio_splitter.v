module ahbl_gpio_splitter #(parameter A=4'h0,
                                      B=4'h1,
                                      C=4'h2
                                 )
(
    input wire          HCLK,
    input wire          HRESETn,

    // BUS

    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    input   wire [2:0]  HSIZE,
    input   wire        HWRITE,
    input   wire     	HREADY,
    input   wire        HSEL,
    input   wire [31:0] HWDATA,

    output  wire        HREADYOUT,
    output  wire [31:0] HRDATA,


    // GPIOA
    input  wire [31:0]   GPIO_IN_A,
    output wire [31:0]   GPIO_OUT_A,
    output wire [31:0]   GPIO_OE_A,

    // GPIOB
    input  wire [31:0]   GPIO_IN_B,
    output wire [31:0]   GPIO_OUT_B,
    output wire [31:0]   GPIO_OE_B,

    // GPIOC
    input  wire [31:0]   GPIO_IN_C,
    output wire [31:0]   GPIO_OUT_C,
    output wire [31:0]   GPIO_OE_C
    
);

reg [2:0] selects;
reg [2:0] selects_d;

always @* begin
    case(HADDR[27:24])
        A: selects = 3'b001;
        B: selects = 3'b010;
        C: selects = 3'b100;
        default: selects = 3'b000;
    endcase
end

always @(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        selects_d <= 3'b000;
    end else if(HREADY) begin
        selects_d <= selects;
    end
end

wire A_HREADYOUT, B_HREADYOUT, C_HREADYOUT;
wire [31:0] A_HRDATA, B_HRDATA, C_HRDATA;

ahbl_gpio GPIOA (
    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .HADDR(HADDR),
    .HTRANS(HTRANS),
    .HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HREADY(HREADY),
    .HSEL(selects[0]),
    .HWDATA(HWDATA),
    .HREADYOUT(A_HREADYOUT),
    .HRDATA(A_HRDATA),
    
    .GPIO_IN(GPIO_IN_A),
    .GPIO_OUT(GPIO_OUT_A),
    .GPIO_OE(GPIO_OE_A)
);

ahbl_gpio GPIOB (
    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .HADDR(HADDR),
    .HTRANS(HTRANS),
    .HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HREADY(HREADY),
    .HSEL(selects[1]),
    .HWDATA(HWDATA),
    .HREADYOUT(B_HREADYOUT),
    .HRDATA(B_HRDATA),
    
    .GPIO_IN(GPIO_IN_B),
    .GPIO_OUT(GPIO_OUT_B),
    .GPIO_OE(GPIO_OE_B)
);

ahbl_gpio GPIOC (
    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .HADDR(HADDR),
    .HTRANS(HTRANS),
    .HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HREADY(HREADY),
    .HSEL(selects[2]),
    .HWDATA(HWDATA),
    .HREADYOUT(C_HREADYOUT),
    .HRDATA(C_HRDATA),
    
    .GPIO_IN(GPIO_IN_C),
    .GPIO_OUT(GPIO_OUT_C),
    .GPIO_OE(GPIO_OE_C)
);

assign HREADYOUT =  selects_d[0] ? A_HREADYOUT :
                    selects_d[1] ? B_HREADYOUT :
                    selects_d[2] ? C_HREADYOUT : 1'b1;

assign HRDATA =     selects_d[0] ? A_HRDATA :
                    selects_d[1] ? B_HRDATA :
                    selects_d[2] ? C_HRDATA : 32'hBADDBEEF;

endmodule