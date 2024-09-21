module ahbl_peripheral #(parameter ID = 32'hABCD_EF00) (
    input   wire        HCLK,
    input   wire        HRESETn,

    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    input   wire     	HREADY,
    input   wire        HWRITE,
    input   wire        HSEL,
    input   wire [31:0] HWDATA,
    output  reg        HREADYOUT,
    output  reg [31:0] HRDATA,
    output  wire [31:0] register_0,
    output  wire [31:0] register_1,
    output  wire [31:0] register_2
    
);
    reg [31:0] HADDR_d;
    reg [1:0]  HTRANS_d;
    reg        HWRITE_d;
    reg        HSEL_d;
    reg [31:0] registers_d [2:0];
    always @(posedge HCLK or negedge HRESETn) begin
        if(HRESETn == 1'b0) begin
            HADDR_d     <= 0;
            HTRANS_d    <= 0;
            HWRITE_d    <= 0;
            HSEL_d      <= 0;
        end else if(HREADY == 1'b1) begin
            HADDR_d     <= HADDR;
            HTRANS_d    <= HTRANS;
            HWRITE_d    <= HWRITE;
            HSEL_d      <= HSEL;
        end 
    end

    wire ahbl_we = HTRANS_d[1] & HSEL_d;
    always @(posedge HCLK) begin
        HREADYOUT <= 0;
        if(HRESETn & ahbl_we)
            if(HWRITE_d) begin
                $display("Peripheral %h: WRITE 0x%8x to 0x%32b to register 0b%2b", ID, HWDATA, HADDR_d, HADDR_d[25:24]);
                registers_d[HADDR_d[25:24]] <= HWDATA;
                HREADYOUT <= 1;
            end else begin
                $display("Peripheral %h: READ 0x%8x from 0x%32b from register 0b%2b", ID, registers_d[HADDR_d[25:24]], HADDR_d, HADDR_d[25:24]);
                HRDATA <= registers_d[HADDR_d[25:24]];
                HREADYOUT <= 1;
            end

    end

    assign register_0 = registers_d[0];
    assign register_1 = registers_d[1];
    assign register_2 = registers_d[2];
endmodule
