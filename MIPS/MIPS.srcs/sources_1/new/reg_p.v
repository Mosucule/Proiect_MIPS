`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:51:40
// Design Name: 
// Module Name: reg_p
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


module reg_p(clk, din, dout);
    input clk;
    input [31:0] din;
    output reg [31:0] dout = 0;
    
    always@(posedge clk)begin
        dout = din;
    end
    
endmodule
