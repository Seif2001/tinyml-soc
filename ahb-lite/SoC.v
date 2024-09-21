module SoC (
    input wire HCLK,
    input wire HRESETn,
    output wire [31:0] register_0,
    output wire [31:0] register_1,
    output wire [31:0] register_2
);

    wire [31:0] HADDR;
    wire [1:0]  HTRANS;
    wire [2:0] 	HSIZE;
    wire        HWRITE;
    wire [31:0] HWDATA;
    wire        HREADY;
    wire [31:0] HRDATA;

    wire [31:0] P0_HRDATA, S0_HRDATA, S1_HRDATA;
    wire        P0_HSEL, S0_HSEL, S1_HSEL;
    wire        P0_HREADYOUT, S0_HREADYOUT, S1_HREADYOUT;

    ahbl_master M (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HWDATA(HWDATA),
        .HREADY(HREADY),
        .HRDATA(HRDATA)
    );

    ahbl_peripheral #(.ID(32'hABCD_EF00)) P0 (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(P0_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(P0_HREADYOUT),
        .HRDATA(P0_HRDATA),
        .register_0(register_0),
        .register_1(register_1),
        .register_2(register_2)
    );


    ahbl_slave #(.ID(32'hABCD_EF01)) S0 (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S0_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S0_HREADYOUT),
        .HRDATA(S0_HRDATA)
    );

    ahbl_slave #(.ID(32'hABCD_EF02)) S1 (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HSEL(S1_HSEL),
        .HWDATA(HWDATA),
        .HREADYOUT(S1_HREADYOUT),
        .HRDATA(S1_HRDATA)
    );

    ahbl_splitter_3 S (
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HREADY(HREADY),
        .HRDATA(HRDATA),

        .S0_HSEL(S0_HSEL),
        .S0_HRDATA(S0_HRDATA),
        .S0_HREADYOUT(S0_HREADYOUT),

        .S1_HSEL(S1_HSEL),
        .S1_HRDATA(S1_HRDATA),
        .S1_HREADYOUT(S1_HREADYOUT),

        .P0_HSEL(P0_HSEL),
        .P0_HRDATA(P0_HRDATA),
        .P0_HREADYOUT(P0_HREADYOUT)

    );
endmodule
