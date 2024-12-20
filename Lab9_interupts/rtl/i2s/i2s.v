
module i2s #(parameter WSZ=32)(
    input   wire            clk,
    input   wire            rst_n,
    input   wire            mode,
    input   wire            tick,
    output  wire [WSZ-1:0]  sample,
    output  wire            rdy,

    input   wire            SD,
    output  wire            SCK,
    output  wire            WS
);

    reg [WSZ-1:0]           shifter;
    reg [5:0]               cntr;

    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            shifter <= 'b0;
        else if(tick & ~SCK)
            shifter <= {shifter[WSZ-2:0], SD};

    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            cntr <= 'b0;
        else if(tick)
            cntr <= cntr + 1'b1;

    reg ws;
    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            ws <= 'b0;
        else if(tick)
            if(cntr == 6'h3F)
                ws <= ~ws;
        
    assign SCK = cntr[0];
    assign WS = ws;
    assign sample = shifter;
    assign rdy = tick & (cntr == (mode ? (6'h01) : (6'h3F)));

endmodule