/*
    4-Port AHB Lite Splitter
    It assumes that the address space is divided into 16 equal 256MB Pages.
    The most significant 4 bits of the address are used to select the slave.
    Each slave is assigned one of the 16 memory pages.
*/
module ahbl_splitter_4 #(parameter  S0=4'h0, 
                                    S1=4'h2, 
                                    S2=4'h4, 
                                    S3=4'h8,
                                    S4=4'hF) 
(
    input   wire        HCLK,
    input   wire        HRESETn,

    // BUS
    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    output  wire        HREADY,
    output  wire [31:0] HRDATA,

    // SLAVE 0
    output  wire        S0_HSEL,
    input   wire [31:0] S0_HRDATA,
    input   wire        S0_HREADYOUT,

    // SLAVE 1
    output  wire        S1_HSEL,
    input   wire [31:0] S1_HRDATA,
    input   wire        S1_HREADYOUT,

    // SLAVE 2
    output  wire        S2_HSEL,
    input   wire [31:0] S2_HRDATA,
    input   wire        S2_HREADYOUT,

    // Slave 3
    output  wire        S3_HSEL,
    input   wire [31:0] S3_HRDATA,
    input   wire        S3_HREADYOUT,

    // Slave 4
    output  wire        S4_HSEL,
    input   wire [31:0] S4_HRDATA,
    input   wire        S4_HREADYOUT

);

    // The Decoder
    reg [4:0] sel;
    reg [4:0] sel_d;
    always @*
        case(HADDR[31:28])
            S0: sel = 5'b00001;
            S1: sel = 5'b00010;
            S2: sel = 5'b00100;
            S3: sel = 5'b01000;
            S4: sel = 5'b10000;
            default: sel = 5'b00000;
        endcase
    assign S0_HSEL = sel[0];
    assign S1_HSEL = sel[1];
    assign S2_HSEL = sel[2];
    assign S3_HSEL = sel[3];
    assign S4_HSEL = sel[4];

    // The Slave MUX Selection Saving
    always@(posedge HCLK or negedge HRESETn) begin
        if(~HRESETn) begin
            sel_d <= 5'b00000;
        end else if(HTRANS[1] & HREADY) begin
            sel_d <= sel;
        end
    end

    assign HREADY =     (sel_d[0])  ?   S0_HREADYOUT :
                        (sel_d[1])  ?   S1_HREADYOUT :
                        (sel_d[2])  ?   S2_HREADYOUT :
                        (sel_d[3])  ?   S3_HREADYOUT :
                        (sel_d[4])  ?   S4_HREADYOUT :
                        1'b1;

    assign HRDATA =   (sel_d[0])  ?   S0_HRDATA :
                        (sel_d[1])  ?   S1_HRDATA :
                        (sel_d[2])  ?   S2_HRDATA :
                        (sel_d[3])  ?   S3_HRDATA :
                        (sel_d[4])  ?   S4_HRDATA :
                        32'hBADDBEEF;

endmodule