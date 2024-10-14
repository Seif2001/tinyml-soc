module Hazard2_SoC_tb;
    reg         HCLK;
    reg         HRESETn;

    wire [31:0] GPIO_OUT_A;
    wire [31:0] GPIO_OE_A;
    wire [31:0] GPIO_IN_A;

    wire [31:0] GPIO_OUT_B;
    wire [31:0] GPIO_OE_B;
    wire [31:0] GPIO_IN_B;

    wire [31:0] GPIO_OUT_C;
    wire [31:0] GPIO_OE_C;
    wire [31:0] GPIO_IN_C;

    wire        UART_TX;


    
    
    // clock
    initial HCLK = 0;
    always #5 HCLK = ~HCLK;

    // Reset
    initial begin
        HRESETn = 0;
        #47;
        @(posedge HCLK);
        HRESETn = 1;
    end

    // TB infrastructure
    initial begin
        $dumpfile("Hazard2_SoC_tb.vcd");
        $dumpvars(0, Hazard2_SoC_tb);
        #100_000;
        $display("Test Failed: Timeout");
        $finish;
    end

    Hazard2_SoC MUV (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .GPIO_OUT_A(GPIO_OUT_A),
        .GPIO_OE_A(GPIO_OE_A),
        .GPIO_IN_A(GPIO_IN_A),
        .GPIO_OUT_B(GPIO_OUT_B),
        .GPIO_OE_B(GPIO_OE_B),
        .GPIO_IN_B(GPIO_IN_B),
        .GPIO_OUT_C(GPIO_OUT_C),
        .GPIO_OE_C(GPIO_OE_C),
        .GPIO_IN_C(GPIO_IN_C),

        .UART_TX(UART_TX)
    );

    // Simulate the GPIO
    tri [31:0] PORT_A;
    assign PORT_A = GPIO_OE_A ? GPIO_OUT_A : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_A = PORT_A;

    tri [31:0] PORT_B;
    assign PORT_B = GPIO_OE_B ? GPIO_OUT_B : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_B = PORT_B;

    tri [31:0] PORT_C;
    assign PORT_C = GPIO_OE_C ? GPIO_OUT_C : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_C = PORT_C;

        // A serial Terminal
    serial_terminal terminal (
        .clk(HCLK),             
        .rst_n(HRESETn),           
        .rx(UART_TX),           
        .baud_div(10)  
    );

    // FInish when yoiu see a special pattern on the GPIO
    always@* begin
        $display("GPIO TEST %h time %t", GPIO_OUT_C, $time);

        if (GPIO_OUT_C == 32'd1000) begin
            #1000;
            $display("Test Passed");
            $finish;
        end
    end

endmodule
