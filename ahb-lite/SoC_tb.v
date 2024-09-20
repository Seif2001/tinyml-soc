module SoC_tb;
    reg         HCLK;
    reg         HRESETn;
    

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
        $dumpfile("SoC_tb.vcd");
        $dumpvars(0, SoC_tb);
        #10_000;
        $finish;
    end

    SoC MUV (
        .HCLK(HCLK),
        .HRESETn(HRESETn)
    );

endmodule
