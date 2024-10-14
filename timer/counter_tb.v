module counter_tb;

    reg          clk = 0;
    reg          rst_n = 0;
    reg          en;
    reg          start;
    reg          up_down;
    reg          one_shot;
    reg  [15:0]   prescaler;
    reg  [15:0]   load;
    wire         tick;

    counter duv (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .reset_tim(start),
        .up_down(up_down),
        .one_shot(one_shot),
        .prescaler(prescaler),
        .load(load),
        .tick(tick)
    );

    always #10 clk = !clk;

    initial begin
        #777;
        @(posedge clk);
        #1 rst_n = 1;
    end

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars;
    end

    initial begin
        en = 0;
        up_down = 1;
        one_shot = 0;
        prescaler = 9;
        load = 16;
        start = 0;
        wait(rst_n == 1'b1);
        @(posedge clk);
        en = 1;
        start = 1;
        @(posedge clk);
        start = 0;
        #10000;
        $finish;
    end

    initial begin
        $monitor("tick: %b",tick);
    end

endmodule