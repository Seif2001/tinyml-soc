module ahbl_slave #(parameter ID = 32'hABCD_EF00) (
    input   wire        HCLK,
    input   wire        HRESETn,

    input   wire [31:0] HADDR,
    input   wire [1:0]  HTRANS,
    input   wire     	HREADY,
    input   wire [2:0]  HSIZE,
    input   wire        HWRITE,
    input   wire        HSEL,
    input   wire [31:0] HWDATA,
    output  wire        HREADYOUT,
    output  reg [31:0] HRDATA
    
);
    reg [31:0] HADDR_d;
    reg [1:0]  HTRANS_d;
    reg [2:0]  HSIZE_d;
    reg        HWRITE_d;
    reg        HSEL_d;
    reg [31:0]  memory [2047:0];
    always @(posedge HCLK or negedge HRESETn) begin
        if(HRESETn == 1'b0) begin
            HADDR_d     <= 0;
            HTRANS_d    <= 0;
            HSIZE_d     <= 0;
            HWRITE_d    <= 0;
            HSEL_d      <= 0;
        end else if(HREADY == 1'b1) begin
            HADDR_d     <= HADDR;
            HTRANS_d    <= HTRANS;
            HSIZE_d     <= HSIZE;
            HWRITE_d    <= HWRITE;
            HSEL_d      <= HSEL;
        end 
    end

    wire ahbl_we = HTRANS_d[1] & HSEL_d;


    always @(posedge HCLK) begin
        if(HRESETn & ahbl_we)
            if(HWRITE_d) begin
                case(HSIZE_d) 
                    3'b000: begin
                        memory[HADDR_d[27:14]] <= HWDATA[7:0];
                    end
                    3'b001: begin
                        memory[HADDR_d[27:14]] <= HWDATA[7:0];
                        memory[HADDR_d[27:14]+1] <= HWDATA[15:8];
                    end
                    3'b010: begin
                        memory[HADDR_d[27:14]] <= HWDATA[7:0];
                        memory[HADDR_d[27:14]+1] <= HWDATA[15:8];
                        memory[HADDR_d[27:14]+2] <= HWDATA[23:16];
                        memory[HADDR_d[27:14]+3] <= HWDATA[31:24];
                    end

                endcase
                $display("Slave %h: WRITE 0x%8x to 0x%13b", ID, HWDATA, HADDR_d[27:14]);
            end else begin
                case(HSIZE_d) 
                    3'b000: HRDATA <= memory[HADDR_d[27:14]];
                    3'b001: HRDATA <= {memory[HADDR_d[27:14]], (memory[HADDR_d[27:14]+1])};
                    3'b010: HRDATA <= {memory[HADDR_d[27:14]], (memory[HADDR_d[27:14]+1]), (memory[HADDR_d[27:14]+2]), (memory[HADDR_d[27:14]+3])};
                endcase 
                $display("Slave %h: READ 0x%8x from 0x%13b", ID, HRDATA, HADDR_d[27:14]);
            end
    end
    assign HREADYOUT = 1;
endmodule
