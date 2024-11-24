module tmr #(parameter SZ=16)(
    input   wire            clk,
    input   wire            rst_n,
    input   wire [7:0]      clkdiv,
    input   wire [SZ-1:0]   load,
    input   wire            en,
    output  wire            irq
);
    reg [7:0]       divcntr;
    reg [SZ-1:0]    cntr;

    // PED
    reg     en_d;
    wire    en_pulse;
    always@(posedge clk, negedge rst_n)
        if(!rst_n)    
            en_d <= 'b0;
        else
            en_d <= en;
    assign en_pulse = ~en_d & en;

    wire divcntrzero    =   (divcntr == 'b0);
    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            divcntr <= 'b0;
        else if(en_pulse)
            divcntr <= clkdiv - 1;
        else if(divcntrzero)
            divcntr <= clkdiv - 1;
        else if(en)
            divcntr <= divcntr - 'b1;

    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            cntr <= 'b0;
        else if(en_pulse)
            cntr <= load;
        else if(divcntrzero)
            if(cntr == 'b0)
                cntr <= load;
            else 
                cntr <= cntr - 1;

    assign irq = (cntr == 'b0) & divcntrzero;

endmodule
