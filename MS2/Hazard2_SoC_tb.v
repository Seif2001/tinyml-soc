module Hazard2_SoC_tb;
    reg         HCLK;
    reg         HRESETn;

    wire [31:0] GPIO_OUT_0;
    wire [31:0] GPIO_OE_0;
    wire [31:0] GPIO_IN_0;

    wire [31:0] GPIO_OUT_1;
    wire [31:0] GPIO_OE_1;
    wire [31:0] GPIO_IN_1;

    wire [31:0] GPIO_OUT_2;
    wire [31:0] GPIO_OE_2;
    wire [31:0] GPIO_IN_2;


    
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

        .GPIO_OUT_0(GPIO_OUT_0),
        .GPIO_OE_0(GPIO_OE_0),
        .GPIO_IN_0(GPIO_IN_0),
        .GPIO_OUT_1(GPIO_OUT_1),
        .GPIO_OE_1(GPIO_OE_1),
        .GPIO_IN_1(GPIO_IN_1),
        .GPIO_OUT_2(GPIO_OUT_2),
        .GPIO_OE_2(GPIO_OE_2),
        .GPIO_IN_2(GPIO_IN_2)
    );

    // Simulate the GPIO
    tri [31:0] PORT_0;
    assign PORT_0 = GPIO_OE_0 ? GPIO_OUT_0 : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_0 = PORT_0;

    tri [31:0] PORT_1;
    assign PORT_1 = GPIO_OE_1 ? GPIO_OUT_1 : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_1 = PORT_1;

    tri [31:0] PORT_2;
    assign PORT_2 = GPIO_OE_2 ? GPIO_OUT_2 : 32'hZZZZ_ZZZZ;
    assign GPIO_IN_2 = PORT_2;


    // FInish when yoiu see a special pattern on the GPIO
    always@*
        if (GPIO_OUT_0 == 32'hF00F_E00E && GPIO_OUT_1 == 32'hF00FE00D && GPIO_OUT_2 == 32'hF00F_E00C) begin
            #100;
            $display("Test Passed");
            $finish;
        end

endmodule
