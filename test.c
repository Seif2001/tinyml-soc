volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;



int main(){


    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;

    // output something
    
    *gpio_data_2 = 0x00000003;

    return 0;
}