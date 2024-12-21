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

volatile unsigned int* dma_saddr= (volatile unsigned int*) 0x90000000;
volatile unsigned int* dma_daddr = (volatile unsigned int*) 0x90000004;
volatile unsigned int* dma_start= (volatile unsigned int*) 0x90000008;
volatile unsigned int* dma_src_config= (volatile unsigned int*) 0x9000000C;
volatile unsigned int* dma_dst_config= (volatile unsigned int*) 0x90000010;
volatile unsigned int* irq_config= (volatile unsigned int*) 0x90000014;
volatile unsigned int* block_count= (volatile unsigned int*) 0x90000018;
volatile unsigned int* block_size= (volatile unsigned int*) 0x9000001C;


#define BUFFER_SIZE 16
volatile int flag = 0;
volatile int data[BUFFER_SIZE];


void read_from_dest_addr() {
    volatile int x;
    volatile char c1, c2; // Declare variables for the three bytes

    for (int i = 0; i < BUFFER_SIZE; i++) {
        x = *((volatile int*)(*dma_daddr + i * sizeof(int)));
        c1 = (x >> 24) & 0xFF; // Most significant byte (bits 31:24)
        c2 = (x >> 16) & 0xFF; // Second byte (bits 23:16)
        uart_putc(c1); // Send first byte
        uart_putc(c2); // Send second byte
        *gpio_data_2 = *dma_daddr; // Output the data to GPIO for debugging
    }
}

void init_dma(){
    *dma_saddr = 0x80000008;
    *dma_daddr = (uint32_t)&data[0];
    *dma_src_config = 0x00000002;
    *dma_dst_config = 0x00000042;
    *irq_config = 0x00000001;
    *block_count = 0x00000001;
    *block_size = 0x0000000F;
    *dma_start = 0x00000001;
}

void init_i2s(){
    *i2s_en = 0x00000001;
}
bool isFIFOEmpty(){
    return *i2s_status == 0x00000001;

}

void mret(void){
    asm volatile("mret");
}

void isr(void) __attribute__((interrupt));
void isr(void){
    volatile int x = 2;

    volatile int y = 3;
    volatile int z = x+y;
    *gpio_data_2 = z;
    init_dma();
    uart_putc('a');
    read_from_dest_addr();

    flag = 1;
        mret();
    uart_putc('b');

}


// Function prototype for setting mtvec
void setup_mtvec(void (*handler)(), uint32_t mode);

// Setup mtvec for ISR
void setup_mtvec(void (*handler)(), uint32_t mode) {
    uintptr_t mtvec_value = ((uintptr_t)handler); // Align and set mode
    asm volatile ("csrw mtvec, %0" : : "r" (mtvec_value));
    asm volatile ("csrsi mstatus, 0x8"); // Enable global interrupts
    asm volatile("csrsi mie, 0x8");      //I dont know if this line is needed but it enables "external" interrupts
}

int main() {
    setup_mtvec(isr, 0);
    init_dma();
    init_i2s();

    *gpio_oe_2 = 0xFFFFFFFF;
    *gpio_data_2 = 0x11111111;

    uart_init(3);         // Initialize UART with a baud rate setting
 
    while (1) {

        if(flag==1){
            *gpio_data_2 = 0x00000FFF;


            flag = 0;
        }
        else{

            *gpio_data_2 = 0x00000001;
        }
       
    }

    return 0;
}