module prescaler_counter (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [15:0] prescaler,
    output wire tick
);

    reg [15:0] count;
    reg tick_d;
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            count <= 16'h0;
            tick_d <= 0;
        end else if(enable) begin
            if(count == 16'h0) begin
                count <= prescaler == 16'h0 ? 16'h1 : prescaler;  // Prevent zero prescaler
                tick_d <= 1;
            end else begin
                count <= count - 1;
                tick_d <= 0;
            end
        end
    end

    assign tick = tick_d;

endmodule