module multiplier(
    input wire clk,
    input wire rst_n,
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] p
);

    reg [31:0] p_d;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p <= 32'h0;
        end else begin
            p <= a * b;
        end
    end    

    assign p = p_d; 

    

endmodule