`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:21:33
// Design Name: 
// Module Name: RegisterBank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegisterBank(clk, RA1, RA2, WA, WD, regWrite, RD1, RD2);
    input clk, regWrite;
    input [4:0] RA1, RA2, WA;
    input [31:0] WD;
    output reg [31:0] RD1, RD2;
    
    reg [31:0] REG [31:0];
    
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)begin
            REG[i] = 32'b0;
        end
    end
    
    always@(posedge clk)begin
        RD1 = REG[RA1];
        RD2 = REG[RA2];
        if(regWrite)begin
            REG[WA] = WD;
        end
    end
    
endmodule
