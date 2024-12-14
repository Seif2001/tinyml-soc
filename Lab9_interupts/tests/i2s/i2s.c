#include "../common/include/time.h"
#include "../common/include/uart.h"
#include <stdint.h>

// Peripheral memory-mapped addresses
volatile unsigned int* gpio_data_2 = (volatile unsigned int*) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int*) 0x42000004;

volatile unsigned int* i2s_en = (volatile unsigned int*) 0x80000000;
volatile unsigned int* i2s_done = (volatile unsigned int*) 0x80000004;
volatile unsigned int* i2s_data = (volatile unsigned int*) 0x80000008;

int main() {
    *i2s_en = 0x00000009; // Enable I2S with specific configuration
    uart_init(3);         // Initialize UART with a baud rate setting
    int i = 3000000 * 10; // Number of iterations for the main loop
    *gpio_oe_2 = 0xFFFFFFFF; // Enable all GPIO pins as outputs

    volatile int x;
    volatile char c1, c2, c3; // Declare variables for the three bytes

    while (i--) {
        while (*i2s_done != 0x00000003); // Wait for I2S data to be ready

        x = *i2s_data; // Read 32-bit I2S data

        *gpio_data_2 = x; // Output the data to GPIO for debugging

        // Extract 3 bytes from the 32-bit value
        c1 = (x >> 24) & 0xFF; // Most significant byte (bits 31:24)
        c2 = (x >> 16) & 0xFF; // Second byte (bits 23:16)

        // Send the three bytes over UART
        uart_putc(c1); // Send first byte
        uart_putc(c2); // Send second byte
    }

    return 0;
}