/*
    A simple SoC
        - 1 CPU : Hazard2
        - 2 Memories : 8kbytes Data memory and 8kbytes Program memory
        - 1 32-bit GPIO Port

    The Memory Map:
        - 0x0000_0000 - 0x0000_1FFF : Program Memory
        - 0x2000_2000 - 0x2000_1FFF : Data Memory
        - 0x4000_0000 : GPIO Port
*/

module Hazard2_SoC (
    input wire          HCLK,
    input wire          HRESETn,

    output wire [31:0]  GPIO_OUT_A,
    output wire [31:0]  GPIO_OE_A,
    input wire  [31:0]   GPIO_IN_A,
    output wire [31:0]  GPIO_OUT_B,
    output wire [31:0]  GPIO_OE_B,
    input wire  [31:0]   GPIO_IN_B,
    output wire [31:0]  GPIO_OUT_C,
    output wire [31:0]  GPIO_OE_C,
    input wire  [31:0]   GPIO_IN_C,

    output wire         UART_TX

);

    wire [31:0] HADDR;
    wire [1:0]  HTRANS;
    wire [2:0] 	HSIZE;
    wire        HWRITE;
    wire [31:0] HWDATA;
    wire        HREADY;
    wire [31:0] HRDATA;

    wire [31:0] S0_HRDATA, S1_HRDATA, S2_HRDATA, S3_HRDATA;
    wire        S0_HSEL, S1_HSEL, S2_HSEL, S3_HSEL;
    wire        S0_HREADYOUT, S1_HREADYOUT, S2_HREADYOUT, S3_HREADYOUT;

    wire GP_A_HREADYOUT, GP_B_HREADYOUT, GP_C_HREADYOUT;
    wire [31:0] GP_A_HRDATA, GP_B_HRDATA, GP_C_HRDATA;
    wire GP_A_SEL, GP_B_SEL, GP_C_SEL;

    Hazard2 CPU (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HWDATA(HWDATA),
        .HREADY(HREADY),
        .HRDATA(HRDATA)
    );

    ahbl_gpio GPIOA (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(GP_A_SEL),
        .HWDATA(HWDATA),
        .HREADYOUT(GP_A_HREADYOUT),
        .HRDATA(GP_A_HRDATA),
        
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
        .HSEL(GP_B_SEL),
        .HWDATA(HWDATA),
        .HREADYOUT(GP_B_HREADYOUT),
        .HRDATA(GP_B_HRDATA),
        
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
        .HSEL(GP_C_SEL),
        .HWDATA(HWDATA),
        .HREADYOUT(GP_C_HREADYOUT),
        .HRDATA(GP_C_HRDATA),
        
        .GPIO_IN(GPIO_IN_C),
        .GPIO_OUT(GPIO_OUT_C),
        .GPIO_OE(GPIO_OE_C)
    );


    ahbl_rom #(.SIZE(6*1024)) PMEM (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S0_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S0_HREADYOUT),
        .HRDATA(S0_HRDATA)
    );

    ahbl_ram #(.SIZE(8*1024)) DMEM (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S1_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S1_HREADYOUT),
        .HRDATA(S1_HRDATA)
    );


       ahbl_uart_tx TX (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S3_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S3_HREADYOUT),
        .HRDATA(S3_HRDATA),

        .tx(UART_TX)
    );

 


    ahbl_splitter_4 # ( .S0(4'h0),     // Program Memory
                        .S1(4'h2),     // Data Memory
                        .S2(4'h4),     // GPIO Port
                        .S3(4'h5)      // uart

    ) SPLITTER (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HREADY(HREADY),
        .HRDATA(HRDATA),

        .S0_HSEL(S0_HSEL),
        .S0_HRDATA(S0_HRDATA),
        .S0_HREADYOUT(S0_HREADYOUT),

        .S1_HSEL(S1_HSEL),
        .S1_HRDATA(S1_HRDATA),
        .S1_HREADYOUT(S1_HREADYOUT),

        .S2_HSEL(S2_HSEL),
        .S2_HRDATA(S2_HRDATA),
        .S2_HREADYOUT(S2_HREADYOUT),

        .S3_HSEL(S3_HSEL),
        .S3_HRDATA(S3_HRDATA),
        .S3_HREADYOUT(S3_HREADYOUT),


    );


     ahbl_gpio_splitter    # ( .A(4'h0),     
                              .B(4'h1),     
                              .C(4'h2) 
                            )
    GPIO (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S2_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S2_HREADYOUT),
        .HRDATA(S2_HRDATA),


        .GP_A_HRDATA(GP_A_HRDATA),
        .GP_A_HREADYOUT(GP_A_HREADYOUT),
        .GP_A_SEL(GP_A_SEL),

        .GP_B_HRDATA(GP_B_HRDATA),
        .GP_B_HREADYOUT(GP_B_HREADYOUT),
        .GP_B_SEL(GP_B_SEL),

        .GP_C_HRDATA(GP_C_HRDATA),
        .GP_C_HREADYOUT(GP_C_HREADYOUT),
        .GP_C_SEL(GP_C_SEL)
    );

endmodule
