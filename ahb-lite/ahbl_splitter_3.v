module ahbl_splitter_3 #(parameter  S0=4'b0000, 
                                    S1=4'b0010, 
                                    P0=4'b0100
                                    ) 
(
    input   wire        HCLK,
    input   wire        HRESETn,

    // BUS
    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    output  wire        HREADY,
    output  wire [31:0] HRDATA,

    // Peripheral 2
    output  wire        P0_HSEL,
    input   wire [31:0] P0_HRDATA,
    input   wire        P0_HREADYOUT,

    // SLAVE 0
    output  wire        S0_HSEL,
    input   wire [31:0] S0_HRDATA,
    input   wire        S0_HREADYOUT,

    // SLAVE 1
    output  wire        S1_HSEL,
    input   wire [31:0] S1_HRDATA,
    input   wire        S1_HREADYOUT

    
);

    // The Decoder
    reg [2:0] sel;
    reg [2:0] sel_d;
    always @*
        case(HADDR[31:28])
            S0: sel = 3'b001;
            S1: sel = 3'b010;
            P0: sel = 3'b100;
            default: sel = 3'b000;
        endcase
    assign S0_HSEL = sel[0];
    assign S1_HSEL = sel[1];
    assign P0_HSEL = sel[2];

    // The MUX
    always@(posedge HCLK or negedge HRESETn) begin
        if(~HRESETn) begin
            sel_d <= 4'b0000;
        end else if(HTRANS[1] & HREADY) begin
            sel_d <= sel;
        end
    end

    assign HREADY =   (sel_d[0])  ?   S0_HREADYOUT :
                        (sel_d[1])  ?   S1_HREADYOUT :
                        (sel_d[2])  ?   P0_HREADYOUT :
                        1'b1;

    assign HRDATA =   (sel_d[0])  ?   S0_HRDATA :
                        (sel_d[1])  ?   S1_HRDATA :
                        (sel_d[2])  ?   P0_HRDATA :
                        32'hBADDBEEF;

endmodule