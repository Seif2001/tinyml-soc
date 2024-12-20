/*
	Copyright 2020 Mohamed Shalan

	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none

module dmac_master (
    input   wire        HCLK,
    input   wire        HRESETn,
    output  wire [31:0] HADDR,
    output  wire [1:0]  HTRANS,
    output  wire [2:0] 	HSIZE,
    output  wire        HWRITE,
    output  wire [31:0] HWDATA,
    input   wire        HREADY,
    input   wire [31:0] HRDATA,

    input   wire [31:0] saddr,
    input   wire [31:0] daddr,
    input   wire [2:0]  ssize,
    input   wire [2:0]  dsize,
    input   wire [2:0]  sinc,
    input   wire [2:0]  dinc,
    input   wire [15:0] bsize,
    input   wire [7:0]  bcount,
    input   wire        start,
    input   wire        wfi,
    input   wire [2:0]  irqsrc,
    input   wire [7:0]  pirq,
    
    input   wire [31:0] icra,
    input   wire [31:0] icrv,

    output  wire        done,
    output  wire        busy
);

    // The microprogram
    //  WFS
    //  LI   CR, bcount
    // L0:
    //  LI   CB, bsize
    // L1:
    //  WFI  irqsrc
    //  LD   D, saddr+
    //  ST   daddr+, D
    //  DJNZ CB, L1
    //  DJNZ CR, L0

    localparam  WFS = 0, 
                LCR = 1,
                LCB = 2,
                WFI = 3,
                LDD0 = 4,
                LDD1 = 5,
                STD0 = 6,
                STD1 = 7,
                JCB = 8,
                JCR = 9,
                DONE = 10,
                ICR0 = 11,
                ICR1 = 12;

    reg [7:0]   CR;
    reg [15:0]  CB;
    reg [31:0]  D;
    reg [31:0]  SA, DA;

    wire    got_irq = ~wfi | pirq[irqsrc];
    wire    CB_zero = (CB == 0);
    wire    CR_zero = (CR == 0);
    
    reg [3:0]   state, nstate;

    always @* begin
        nstate = state;
        case (state)
            WFS :   if(start) nstate = LCR;
                    else nstate = WFS;
            LCR :   nstate = LCB;
            LCB :   nstate = WFI;
            WFI :   if(got_irq) nstate = LDD0;
                    else nstate = WFI;
            LDD0:   nstate = LDD1;
            LDD1:   if(HREADY) nstate = STD0; else nstate = LDD1;
            STD0:   nstate = STD1; 
            STD1:   if(HREADY) nstate = JCB;
            JCB :   if(CB_zero) begin
                        if(wfi) nstate = ICR0;
                        else nstate = JCR;
                    end else nstate = WFI;
            ICR0:   nstate = ICR1;   
            ICR1:   if(HREADY) nstate = JCR; else nstate = ICR1;
            JCR :   if(CR_zero) nstate = DONE;
                    else nstate = LCB;
            DONE:   nstate = WFS;
            default:
                    nstate = state;
        endcase
    end

    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            state <= WFS;
        else
            state <= nstate;
    
    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            DA <= 'b0;
        else if(state == WFS)
            DA <= daddr;
        else if(HREADY)
                if(state == STD1)
                    DA <= DA + dinc;

    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            SA <= 'b0;
        else if(state == WFS)
            SA <= saddr;
        else if(HREADY)
                if(state == LDD1)
                    SA <= SA + sinc;

    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            CB <= 'b0;
        else if(state == LCB)
            CB <= bsize;
        else if(state == JCB)
            CB <= CB - 1'b1;
    
    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            CR <= 'b0;
        else if(state == LCR)
            CR <= bcount;
        else if(nstate == JCR)
            CR <= CR - 1'b1;

    //
            // Data Alignment
    wire [31:0] ARD =   (ssize == 2)                        ? HRDATA                            :
                        (ssize == 1) && (SA[1] == 1)        ? {HRDATA[31:16], HRDATA[31:16]}    :
                        (ssize == 1) && (SA[1] == 0)        ? {HRDATA[15:0 ], HRDATA[15:0 ]}    :
                        (ssize == 0) && (SA[1:0] == 2'b00)  ? {4{HRDATA[7:0]}}                  :
                        (ssize == 0) && (SA[1:0] == 2'b01)  ? {4{HRDATA[15:8]}}                 :
                        (ssize == 0) && (SA[1:0] == 2'b10)  ? {4{HRDATA[23:16]}}                : {4{HRDATA[31:24]}} ;

    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            D <= 'b0;
        else if((state == LDD1) & HREADY)
            D <= ARD;

    reg [1:0]   h_trans;

    always@(posedge HCLK, negedge HRESETn)
        if(!HRESETn)
            h_trans <= 'b00;
        else if((nstate == LDD0) || (nstate == STD0 || (nstate == ICR0)))// || (nstate == LDD1) || (nstate == STD1))
            h_trans <= 'b10;
        else
            h_trans <= 'b00;
    
    assign  done    =   (nstate == DONE);

    assign  HADDR   =   (state == LDD0) ? SA : 
                        (state == STD0) ? DA :
                        icra;
    assign  HTRANS  =   h_trans;
    assign  HWDATA  =   (state == ICR1) ? icrv : D;
    assign  HSIZE   =   (state == LDD0) ? ssize : 
                        (state == STD0) ? dsize :
                        3'b010;
    assign  HWRITE  =   (state == STD0) || (state == ICR0);

    assign  busy    =   (state != WFS) & (state != DONE);

                
endmodule