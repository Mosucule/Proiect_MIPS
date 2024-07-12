`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 12:34:47
// Design Name: 
// Module Name: ExtSign
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


module ExtSign(din, extop, dout);
    input [15:0] din;
    input extop;
    output [31:0] dout;
    
    assign dout = (extop)? {{16{din[15]}} ,din}:{16'b0 , din};
endmodule
