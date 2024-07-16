`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 11:08:31
// Design Name: 
// Module Name: top
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


module top(clk);
    input clk;
    
    wire [31:0] alu_pc, pc_out;
    
    wire [31:0] instruction;
    
    wire [4:0] WA;
    
    wire RegDst, ExtOp, RegWrite, AluSrc, Zero, MemWrite, Mem2Reg, SH;
    wire [3:0] AluOp;
    
    wire [31:0] WD;
    wire [31:0] RD1, RD2;
    wire [31:0] imm, immsrc;
    wire [31:0] AluD2, AluOut;
    
    wire [31:0] MemOut;
    
    reg_p PC(.clk(clk), .din(alu_pc), .dout(pc_out));
    alu_sum sum_pc(.a(pc_out), .b(32'd4), .out(alu_pc));
    
    InstructionMemory instr_mem(.ADDR(pc_out), .instr(instruction));
    
    mux2_p #(5) wa_mux(.I0(instruction[20:16]), .I1(instruction[15:11]), .sel(RegDst), .OUT(WA));
    
    RegisterBank registers(.clk(clk), .RA1(instruction[25:21]), .RA2(instruction[20:16]), .WA(WA), .WD(WD), .regWrite(RegWrite), .RD1(RD1), .RD2(RD2));
    
    ExtSign ext_sign(.din(instruction[15:0]), .extop(ExtOp), .dout(imm));
    mux2_p sh_mux(.I1({27'b0, instruction[10:6]}), .I0(imm), .sel(SH), .OUT(immsrc));
    mux2_p alu_mux(.I0(RD2), .I1(immsrc), .sel(AluSrc), .OUT(AluD2));
    
    ALU ALU1(.A(RD1), .B(AluD2), .ALUOP(AluOp), .ZERO(Zero), .DOUT(AluOut));
    
    DataMemory RAM(.clk(clk), .ADDR(AluOut), .WD(RD2), .MemWrite(MemWrite), .RD(MemOut));
    
    mux2_p mem2reg(.I0(MemOut), .I1(AluOut), .sel(Mem2Reg), .OUT(WD));
    
    MainControl MainControl1(.opcode(instruction[31:26]), .func(instruction[5:0]), .zero(Zero), .RegDst(RegDst), .RegWrite(RegWrite), .ExtOp(ExtOp), .AluSrc(AluSrc), .AluOp(AluOp), .MemWrite(MemWrite), .Mem2Reg(Mem2Reg), .SH(SH));
endmodule
