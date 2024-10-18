#include "../common/include/uart.h"
volatile unsigned int* gpio_data = (volatile unsigned int *) 0x40000000;
volatile unsigned int* gpio_oe = (volatile unsigned int *) 0x40000004;


void exit(){
    *gpio_data = 0xF00FE00E;
}

int main(){
    *gpio_oe = 0xFFFFFFFF;  // configure the GPIO as an output

    uart_init(625);
    while(1){
        uart_puts("Hello World!\n");
    }

    exit();
    return 0;
}