module i2s(
    input clk,
    input rst_n,
    output WS,
    output BCLK,
    input DIN,
    output reg done,
    output reg [size*2 -1:0] data,
    input en,
    input ack_data,
    input ack_done
);

reg BCLK_d, WS_d;
localparam size = 32;
reg [$clog2(size):0] bit_count;
reg [size*2 -1 : 0] shift_reg;


// WS
always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        WS_d <= 0;
    end
    else if(en) begin
        if(bit_count >= size) begin
            WS_d <= 1;
        end
        else WS_d <= 0;
    end
end

// BCLK

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        BCLK_d <= 0;
    end
    else if(en) begin
        BCLK_d <= !BCLK_d;
    end
end

// bit_counter 

always @(posedge clk, negedge rst_n) begin
     if (!rst_n) begin
        bit_count <= 0;
    end
    else if(en) begin
        if(BCLK_d) begin 
            bit_count <= bit_count + 1;
        end
    end
end

// shift register

always @(posedge clk, negedge rst_n) begin
     if (!rst_n) begin
        shift_reg <= 64'd0;
    end
    else if(en && BCLK_d) begin
        if(bit_count < (size*2) -1) begin 
            shift_reg <= {shift_reg[(size*2) -2 : 0],DIN};
        end
        else shift_reg <= 64'd0;
    end
end


// done
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        done <= 0;
    end
    else if(en) begin
        if(bit_count == (size*2) -1) begin
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
        if(bit_count == (size*2) -1) begin
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

