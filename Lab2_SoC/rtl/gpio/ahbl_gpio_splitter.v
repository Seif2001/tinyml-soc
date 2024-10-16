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

    input  wire          GP_A_HREADYOUT,
    input  wire [31:0]   GP_A_HRDATA,
    output wire          GP_A_SEL,     

    // GPIOB

    input  wire          GP_B_HREADYOUT,
    input  wire [31:0]   GP_B_HRDATA,
    output wire          GP_B_SEL,     



    // GPIOC

    input  wire          GP_C_HREADYOUT,
    input  wire [31:0]   GP_C_HRDATA,
    output wire          GP_C_SEL

    
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

assign GP_A_SEL = selects[0];
assign GP_B_SEL = selects[1];
assign GP_C_SEL = selects[2];


assign HREADYOUT =  selects_d[0] ? GP_A_HREADYOUT :
                    selects_d[1] ? GP_B_HREADYOUT :
                    selects_d[2] ? GP_C_HREADYOUT : 1'b1;

assign HRDATA =     selects_d[0] ? GP_A_HRDATA :
                    selects_d[1] ? GP_B_HRDATA :
                    selects_d[2] ? GP_C_HRDATA : 32'hBADDBEEF;

endmodule