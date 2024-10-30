#include "../common/include/time.h"
#include "../common/include/uart.h"
#include<stdint.h>

volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;


volatile unsigned int* i2s_en = (volatile unsigned int *) 0x80000000;
volatile unsigned int* i2s_done = (volatile unsigned int *) 0x80000004;
volatile unsigned int* i2s_data = (volatile unsigned int *) 0x80000008;

//volatile char i2s_data_buffer[512];

int main(){
    
    *i2s_en = 1;
    uart_init(9);
    int i = 3000000 * 10;
    volatile char c1;
    volatile char c2;
    volatile char c3;
    volatile int x;
    while(i--){
        while(*i2s_done == 0);
        //store i2s data
        x = *i2s_data;
        c1 =  (x >> 16) & 0xff;
        c2 = (x >>24) & 0xff;
        //i2s_data_buffer[i+3] = *i2s_data;

        uart_putc(c1);
        uart_putc(c2);
    }
    
  



}