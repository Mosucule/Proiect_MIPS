`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:45:52
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, ALUOP, ZERO, DOUT);
    input [31:0] A, B;
    input [3:0] ALUOP;
    output reg [31:0] DOUT;
    output ZERO;
    
    always@(A or B or ALUOP)begin
        case(ALUOP)
            4'b0000: begin
                DOUT = A & B;
            end
            4'b0001: begin
                DOUT = A | B;
            end
            4'b0010: begin
                DOUT = A + B;
            end
            4'b0110: begin
                DOUT = A - B;
            end
            4'b0111: begin
                DOUT = (A < B);
            end
            4'b1100: begin
                DOUT = ~(A | B);
            end
            4'b1000: begin
                DOUT = A<<B;
            end
            4'b1001: begin
                DOUT = A>>B;
            end
         endcase
    end
    
    assign ZERO = (DOUT == 32'b0);
endmodule
