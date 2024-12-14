#include "../common/include/time.h"
#include "../common/include/uart.h"
#include <stdint.h>


// volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
// volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;

// volatile unsigned int* gpio_data_1 = (volatile unsigned int *) 0x41000000;
// volatile unsigned int* gpio_oe_1 = (volatile unsigned int *) 0x41000004;

unsigned int __mulsi3(unsigned int a, unsigned int b){
    volatile unsigned int* multiplicand_a = (volatile unsigned int *) 0x70000000;
    volatile unsigned int* multiplicand_b = (volatile unsigned int *) 0x70000004;
    volatile unsigned int* product = (volatile unsigned int *) 0x70000008;
    *multiplicand_a = a;
    *multiplicand_b = b;
    return *product;
}





int main(){
    

    // *gpio_oe_2 = 0xFFFFFFF;
    // *gpio_oe_1 = 0xFFFFFFF;
    char byteArray[6];
    volatile int c;
    initialize_timer();
    start_timer(5999);
    for(volatile int i =0; i< 100; i++){
        for(volatile int j = 0; j<100; j++){
            c = i*j;
        }
    }
    volatile unsigned int* time = end_timer();
    uint8_t x  = *time;
    uart_init(625);
    uart_putc(x);


}