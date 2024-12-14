#include"../include/time.h"
Timer timer;


void initialize_timer(){
    timer.ctrl_counter   =(INT32U*) 0x60000000;
    timer.cfg_counter    =(INT32U*) 0x60000004;
    timer.ps_counter     =(INT32U*) 0x60000008;
    timer.load_counter   =(INT32U*) 0x6000000C;
    timer.timer_counter  =(INT32U*) 0x6000000F;
    timer.tick_counter   =(INT32U*) 0x60000010;
}

void _start_timer(INT32U prescaler){
    *(timer.ps_counter) = prescaler;
    *(timer.cfg_counter) = 0x00000003;
    *(timer.ctrl_counter) = 0x00000001;
}


Timer start_timer(INT32U prescaler){
    *(timer.ps_counter) = prescaler;
    *(timer.cfg_counter) = 0x00000003;
    *(timer.ctrl_counter) = 0x00000001;
    *(timer.load_counter) = 0x11111111;
    return timer;
}



void delay(INT32U ms){
    _start_timer(5999);
    *(timer.load_counter) = ms;
    while(*(timer.timer_counter) != ms);
    *(timer.ctrl_counter) = 0x00000000;
}

INT32U get_timer_counter(){
    return *timer.timer_counter;
}

INT32U end_timer(){
    *(timer.ctrl_counter )= 0x00000000;
    return *timer.timer_counter;
}