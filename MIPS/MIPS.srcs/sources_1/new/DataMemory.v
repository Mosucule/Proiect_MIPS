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


module DataMemory(clk, ADDR, WD, MemWrite, RD);
    parameter num_lines = 32'hFFFF;
    input clk, MemWrite;
    input [31:0] ADDR, WD;
    output reg [31:0] RD;
    
    reg [7:0] MEM [num_lines-1:0];
    
    integer i;
    initial begin
        for(i = 0; i < num_lines; i = i + 1)begin
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
endmodule
