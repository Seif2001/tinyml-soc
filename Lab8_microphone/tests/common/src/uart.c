volatile unsigned int* uart_ctrl = (volatile unsigned int *) 0x50000000;
volatile unsigned int* uart_bauddiv = (volatile unsigned int *) 0x50000004;
volatile unsigned int* uart_status = (volatile unsigned int *) 0x50000008;
volatile unsigned int* uart_data = (volatile unsigned int *) 0x5000000C;
#include<stdint.h>

void uart_init(int bauddiv){
    *uart_bauddiv = bauddiv;
    *uart_ctrl = 1;
}

void uart_putc(char c){
    while(*uart_status == 0);
    *uart_data = c;
    *uart_ctrl |= 2;
}

void uart_puts(char *s){
    for(int i=0; s[i]; i++)
        uart_putc(s[i]);
}

void uart_puti8(uint8_t i){
    while(*uart_status == 0);
    *uart_data = i;
    *uart_ctrl |= 2;
    
}

void uart_puti(int i){
    uint8_t x;
    for(int j=0; j<4; j++){
        x = (i >> (8*j)) & 0xFF;
        uart_puti8(x);
    }
}
