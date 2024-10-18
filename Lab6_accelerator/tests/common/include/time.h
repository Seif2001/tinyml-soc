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
