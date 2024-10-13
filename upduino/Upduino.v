module Upduino(
  output wire led_red  , // Red
  output wire led_blue , // Blue
  output wire led_green,  // Green 
  output wire tx,
  output wire tick
);
    reg int_osc;
    SB_HFOSC u_SB_HFOSC (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
    defparam u_SB_HFOSC.CLKHF_DIV = "0b11"; // Example setting for lowest frequency


    wire [31:0] GPIO_OUT_A;
    wire [31:0] GPIO_OE_A;
    wire [31:0] GPIO_IN_A;

    wire [31:0] GPIO_OUT_B;
    wire [31:0] GPIO_OE_B;
    wire [31:0] GPIO_IN_B;

    wire [31:0] GPIO_OUT_C;
    wire [31:0] GPIO_OE_C;
    wire [31:0] GPIO_IN_C;

    wire red_pwm, green_pwm, blue_pwm;

    Hazard2_SoC u_Hazard2_SoC (
        .HCLK(int_osc),
        .HRESETn(1'b1),
        .GPIO_OUT_A(GPIO_OUT_A),
        .GPIO_OE_A(GPIO_OE_A),
        .GPIO_IN_A(GPIO_IN_A),
        .GPIO_OUT_B(GPIO_OUT_B),
        .GPIO_OE_B(GPIO_OE_B),
        .GPIO_IN_B(GPIO_IN_B),
        .GPIO_OUT_C(GPIO_OUT_C),
        .GPIO_OE_C(GPIO_OE_C),
        .GPIO_IN_C(GPIO_IN_C),

        .UART_TX(tx),
        .tick(tick)

    );

    SB_RGBA_DRV RGB_DRIVER (
      .RGBLEDEN(1'b1                                            ),
      .RGB0PWM (red_pwm),
      .RGB1PWM (green_pwm),
      .RGB2PWM (blue_pwm),
      .CURREN  (1'b1                                            ),
      .RGB0    (led_green                                       ), //Actual Hardware connection
      .RGB1    (led_blue                                        ),
      .RGB2    (led_red                                         )
  );

  assign red_pwm = GPIO_OUT_C[0];
  assign green_pwm = GPIO_OUT_C[1];
  assign blue_pwm = GPIO_OUT_C[2];
  
  defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";

endmodule