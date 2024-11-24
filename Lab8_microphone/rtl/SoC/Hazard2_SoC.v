/*
    A simple SoC
        - 1 CPU : Hazard2
        - 2 Memories : 8kbytes Data memory and 8kbytes Program memory
        - 3 32-bit GPIO Port
        - 1 UART
        - 1 timer
        - 1 multiplier
        - 1 I2S

    The Memory Map:
        - 0x0000_0000 - 0x0000_1FFF : Program Memory
        - 0x2000_2000 - 0x2000_1FFF : Data Memory
        - 0x4000_0000 : GPIO Port
        - 0x5000_0000 : UART
        - 0x6000_0000 : TIMER
        - 0x7000_0000 : multiplier
        - 0x8000_0000 : I2S
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

    output wire         UART_TX,

    output wire         WS,
    output wire         SCK,
    input  wire         SD

);

    wire [31:0] HADDR;
    wire [1:0]  HTRANS;
    wire [2:0] 	HSIZE;
    wire        HWRITE;
    wire [31:0] HWDATA;
    wire        HREADY;
    wire [31:0] HRDATA;

    wire [31:0] S0_HRDATA, S1_HRDATA, S2_HRDATA, S3_HRDATA, S4_HRDATA, S5_HRDATA, S6_HRDATA;
    wire        S0_HSEL, S1_HSEL, S2_HSEL, S3_HSEL, S4_HSEL, S5_HSEL, S6_HSEL;
    wire        S0_HREADYOUT, S1_HREADYOUT, S2_HREADYOUT, S3_HREADYOUT, S4_HREADYOUT, S5_HREADYOUT, S6_HREADYOUT;

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

    ahbl_mult MULTIPLY (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S5_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S5_HREADYOUT),
        .HRDATA(S5_HRDATA)
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



    ahbl_counter COUNTER (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S4_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S4_HREADYOUT),
        .HRDATA(S4_HRDATA)

    );

    ahbl_i2s I2S (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S6_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S6_HREADYOUT),
        .HRDATA(S6_HRDATA),
        .WS(WS),
        .SCK(SCK),
        .SD(SD)
    );


    ahbl_splitter_4 # ( .S0(4'h0),     // Program Memory
                        .S1(4'h2),     // Data Memory
                        .S2(4'h4),     // GPIO Port
                        .S3(4'h5),     // uart
                        .S4(4'h6),      // timer
                        .S5(4'h7),      // accelerator
                        .S6(4'h8)      // multiplier
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

        .S4_HSEL(S4_HSEL),
        .S4_HRDATA(S4_HRDATA),
        .S4_HREADYOUT(S4_HREADYOUT),

        .S5_HSEL(S5_HSEL),
        .S5_HRDATA(S5_HRDATA),
        .S5_HREADYOUT(S5_HREADYOUT),

        .S6_HSEL(S6_HSEL),
        .S6_HRDATA(S6_HRDATA),
        .S6_HREADYOUT(S6_HREADYOUT)

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
