#include"../common/include/time.h"

volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;


int main(){


    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;

    // output something
    unsigned int led = 0x00000001;
    
    while(1){
        *gpio_data_2 = led;
        led = (led+1);
        delay(100);
    }

    return 0;
}