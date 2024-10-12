volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x43000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x43000004;



int main(){


    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;

    // output something
    
    *gpio_data_2 = 0x00000003;
    // unsigned int* led = 0;
    // while(1){
    //     *led++;
    //     *gpio_data_2 = *led;
    //     for(volatile int i = 0; i < 1000000; i++);
    // }

    return 0;
}