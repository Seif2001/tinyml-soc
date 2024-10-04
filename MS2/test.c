volatile unsigned int* gpio_oe_0 = (volatile unsigned int *) 0x40000004;
volatile unsigned int* gpio_data_0 = (volatile unsigned int *) 0x40000000;

volatile unsigned int* gpio_oe_1 = (volatile unsigned int *) 0x41000004;
volatile unsigned int* gpio_data_1 = (volatile unsigned int *) 0x41000000;

volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;



int main(){
    // configure the GPIO as an output
    *gpio_oe_0 = 0xFFFFFFFF;
    // output something

    // configure the GPIO as an output
    *gpio_oe_1 = 0xFFFFFFFF;
    // output something
    *gpio_data_1 = 1;
    *gpio_data_0 = 2;

    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;

    // output something
    
    *gpio_data_2 = *gpio_data_1+*gpio_data_0;
    return 0;
}