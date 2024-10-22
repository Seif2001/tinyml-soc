#define INT32U volatile unsigned int

typedef struct
{
    INT32U* ctrl_counter;
    INT32U* cfg_counter;
    INT32U* ps_counter;
    INT32U* load_counter; 
    INT32U* timer_counter;
    INT32U* tick_counter;
} Timer;


void initialize_timer();
void _start_timer(INT32U prescaler);
INT32U* start_timer(INT32U prescaler);
void delay(INT32U ms);
INT32U* get_timer_counter();
INT32U* end_timer();
