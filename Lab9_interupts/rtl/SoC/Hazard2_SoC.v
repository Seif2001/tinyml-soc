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
        - 0x8000_0000 : I2S
        - 0x9000_0000 : DMA_slave
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

    // wire [31:0] HADDR;
    // wire [1:0]  HTRANS;
    // wire [2:0] 	HSIZE;
    // wire        HWRITE;
    // wire [31:0] HWDATA;
    // wire        HREADY;
    // wire [31:0] HRDATA;

    // wire [31:0] S0_HRDATA, S1_HRDATA, S2_HRDATA, S3_HRDATA, S4_HRDATA, S5_HRDATA, S6_HRDATA;
    // wire        S0_HSEL, S1_HSEL, S2_HSEL, S3_HSEL, S4_HSEL, S5_HSEL, S6_HSEL;
    // wire        S0_HREADYOUT, S1_HREADYOUT, S2_HREADYOUT, S3_HREADYOUT, S4_HREADYOUT, S5_HREADYOUT, S6_HREADYOUT;

    wire GP_A_HREADYOUT, GP_B_HREADYOUT, GP_C_HREADYOUT;
    wire [31:0] GP_A_HRDATA, GP_B_HRDATA, GP_C_HRDATA;
    wire GP_A_SEL, GP_B_SEL, GP_C_SEL;
    wire I2S_IRQ;
    // crossbar parameters
    localparam  N_MASTERS= 2;
    localparam N_SLAVES = 7;
    localparam W_ADDR = 32;
    localparam W_DATA = 32;
    localparam ADDR_MAP = {
    32'h00000000,  // Program Memory
    32'h20002000,  // Data Memory
    32'h40000000,  // GPIO Port
    32'h50000000,  // UART
    32'h60000000,  // TIMER
    32'h80000000,  // I2S
    32'h90000000   // DMA_S
};


   localparam ADDR_MASK = {
    32'hF0000000,  // Program Memory (8 KB range)
    32'hF0000000,  // Data Memory (8 KB range)
    32'hF0000000,  // GPIO Port (exact match)
    32'hF0000000,  // UART (exact match)
    32'hF0000000,  // TIMER (exact match)
    32'hF0000000,  // I2S (exact match)
    32'hF0000000   // DMA_S (exact match)
};



    // crossbar signals

    // masters

    // CPU

    wire CPU_HREADY;
    wire CPU_HRESP;
    wire [31:0] CPU_HADDR;
    wire CPU_HWRITE;
    wire [1:0] CPU_HTRANS;
    wire [2:0] CPU_HSIZE;
    wire [2:0] CPU_HBURST;
    wire [3:0] CPU_HPROT;
    wire CPU_HMASTLOCK;
    wire [31:0] CPU_HWDATA;
    wire [31:0] CPU_HRDATA;

    FRV_AHBL CPU (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(CPU_HADDR),
        .HTRANS(CPU_HTRANS),
        .HSIZE(CPU_HSIZE),
        .HWRITE(CPU_HWRITE),
        .HWDATA(CPU_HWDATA),
        .HREADY(CPU_HREADY),
        .HRDATA(CPU_HRDATA),
        .IRQ(I2S_IRQ)
    );

    // DMA_M 

    wire DMA_M_HREADY;
    wire DMA_M_HRESP;
    wire [31:0] DMA_M_HADDR;
    wire DMA_M_HWRITE;
    wire [1:0] DMA_M_HTRANS;
    wire [2:0] DMA_M_HSIZE;
    wire [2:0] DMA_M_HBURST;
    wire [3:0] DMA_M_HPROT;
    wire DMA_M_HMASTLOCK;
    wire [31:0] DMA_M_HWDATA;
    wire [31:0] DMA_M_HRDATA;

    // DMA_S 

    wire DMA_S_HREADY;
    wire DMA_S_HREADYOUT;
    wire [31:0] DMA_S_HADDR;
    wire DMA_S_HWRITE;
    wire [1:0] DMA_S_HTRANS;
    wire [2:0] DMA_S_HSIZE;
    
    wire [31:0] DMA_S_HWDATA;
    wire [31:0] DMA_S_HRDATA;
    wire DMA_S_HSEL = DMA_S_HADDR[31:28] == 4'h9;
    // prot, resp, burst, lock unused
    wire DMA_S_HPROT,DMA_S_HRESP, DMA_S_HBURST, DMA_S_HLOCK;

    // DMAC

    ahbl_dmac DMA (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .mHADDR(DMA_M_HADDR),
        .mHTRANS(DMA_M_HTRANS),
        .mHSIZE(DMA_M_HSIZE),
        .mHWRITE(DMA_M_HWRITE),
        .mHWDATA(DMA_M_HWDATA),
        .mHREADY(DMA_M_HREADY),
        .mHRDATA(DMA_M_HRDATA),


        .sHADDR(DMA_S_HADDR),
        .sHTRANS(DMA_S_HTRANS),
        .sHSIZE(DMA_S_HSIZE),
        .sHWRITE(DMA_S_HWRITE),
        .sHWDATA(DMA_S_HWDATA),
        .sHREADY(DMA_S_HREADY),
        .sHSEL(DMA_S_HSEL),
        .sHREADYOUT(DMA_S_HREADYOUT),
        .sHRDATA(DMA_S_HRDATA)
    );

    // slaves


    // Program Memory 0x0000_0000 - 0x0000_1FFF
    wire [31:0] PMEM_HADDR;
    wire [1:0] PMEM_HTRANS;
    wire [2:0] PMEM_HSIZE;
    wire PMEM_HWRITE;
    wire PMEM_HREADY;
    wire PMEM_HSEL = PMEM_HADDR[31:28] == 4'h0;
    wire [31:0] PMEM_HWDATA;
    wire PMEM_HREADYOUT;
    wire [31:0] PMEM_HRDATA;
    // prot, resp, burst, lock unused
    wire PMEM_HPROT, PMEM_HRESP, PMEM_HBURST, PMEM_HLOCK;

    ahbl_rom #(.SIZE(6*1024)) PMEM (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(PMEM_HADDR),
        .HTRANS(PMEM_HTRANS),
        .HSIZE(PMEM_HSIZE),
        .HWRITE(PMEM_HWRITE),
        .HREADY(PMEM_HREADY),
        .HSEL(PMEM_HSEL),
        .HWDATA(PMEM_HWDATA),
        .HREADYOUT(PMEM_HREADYOUT),
        .HRDATA(PMEM_HRDATA)
    );

    // Data Memory 0x2000_0000 - 0x2000_1FFF
    wire [31:0] DMEM_HADDR;
    wire [1:0] DMEM_HTRANS;
    wire [2:0] DMEM_HSIZE;
    wire DMEM_HWRITE;
    wire DMEM_HREADY;
    wire DMEM_HSEL = DMEM_HADDR[31:28] == 4'h2;
    wire [31:0] DMEM_HWDATA;
    wire DMEM_HREADYOUT;
    wire [31:0] DMEM_HRDATA;
    // prot, resp, burst, lock unused
    wire DMEM_HPROT, DMEM_HRESP, DMEM_HBURST, DMEM_HLOCK;

    ahbl_ram #(.SIZE(8*1024)) DMEM (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(DMEM_HADDR),
        .HTRANS(DMEM_HTRANS),
        .HSIZE(DMEM_HSIZE),
        .HWRITE(DMEM_HWRITE),
        .HREADY(DMEM_HREADY),
        .HSEL(DMEM_HSEL),
        .HWDATA(DMEM_HWDATA),
        .HREADYOUT(DMEM_HREADYOUT),
        .HRDATA(DMEM_HRDATA)
    );


    // GPIO Port 0x4000_0000

    wire [31:0] GPIO_HADDR;
    wire [1:0] GPIO_HTRANS;
    wire [2:0] GPIO_HSIZE;
    wire GPIO_HWRITE;
    wire GPIO_HREADY;
    wire GPIO_HSEL = GPIO_HADDR[31:28] == 4'h4;
    wire [31:0] GPIO_HWDATA;
    wire GPIO_HREADYOUT;
    wire [31:0] GPIO_HRDATA;
    // prot, resp, burst, lock unused
    wire GPIO_HPROT, GPIO_HRESP, GPIO_HBURST, GPIO_HLOCK;

    
    ahbl_gpio_splitter    # ( .A(4'h0),     
                              .B(4'h1),     
                              .C(4'h2) 
                            )
    GPIO (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(GPIO_HADDR),
        .HTRANS(GPIO_HTRANS),
        .HSIZE(GPIO_HSIZE),
        .HWRITE(GPIO_HWRITE),
        .HREADY(GPIO_HREADY),
        .HSEL(GPIO_HSEL),
        .HWDATA(GPIO_HWDATA),
        .HREADYOUT(GPIO_HREADYOUT),
        .HRDATA(GPIO_HRDATA),

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

    ahbl_gpio GPIOA (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(GPIO_HADDR),
        .HTRANS(GPIO_HTRANS),
        .HSIZE(GPIO_HSIZE),
        .HWRITE(GPIO_HWRITE),
        .HREADY(GPIO_HREADY),
        .HSEL(GP_A_SEL),
        .HWDATA(GPIO_HWDATA),
        .HREADYOUT(GP_A_HREADYOUT),
        .HRDATA(GP_A_HRDATA),

        .GPIO_IN(GPIO_IN_A),
        .GPIO_OUT(GPIO_OUT_A),
        .GPIO_OE(GPIO_OE_A)
    );

    ahbl_gpio GPIOB (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(GPIO_HADDR),
        .HTRANS(GPIO_HTRANS),
        .HSIZE(GPIO_HSIZE),
        .HWRITE(GPIO_HWRITE),
        .HREADY(GPIO_HREADY),
        .HSEL(GP_B_SEL),
        .HWDATA(GPIO_HWDATA),
        .HREADYOUT(GP_B_HREADYOUT),
        .HRDATA(GP_B_HRDATA),
        
        .GPIO_IN(GPIO_IN_B),
        .GPIO_OUT(GPIO_OUT_B),
        .GPIO_OE(GPIO_OE_B)
    );

    ahbl_gpio GPIOC (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(GPIO_HADDR),
        .HTRANS(GPIO_HTRANS),
        .HSIZE(GPIO_HSIZE),
        .HWRITE(GPIO_HWRITE),
        .HREADY(GPIO_HREADY),
        .HSEL(GP_C_SEL),
        .HWDATA(GPIO_HWDATA),
        .HREADYOUT(GP_C_HREADYOUT),
        .HRDATA(GP_C_HRDATA),
        
        .GPIO_IN(GPIO_IN_C),
        .GPIO_OUT(GPIO_OUT_C),
        .GPIO_OE(GPIO_OE_C)
    );


    // UART 0x5000_0000

    wire [31:0] UART_HADDR;
    wire [1:0] UART_HTRANS;
    wire [2:0] UART_HSIZE;
    wire UART_HWRITE;
    wire UART_HREADY;
    wire UART_HSEL = UART_HADDR[31:28] == 4'h5;
    wire [31:0] UART_HWDATA;
    wire UART_HREADYOUT;
    wire [31:0] UART_HRDATA;
    // prot, resp, burst, lock unused
    wire UART_HPROT, UART_HRESP, UART_HBURST, UART_HLOCK;

    ahbl_uart_tx UART (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(UART_HADDR),
        .HTRANS(UART_HTRANS),
        .HSIZE(UART_HSIZE),
        .HWRITE(UART_HWRITE),
        .HREADY(UART_HREADY),
        .HSEL(UART_HSEL),
        .HWDATA(UART_HWDATA),
        .HREADYOUT(UART_HREADYOUT),
        .HRDATA(UART_HRDATA),
        .tx(UART_TX)
    );

    // Timer 0x6000_0000

    wire [31:0] TIMER_HADDR;
    wire [1:0] TIMER_HTRANS;
    wire [2:0] TIMER_HSIZE;
    wire TIMER_HWRITE;
    wire TIMER_HREADY;
    wire TIMER_HSEL = TIMER_HADDR[31:28] == 4'h6;
    wire [31:0] TIMER_HWDATA;
    wire TIMER_HREADYOUT;
    wire [31:0] TIMER_HRDATA;
    // prot, resp, burst, lock unused
    wire TIMER_HPROT, TIMER_HRESP, TIMER_HBURST, TIMER_HLOCK;

    ahbl_counter TIMER (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(TIMER_HADDR),
        .HTRANS(TIMER_HTRANS),
        .HSIZE(TIMER_HSIZE),
        .HWRITE(TIMER_HWRITE),
        .HREADY(TIMER_HREADY),
        .HSEL(TIMER_HSEL),
        .HWDATA(TIMER_HWDATA),
        .HREADYOUT(TIMER_HREADYOUT),
        .HRDATA(TIMER_HRDATA)
    );

    // I2S 0x8000_0000

    wire [31:0] I2S_HADDR;
    wire [1:0] I2S_HTRANS;
    wire [2:0] I2S_HSIZE;
    wire I2S_HWRITE;
    wire I2S_HREADY;
    wire I2S_HSEL = I2S_HADDR[31:28] == 4'h8;
    wire [31:0] I2S_HWDATA;
    wire I2S_HREADYOUT;
    wire [31:0] I2S_HRDATA;
    // prot, resp, burst, lock unused
    wire I2S_HPROT, I2S_HRESP, I2S_HBURST, I2S_HLOCK;
    // 

    ahbl_i2s I2S (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(I2S_HADDR),
        .HTRANS(I2S_HTRANS),
        .HSIZE(I2S_HSIZE),
        .HWRITE(I2S_HWRITE),
        .HREADY(I2S_HREADY),
        .HSEL(I2S_HSEL),
        .HWDATA(I2S_HWDATA),
        .HREADYOUT(I2S_HREADYOUT),
        .HRDATA(I2S_HRDATA),
        .WS(WS),
        .SCK(SCK),
        .SD(SD),
        .IRQ(I2S_IRQ)
    );

    
    // crossbar

    ahbl_crossbar #(
        .N_MASTERS(N_MASTERS),
        .N_SLAVES(N_SLAVES),
        .W_ADDR(W_ADDR),
        .W_DATA(W_DATA),
        .ADDR_MAP(ADDR_MAP),
        .ADDR_MASK(ADDR_MASK)
    ) CROSSBAR (
        .clk(HCLK),
        .rst_n(HRESETn),
        //masters signals
        .src_hready_resp({DMA_M_HREADY, CPU_HREADY}),
        .src_hresp({DMA_M_HRESP, CPU_HRESP}),
        .src_haddr({DMA_M_HADDR, CPU_HADDR}),
        .src_hwrite({DMA_M_HWRITE, CPU_HWRITE}),
        .src_htrans({DMA_M_HTRANS, CPU_HTRANS}),
        .src_hsize({DMA_M_HSIZE, CPU_HSIZE}),
        .src_hburst({DMA_M_HBURST, CPU_HBURST}),
        .src_hprot({DMA_M_HPROT, CPU_HPROT}),
        .src_hmastlock({DMA_M_HMASTLOCK, CPU_HMASTLOCK}),
        .src_hwdata({DMA_M_HWDATA, CPU_HWDATA}),
        .src_hrdata({DMA_M_HRDATA, CPU_HRDATA}),

        //slaves signals
        .dst_hready({PMEM_HREADY, DMEM_HREADY, GPIO_HREADY, UART_HREADY, TIMER_HREADY, I2S_HREADY, DMA_S_HREADY}),
        .dst_hready_resp({PMEM_HREADYOUT, DMEM_HREADYOUT, GPIO_HREADYOUT, UART_HREADYOUT, TIMER_HREADYOUT, I2S_HREADYOUT, DMA_S_HREADYOUT}),
        .dst_hresp({PMEM_HRESP, DMEM_HRESP, GPIO_HRESP, UART_HRESP, TIMER_HRESP, I2S_HRESP, DMA_S_HRESP}),
        .dst_haddr({PMEM_HADDR, DMEM_HADDR, GPIO_HADDR, UART_HADDR, TIMER_HADDR, I2S_HADDR, DMA_S_HADDR}),
        .dst_hwrite({PMEM_HWRITE, DMEM_HWRITE, GPIO_HWRITE, UART_HWRITE, TIMER_HWRITE, I2S_HWRITE, DMA_S_HWRITE}),
        .dst_htrans({PMEM_HTRANS, DMEM_HTRANS, GPIO_HTRANS, UART_HTRANS, TIMER_HTRANS, I2S_HTRANS, DMA_S_HTRANS}),
        .dst_hsize({PMEM_HSIZE, DMEM_HSIZE, GPIO_HSIZE, UART_HSIZE, TIMER_HSIZE, I2S_HSIZE, DMA_S_HSIZE}),
        .dst_hburst({PMEM_HBURST, DMEM_HBURST, GPIO_HBURST, UART_HBURST, TIMER_HBURST, I2S_HBURST, DMA_S_HBURST}),
        .dst_hprot({PMEM_HPROT, DMEM_HPROT, GPIO_HPROT, UART_HPROT, TIMER_HPROT, I2S_HPROT, DMA_S_HPROT}),
        .dst_hmastlock({PMEM_HLOCK, DMEM_HLOCK, GPIO_HLOCK, UART_HLOCK, TIMER_HLOCK, I2S_HLOCK, DMA_S_HLOCK}),
        .dst_hwdata({PMEM_HWDATA, DMEM_HWDATA, GPIO_HWDATA, UART_HWDATA, TIMER_HWDATA, I2S_HWDATA, DMA_S_HWDATA}),
        .dst_hrdata({PMEM_HRDATA, DMEM_HRDATA, GPIO_HRDATA, UART_HRDATA, TIMER_HRDATA, I2S_HRDATA, DMA_S_HRDATA})
    );





endmodule
