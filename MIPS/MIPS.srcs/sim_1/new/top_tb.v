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
    reg clk, clk_p;
    wire A1, A2, A3, A4, a, b, c, d, e, f, g;
    reg [14:0] din;
    wire [15:0] dout;
    top top_tb(.clk(clk), .clk_p(clk_p), .din(din), .dout(dout), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
    
    initial begin
        clk = 0;
        forever #5 clk =~ clk;
    end
    
    initial begin
        #0 din = 14'b0; clk_p = 0;
        #240 $finish;
    end
endmodule
