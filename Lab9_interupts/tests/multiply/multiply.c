#include "../common/include/time.h"
#include "../common/include/uart.h"
#include <stdint.h>


// volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
// volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;

// volatile unsigned int* gpio_data_1 = (volatile unsigned int *) 0x41000000;
// volatile unsigned int* gpio_oe_1 = (volatile unsigned int *) 0x41000004;


int main(){
    

    // *gpio_oe_2 = 0xFFFFFFF;
    // *gpio_oe_1 = 0xFFFFFFF;
    char byteArray[6];
    volatile int c;
    initialize_timer();
    start_timer(10);
    for(volatile int i =0; i< 3; i++){
        for(volatile int j = 0; j<3; j++){
            c = i*j;
        }
    }
    volatile unsigned int* time = end_timer();
    uint8_t x  = *time;
    uart_init(625);
    uart_putc(x);


}