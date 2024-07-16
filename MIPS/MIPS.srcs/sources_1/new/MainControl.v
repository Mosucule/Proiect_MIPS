`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 13:27:19
// Design Name: 
// Module Name: MainControl
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


module MainControl(opcode, func, zero, RegDst, RegWrite, ExtOp, AluSrc, AluOp, MemWrite, Mem2Reg, SH);
    input [5:0] opcode, func;
    input zero;
    output reg RegDst, RegWrite, ExtOp, AluSrc, MemWrite, Mem2Reg, SH;
    output reg [3:0] AluOp;
    
    always@(opcode or func or zero)begin
        if(opcode == 6'b0)begin
            case(func)
                6'h20: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b0010;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h22: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b0110;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h24: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b0000;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h25: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b0001;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h2a: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b0111;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h27: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b1100;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h00: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b1000;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 1;
                end
                6'h02: begin
                    RegDst = 1;
                    RegWrite = 1;
                    ExtOp = 0;
                    AluSrc = 0;
                    AluOp = 4'b1001;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 1;
                end
            endcase
        end
        else begin
            case(opcode)
                6'h8: begin
                    RegDst = 0;
                    RegWrite = 1;
                    ExtOp = 1;
                    AluSrc = 1;
                    AluOp = 4'b0010;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'hc: begin
                    RegDst = 0;
                    RegWrite = 1;
                    ExtOp = 1;
                    AluSrc = 1;
                    AluOp = 4'b0000;
                    MemWrite = 0;
                    Mem2Reg = 1;
                    SH = 0;
                end
                6'h23: begin
                    RegDst = 0;
                    RegWrite = 1;
                    ExtOp = 1;
                    AluSrc = 1;
                    AluOp = 4'b0010;
                    MemWrite = 0;
                    Mem2Reg = 0;
                    SH = 0;
                end
            endcase
        end
    end
    
endmodule
