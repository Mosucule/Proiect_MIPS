`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 13:23:11
// Design Name: 
// Module Name: mux2_p
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


module mux2_p(I0, I1, sel, OUT);
    parameter width = 32;
    
    input [width-1:0] I0, I1;
    input sel;
    output [width-1:0] OUT;
    
    assign OUT = (sel)?I1:I0;
endmodule
