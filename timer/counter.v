module counter(
    input wire clk,
    input wire rst_n,
    input wire en,
    input wire start,
    input wire [15:0] prescaler,
    input wire [15:0] load,
    input wire up_down,
    input wire one_shot,
    output wire tick,
    output wire [15:0] count
);

    reg [15:0] count_d;
    reg tick_d;
    reg run;

    wire prescaler_clk;

    prescaler_counter prescaler_counter(
        .clk(clk),
        .rst_n(rst_n),
        .enable(en),
        .prescaler(prescaler),
        .tick(prescaler_clk)
    );

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            count_d <= 16'h0;
            tick_d <= 0;
        end
        else if(start) begin
            if(up_down) begin
                count_d <= 16'h0;
                run <= 1;
            end
            else begin
                count_d <= load;
                run <= 1;
            end
        end
    end

    always@(posedge prescaler_clk) begin
        if(en && run) begin
            if (one_shot) begin
                if(up_down) begin
                    if (count_d == load) begin 
                        run <= 0;
                        count_d <= 16'h0;
                        tick_d <= 1;
                    end
                    else begin
                        count_d <= count_d + 1;
                        tick_d <= 0;
                    end
                end
                else begin
                    if (count_d == 16'h0) begin
                        tick_d <= 1;
                    end
                    else begin
                        tick_d <= 0;
                        count_d = count_d - 1;
                    end
                end
            end
            else begin 
                if(up_down) begin
                    if (count_d == load) begin 
                        run <= 1;
                        count_d <= 16'h0;
                        tick_d <= 1;
                    end
                    else begin
                        count_d <= count_d + 1;
                        tick_d <= 0;
                    end
                end
                else begin
                    if (count_d == 16'h0) begin
                        run <= 1;
                        tick_d <= 1;
                        count_d <= load;
                    end
                    else begin
                        tick_d <= 0;
                        count_d = count_d - 1;
                    end
                end
            end
        end
    end

    assign tick = tick_d;
    assign count = count_d;
endmodule