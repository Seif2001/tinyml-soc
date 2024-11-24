module multiplier(
    input wire clk,
    input wire rst_n,
    input wire [2:0] a,
    input wire [2:0] b,
    output wire [11:0] p
);

    reg [11:0] p_d;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            p_d <= 4'h0;
        end else begin
            p_d <= a * b;
        end
    end    

    assign p = p_d; 

    

endmodule