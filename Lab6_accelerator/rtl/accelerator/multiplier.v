module multiplier(
    input wire clk,
    input wire rst_n,
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [16:0] p
);

    reg [7:0] p_d;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            p_d <= 8'h0;
        end else begin
            p_d <= a * b;
        end
    end    

    assign p = p_d; 

    

endmodule