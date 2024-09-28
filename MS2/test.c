volatile unsigned int* gpio_oe_0 = (volatile unsigned int *) 0x40000004;
volatile unsigned int* gpio_data_0 = (volatile unsigned int *) 0x40000000;

volatile unsigned int* gpio_oe_1 = (volatile unsigned int *) 0x4000000C;
volatile unsigned int* gpio_data_1 = (volatile unsigned int *) 0x40000008;

volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x40000010;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x40000014;



int main(){
    // configure the GPIO as an output
    *gpio_oe_0 = 0xFFFFFFFF;
    // output something
    *gpio_data_0 = 0xF00FE00E; 

    // configure the GPIO as an output
    *gpio_oe_1 = 0xFFFFFFFF;
    // output something
    *gpio_data_1 = 0xF00FE00D;

    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFFF;
    // output something
    *gpio_data_2 = 0xF00FE00C;

    return 0;
}