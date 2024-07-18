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


module top(clk, clk_p, din, dout, A1, A2, A3, A4, a, b, c, d, e, f, g);
    input clk, clk_p;
    input [14:0] din;
    output [15:0] dout;
    output A1, A2, A3, A4, a, b, c, d, e, f, g;
    
    wire [31:0] pc_new, pc_out, alu_4, pc_br, pc_jmp, pc_imm, RegData, RegADDR;
    
    wire [31:0] instruction;
    
    wire [4:0] WA;
    
    wire RegDst, ExtOp, RegWrite, AluSrc, Zero, MemWrite, Mem2Reg, SH, BR, JMP, Reg2PC, PC2Reg;
    wire [3:0] AluOp;
    
    wire [31:0] WD;
    wire [31:0] RD1, RD2;
    wire [31:0] imm, immsrc;
    wire [31:0] AluD2, AluOut;
    
    wire [31:0] MemOut;
    wire [15:0] digit_in;
    
    //afisare digiti
    digit digit1(.clk(clk_p), .din(digit_in), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
    //-----
    
    reg_p PC(.clk(clk), .din(pc_new), .dout(pc_out));
    alu_sum sum_pc(.a(pc_out), .b(32'd4), .out(alu_4));
    
    alu_sum sum_br(.a(alu_4), .b({imm[29:0], 2'b00}), .out(pc_br));
    mux2_p mux_br(.I0(alu_4), .I1(pc_br), .sel(BR), .OUT(pc_imm));
    mux2_p mux_jmp(.I0(pc_imm), .I1({alu_4[31:28], instruction[25:0], 2'b00}), .sel(JMP), .OUT(pc_jmp));
    mux2_p mux_reg(.I0(pc_jmp), .I1(RD1), .sel(Reg2PC), .OUT(pc_new));
    
    mux2_p mux_WA(.I0(WA), .I1(32'h1f), .sel(PC2Reg), .OUT(RegADDR));
    mux2_p reg_pc(.I0(WD), .I1(alu_4), .sel(PC2Reg), .OUT(RegData));
    
    InstructionMemory instr_mem(.ADDR(pc_out), .instr(instruction));
    
    mux2_p #(5) wa_mux(.I0(instruction[20:16]), .I1(instruction[15:11]), .sel(RegDst), .OUT(WA));
    
    RegisterBank registers(.clk(clk), .RA1(instruction[25:21]), .RA2(instruction[20:16]), .WA(RegADDR), .WD(RegData), .regWrite(RegWrite), .RD1(RD1), .RD2(RD2));
    
    ExtSign ext_sign(.din(instruction[15:0]), .extop(ExtOp), .dout(imm));
    mux2_p sh_mux(.I1({27'b0, instruction[10:6]}), .I0(imm), .sel(SH), .OUT(immsrc));
    mux2_p alu_mux(.I0(RD2), .I1(immsrc), .sel(AluSrc), .OUT(AluD2));
    
    ALU ALU1(.A(RD1), .B(AluD2), .ALUOP(AluOp), .ZERO(Zero), .DOUT(AluOut));
    
    DataMemory RAM(.clk(clk), .ADDR(AluOut), .WD(RD2), .MemWrite(MemWrite), .RD(MemOut), .din({1'b0, din}), .dout({digit_in, dout}));
    
    mux2_p mem2reg(.I0(MemOut), .I1(AluOut), .sel(Mem2Reg), .OUT(WD));
    
    MainControl MainControl1(.opcode(instruction[31:26]), .func(instruction[5:0]), .zero(Zero), .RegDst(RegDst), .RegWrite(RegWrite), .ExtOp(ExtOp), .AluSrc(AluSrc), .AluOp(AluOp), .MemWrite(MemWrite), .Mem2Reg(Mem2Reg), .SH(SH), .BR(BR), .JMP(JMP), .Reg2PC(Reg2PC), .PC2Reg(PC2Reg));
endmodule
