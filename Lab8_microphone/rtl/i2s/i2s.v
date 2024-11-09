module i2s(
    input clk,
    input rst_n,
    output WS,
    output BCLK,
    input DIN,
    output reg done,
    output reg [size -1:0] data,
    input en,
    input ack_data,
    input ack_done
);

reg BCLK_d, WS_d;
localparam size = 32;
reg [$clog2(size) -1:0] bit_count;
reg [size -1 : 0] shift_reg;
reg [5:0] WS_cntr;
reg [1:0] BCLK_cntr;
wire WS_cntr_zero = WS_cntr == 6'b000000;
wire cntr_two = BCLK_cntr == 2'b10;
// WS
always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        WS_d <= 0;
    end
    else if(en) begin
        if(WS_cntr_zero && cntr_two) begin
            WS_d <= !WS_d;
        end
    end
end

// WS counter

always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        WS_cntr <= 0;
    end
    else if(en) begin
        if (cntr_two) begin
            WS_cntr <= WS_cntr + 1;
        end
    end
end

// BCLK

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        BCLK_d <= 0;
    end
    else if(en) begin
        if(cntr_two) begin
            BCLK_d <= ~BCLK_d;
        end
    end
end

// bclk counter

always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        BCLK_cntr <= 0;
    end
    else if(en) begin
        if(cntr_two) begin
            BCLK_cntr <= 0;
        end
        else BCLK_cntr <= BCLK_cntr + 1;
    end
end


// shift register

always @(posedge clk, negedge rst_n) begin
     if (!rst_n) begin
        shift_reg <= 32'd0;
    end
    else if(en) begin
        if(!WS && BCLK_cntr == 0 && !BCLK) begin 
            shift_reg <= {shift_reg[size -2 : 0],DIN};
        end
    end
end


// done
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        done <= 0;
    end
    else if(en) begin
        if(WS_cntr_zero) begin
            done <= 1;
        end
        else if(ack_done) begin
            done <= 0;
        end
    end
end

// data
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        data <= 0;
    end
    else if(en) begin
        if(WS_cntr_zero) begin
            data <= shift_reg;
        end
        else if(ack_data) begin
            data <= shift_reg;
        end
    end
end

assign WS = WS_d;
assign BCLK = BCLK_d;


endmodule

