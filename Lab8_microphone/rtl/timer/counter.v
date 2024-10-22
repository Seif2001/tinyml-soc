module counter(
    input wire clk,
    input wire rst_n,
    input wire en,
    input wire reset_tim,
    input wire [15:0] prescaler,
    input wire [31:0] load,
    input wire up_down,
    input wire one_shot,
    output wire tick,
    output wire [31:0] count
);

    reg [15:0]prescaler_counter;
    reg [31:0]count_d;
    wire tick_d;
    reg first_run;
    wire [31:0] next;

    // prescaler counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prescaler_counter <= 16'h0;
        end
        else if (en) begin
            if (reset_tim) begin
                prescaler_counter <= 16'h0;
            end
            else if (prescaler_counter == prescaler) begin
                prescaler_counter <= 16'h0;
            end
            else begin
                prescaler_counter <= prescaler_counter + 1;
            end
        end
    end


    // first run
   
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        first_run <= 1'b1;
    end
    else if (en) begin
        if (reset_tim) begin
            first_run <= 1'b1;
        end
        else if (prescaler_counter == prescaler) begin
            first_run <= 1'b0;
        end
    end
end

    // Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count_d <= 0;
        end
        else if (en) begin
            if (reset_tim) begin
                count_d <= 0;
            end
            else if (prescaler_counter == prescaler) begin
                count_d <= next;
            end
        end
    end


    assign next =  one_shot ? (up_down ? ((count_d == load) ? count_d : count_d + 1 ) : (first_run ? load : (count_d == 0) ? count_d : count_d - 1)) : 
                              ((up_down ? ((count_d == load) ? 0 : count_d + 1 ) : ((count_d == 0) ? load : count_d - 1)));

    assign tick_d = up_down ? ((count_d == load) ? 1 : 0 ) : (first_run ? 0 : (count_d == 0) ? 1 : 0);

    assign tick = tick_d;

    assign count = count_d;
 
    
endmodule