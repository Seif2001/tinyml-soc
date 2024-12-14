

module i2s_test (
    input WS,
    input BCLK,
    output DIN,
    input en, 
    input rst_n
);
    reg [32:0] test_array [127:0];  // Array for storing 32-bit values

    initial begin
        $readmemh("/home/seif/dev/projects/tinyml-soc/Lab8_microphone/rtl/i2s/test.hex", test_array);  // Load data from test.hex file
    end

    integer i = 0;
    integer j = 0;

    reg DIN_d;

    always @(negedge BCLK, negedge rst_n) begin
        if (!rst_n) begin
            DIN_d <= 0;
            i <= 0;
            j <= 0;
        end
        else
        if (!WS && en) begin
            DIN_d <= test_array[j][31-i];  // Access each bit in the 32-bit word
            //print din_d;
            //$display("DIN_d: %b %h %d %d", DIN, test_array[j], i, j);
            //DIN_d<=1;

        // Increment i and reset when it reaches 31
            
            if (i == 31) begin
                i <= 0;
                j <= (j + 1) % 128;  // Reset j to 0 after reaching 7
                $display("j: %d", j);
            end else begin
                i <= i + 1;
            end
        end
    end

    assign DIN = DIN_d;
endmodule
