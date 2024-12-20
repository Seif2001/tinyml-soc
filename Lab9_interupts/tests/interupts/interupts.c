#include "../common/include/time.h"
#include "../common/include/uart.h"
#include <stdint.h>
#include <stdbool.h> // Add this line to include the bool type

// Peripheral memory-mapped addresses
volatile unsigned int* gpio_data_2 = (volatile unsigned int*) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int*) 0x42000004;
volatile unsigned int* i2s_en = (volatile unsigned int*) 0x80000000;
volatile unsigned int* i2s_data = (volatile unsigned int*) 0x80000008;
volatile unsigned int* i2s_done = (volatile unsigned int*) 0x80000004;
volatile unsigned int* i2s_status = (volatile unsigned int*) 0x8000000C;

// bool isFIFOEmpty(){
//     return *i2s_status == 0x00000001;
// }

// void mret(void){
//     asm volatile("mret");
// }

// volatile int flag = 0;
// void isr(void) __attribute__((interrupt));
// void isr(void){
//     flag = 1;
//     mret();
// }


// // Function prototype for setting mtvec
// void setup_mtvec(void (*handler)(), uint32_t mode);

// // Setup mtvec for ISR
// void setup_mtvec(void (*handler)(), uint32_t mode) {
//     uintptr_t mtvec_value = ((uintptr_t)handler); // Align and set mode
//     asm volatile ("csrw mtvec, %0" : : "r" (mtvec_value));
//     asm volatile ("csrsi mstatus, 0x8"); // Enable global interrupts
//     asm volatile("csrsi mie, 0x8");      //I dont know if this line is needed but it enables "external" interrupts
// }

int main() {
    // setup_mtvec(isr, 0);
    *i2s_en = 0x00000009; // Enable I2S with specific configuration
    *gpio_oe_2 = 0xFFFFFFFF;
    volatile int x = 2;
    volatile char c1, c2, c3; // Declare variables for the three bytes
    *gpio_data_2 = 0x11111111;

    uart_init(3);         // Initialize UART with a baud rate setting
    volatile int y = 3;
    volatile int z = x+y;
    *gpio_data_2 = z;
    // while (1) {

    //     if(flag==1){
    //         asm volatile ("csrsi mstatus, 0x0"); // disable global interrupts
    //         // while (*i2s_done != 0x00000003); // Wait for I2S data to be ready
    //         // while(!isFIFOEmpty()){

    //             x = *i2s_data; // Read 32-bit I2S data
    //             y = *i2s_status;

    //              *gpio_data_2 = y; // Output the data to GPIO for debugging

    //         //     // // Extract 3 bytes from the 32-bit value
    //         //     // c1 = (x >> 24) & 0xFF; // Most significant byte (bits 31:24)
    //         //     // c2 = (x >> 16) & 0xFF; // Second byte (bits 23:16)

    //         //     // // Send the three bytes over UART
    //         //     // uart_putc(c1); // Send first byte
    //         //     // uart_putc(c2); // Send second byte
    //         //     y++;
    //         // }
    //         asm volatile ("csrsi mstatus, 0x8"); // enable global interrupts

    //         flag = 0;
    //     }
    //     else{

    //         *gpio_data_2 = 0x00000100;
    //     }
       
    // }

    return 0;
}