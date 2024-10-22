module multiplier_tb;
reg clk;
reg rst_n;
reg[31:0] a;
reg[31:0] b;
wire[31:0] p;

multiplier duv(
    .clk(clk),
    .rst_n(rst_n),
    .a(a),
    .b(b),
    .p(p)
);

always #10 clk = !clk;

initial begin
    #777;
    @(posedge clk);
    #1 rst_n = 1;
end

initial begin
    $dumpfile("multiplier_tb.vcd");
    $dumpvars;
end

initial begin
    clk = 0;
    a = 0;
    b = 0;
    rst_n = 0;
    wait(rst_n == 1'b1);
    @(posedge clk);
    a = 5;
    b = 10;
    @(posedge clk);

    if(p == a*b) begin
        $display("Test Passed");
        $finish;
    end
    $display("Test failed p = %d", p);
    #1000;
    $finish;
end





endmodule