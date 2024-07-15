`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 11:37:30
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    reg clk, reset;
    
    top top_tb(.clk(clk), .reset(reset));
    
    initial begin
        clk = 0;
        forever #5 clk =~ clk;
    end
    
    initial begin
        #0 reset = 1;
        #10 reset = 0;
        #1000 $finish;
    end
endmodule
