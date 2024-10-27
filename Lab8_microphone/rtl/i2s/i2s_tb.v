module i2s_tb;
    reg clk = 0;
    reg rst_n = 0;
    wire WS;
    wire BCLK;
    reg DIN;
    wire done;
    wire [31:0] data;
    reg en;
    reg [5:0] counter;

    i2s duv (
        .clk(clk),
        .rst_n(rst_n),
        .WS(WS),
        .BCLK(BCLK),
        .DIN(DIN),
        .done(done),
        .data(data),
        .en(en)
    );

    always #10 clk = !clk;

    initial begin
        #777;
        @(posedge clk);
        #1; 
        rst_n = 1;
    end

    initial begin
        $dumpfile("i2s_tb.vcd");
        $dumpvars;
    end

    initial begin
        en = 0;
        DIN = 0;
        wait(rst_n == 1'b1);
        @(posedge clk);
        en = 1;
        #10000;
        $finish;
    end

    always@(posedge clk or WS) begin
        if(WS) 
            DIN = 1;
    end




endmodule