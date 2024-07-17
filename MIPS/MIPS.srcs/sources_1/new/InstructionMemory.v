`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:56:12
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(ADDR, instr);
    parameter num_lines = 32'hFFFF;
    input [31:0] ADDR;
    output [31:0] instr;
    
    reg [7:0] MEM [num_lines-1:0];
    
    initial begin
        $readmemb("instr.mem", MEM);
    end
    
    assign instr = {MEM[ADDR], MEM[ADDR + 1], MEM[ADDR + 2], MEM[ADDR + 3]};
endmodule
