volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;


volatile unsigned int* ctrl_counter = (volatile unsigned int *) 0x60000000;
volatile unsigned int* cfg_counter = (volatile unsigned int *) 0x60000004;
volatile unsigned int* ps_counter = (volatile unsigned int *) 0x60000008;
volatile unsigned int* load_counter = (volatile unsigned int *) 0x6000000C;
volatile unsigned int* timer_counter = (volatile unsigned int *) 0x6000000F;
volatile unsigned int* tick_counter = (volatile unsigned int *) 0x60000010;


void timer_init(){
    *ctrl_counter = 0x00000001;
    *cfg_counter = 0x00000002;
    *ps_counter = 0x00000009;
    *load_counter = 0x00000000;
}

void delay(unsigned int  ms){
    *load_counter = ms;
    *cfg_counter = 0x00000002;
    *ctrl_counter = 0x00000001;

    while((*tick_counter & 0x1) == 1);
}




int main(){


    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;
    timer_init();

    // output something
    
    *gpio_data_2 = 0x00000003;
    unsigned int led = 0x00000001;
    while(1){
        *gpio_data_2 = led;
        led = (led+1);
        //for(volatile int i = 0; i < 10; i++);
        delay(10);
    }

    return 0;
}