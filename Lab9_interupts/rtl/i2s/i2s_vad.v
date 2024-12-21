module i2s_vad(
    input wire clk,
    input wire rst_n,
    input wire [31:0] sample,     // I2S parallel sample (32-bit)
    input wire rdy,               // New sample ready
    output reg led_output         // LED output for speech detection
);

    // Parameters
    localparam WINDOW_SIZE = 80;   // 5 ms at 16 kHz
    localparam HALF_WINDOW = 40;   // 2.5 ms
    localparam THRESHOLD = 32'h100000; // Energy threshold for speech

    // Registers
    reg [31:0] reg_energy_80;     // Accumulator for 80 samples
    reg [31:0] reg_energy_40;     // Accumulator for first 40 samples
    reg [6:0] sample_count;       // Counter for samples in the window

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_energy_80 <= 32'd0;
            reg_energy_40 <= 32'd0;
            sample_count <= 7'd0;
            led_output <= 1'b0;
        end else if (rdy) begin
            // Add energy of the current sample to the full 80-sample window
            reg_energy_80 <= reg_energy_80 + sample * sample;

            // Accumulate energy into the first 40-sample register
            if (sample_count < HALF_WINDOW) begin
                reg_energy_40 <= reg_energy_40 + sample * sample;
            end

            // Increment sample count
            sample_count <= sample_count + 1;

            // If we reach the full 80-sample window
            if (sample_count == WINDOW_SIZE - 1) begin
                // Subtract the energy of the first 40 samples
                reg_energy_80 <= reg_energy_80 - reg_energy_40;

                // Update the first 40-sample register with the next 40-sample block
                reg_energy_40 <= reg_energy_80;

                // Threshold comparison for speech detection
                if (reg_energy_80 > THRESHOLD)
                    led_output <= 1'b1;  // Speech detected
                else
                    led_output <= 1'b0;  // No speech

                // Reset the sample counter to 40 for the next partial window
                sample_count <= HALF_WINDOW - 1;
            end
        end
    end
endmodule
