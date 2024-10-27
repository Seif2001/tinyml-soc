#include "../common/include/time.h"
#include "../common/include/uart.h"
#include<stdint.h>

volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;


volatile unsigned int* i2s_en = (volatile unsigned int *) 0x80000000;
volatile unsigned int* i2s_done = (volatile unsigned int *) 0x80000004;
volatile unsigned int* i2s_data = (volatile unsigned int *) 0x80000008;

volatile char i2s_data_buffer[20];

int main(){
    
    *i2s_en = 1;
    initialize_timer();
    uart_init(625);
    start_timer(100);
    int i = 0;
    while(get_timer_counter() < 10){
        while(*i2s_done == 0);
        //store i2s data
        i2s_data_buffer[i] = *i2s_data << 24;
        i2s_data_buffer[i+2] = *i2s_data << 16;
        i2s_data_buffer[i+3] = *i2s_data << 8;
        i2s_data_buffer[i+4] = *i2s_data;
        
        i+=4;    
        *gpio_data_2 = i;
        
    }
    // send data to uart
    end_timer();
    for(int j=0; j<20; j++){
        *gpio_data_2 = i2s_data_buffer[j];
    }

    //uart_puts(i2s_data_buffer);


}