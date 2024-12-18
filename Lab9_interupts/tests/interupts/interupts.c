#include "../common/include/time.h"
#include "../common/include/uart.h"
#include <stdint.h>
#include <stdbool.h> // Add this line to include the bool type

// Peripheral memory-mapped addresses
volatile unsigned int* gpio_data_2 = (volatile unsigned int*) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int*) 0x42000004;

//bool flag = false;
void isr(void) __attribute__((interrupt));
void isr(void){
    uart_init(3);         // Initialize UART with a baud rate setting
    //flag = true;
    uart_puts("ISR");

}


// Function prototype for setting mtvec
void setup_mtvec(void (*handler)(), uint32_t mode);

// Setup mtvec for ISR
void setup_mtvec(void (*handler)(), uint32_t mode) {
    uintptr_t mtvec_value = ((uintptr_t)handler); // Align and set mode
    asm volatile ("csrw mtvec, %0" : : "r" (mtvec_value));
    asm volatile ("csrsi mstatus, 0x8"); // Enable global interrupts
    asm volatile ("csrsi mcause, 0x1"); // Clear the interrupt
}

int main() {
    setup_mtvec(isr, 0);
    *gpio_oe_2 = 0xFFFFFFFF;
    *gpio_data_2 = 0x00000000;

    while (1) {
       
    }

    return 0;
}