volatile unsigned int* gpio_data_2 = (volatile unsigned int *) 0x42000000;
volatile unsigned int* gpio_oe_2 = (volatile unsigned int *) 0x42000004;


volatile unsigned int* ctrl_counter = (volatile unsigned int *) 0x60000000;
volatile unsigned int* cfg_counter = (volatile unsigned int *) 0x60000004;
volatile unsigned int* ps_counter = (volatile unsigned int *) 0x60000008;
volatile unsigned int* load_counter = (volatile unsigned int *) 0x6000000C;
volatile unsigned int* timer_counter = (volatile unsigned int *) 0x6000000F;
volatile unsigned int* tick_counter = (volatile unsigned int *) 0x60000010;


void timer_init(){
}

void delay(unsigned int  ms){
    ms = ms * 6000;
    *ps_counter = 0x00000009;
    *cfg_counter = 0x00000003;
    *ctrl_counter = 0x00000001;
    *load_counter = ms;

    while(*timer_counter != ms);
    *ctrl_counter = 0x00000000;
    //*cfg_counter = 0x00000001;
}




int main(){


    // configure the GPIO as an output
    *gpio_oe_2 = 0xFFFFFFF;
    timer_init();

    // output something
    *gpio_data_2 = *timer_counter;
    unsigned int led = 0x00000001;
    
    while(1){
        *gpio_data_2 = led;
        int mod = 7;
        led = (led+1)%mod;
        delay(100);
    }

    return 0;
}