`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:59:29
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(clk, ADDR, WD, MemWrite, RD, din, dout);
    input clk, MemWrite;
    input [31:0] ADDR, WD;
    input [15:0] din;
    output [31:0] dout;
    output reg [31:0] RD;
    
    reg [7:0] MEM [32'hFFFF:0];
    
    integer i;
    initial begin
        for(i = 0; i <= 32'hFFFF; i = i + 1)begin
            MEM[i] = 32'b0;
        end
    end

    
    always@(posedge clk)begin
        if(MemWrite)begin
            {MEM[ADDR], MEM[ADDR + 1], MEM[ADDR + 2], MEM[ADDR + 3]} <= WD;
        end
    end
    always@(negedge clk)begin
        RD = {MEM[ADDR], MEM[ADDR + 1], MEM[ADDR + 2], MEM[ADDR + 3]};
    end
    
    always@(din)begin
        {MEM[32'hFFFE], MEM[32'hFFFF]} = din;
    end
    
    assign dout = {MEM[32'hFFF8], MEM[32'hFFF9], MEM[32'hFFFA], MEM[32'hFFFB]};
endmodule
