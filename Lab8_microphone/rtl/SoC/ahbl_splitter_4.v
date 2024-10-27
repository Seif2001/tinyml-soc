/*
    4-Port AHB Lite Splitter
    It assumes that the address space is divided into 16 equal 256MB Pages.
    The most significant 4 bits of the address are used to select the slave.
    Each slave is assigned one of the 16 memory pages.
*/
module ahbl_splitter_4 #(parameter  S0=4'h0, 
                                    S1=4'h2, 
                                    S2=4'h4, 
                                    S3=4'h5,
                                    S4=4'h6,
                                    S5=4'h7,
                                    S6=4'h8) 
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
    input   wire        S4_HREADYOUT,

    // Slave 5
    output  wire        S5_HSEL,
    input   wire [31:0] S5_HRDATA,
    input   wire        S5_HREADYOUT,

    // Slave 5
    output  wire        S6_HSEL,
    input   wire [31:0] S6_HRDATA,
    input   wire        S6_HREADYOUT

);

    // The Decoder
    reg [6:0] sel;
    reg [6:0] sel_d;
    always @*
        case(HADDR[31:28])
            S0: sel = 7'b0000001;
            S1: sel = 7'b0000010;
            S2: sel = 7'b0000100;
            S3: sel = 7'b0001000;
            S4: sel = 7'b0010000;
            S5: sel = 7'b0100000;
            S6: sel = 7'b1000000;
            default: sel = 7'b000000;
        endcase
    assign S0_HSEL = sel[0];
    assign S1_HSEL = sel[1];
    assign S2_HSEL = sel[2];
    assign S3_HSEL = sel[3];
    assign S4_HSEL = sel[4];
    assign S5_HSEL = sel[5];
    assign S6_HSEL = sel[6];

    // The Slave MUX Selection Saving
    always@(posedge HCLK or negedge HRESETn) begin
        if(~HRESETn) begin
            sel_d <= 7'b000000;
        end else if(HTRANS[1] & HREADY) begin
            sel_d <= sel;
        end
    end

    assign HREADY =     (sel_d[0])  ?   S0_HREADYOUT :
                        (sel_d[1])  ?   S1_HREADYOUT :
                        (sel_d[2])  ?   S2_HREADYOUT :
                        (sel_d[3])  ?   S3_HREADYOUT :
                        (sel_d[4])  ?   S4_HREADYOUT :
                        (sel_d[5])  ?   S5_HREADYOUT :
                        (sel_d[6])  ?   S6_HREADYOUT :
                        1'b1;

    assign HRDATA =     (sel_d[0])  ?   S0_HRDATA :
                        (sel_d[1])  ?   S1_HRDATA :
                        (sel_d[2])  ?   S2_HRDATA :
                        (sel_d[3])  ?   S3_HRDATA :
                        (sel_d[4])  ?   S4_HRDATA :
                        (sel_d[5])  ?   S5_HRDATA :
                        (sel_d[6])  ?   S6_HRDATA :
                        32'hBADDBEEF;

endmodule