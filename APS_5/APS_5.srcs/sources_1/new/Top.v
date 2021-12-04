`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2021 18:59:57
// Design Name: 
// Module Name: Top
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


module Top(
            input [9:0] SW,
            input CLK100MHZ,
            output [6:0] HEX
    );

    reg digit;
    assign HEX = digit;
    
    always@(posedge CLK100MHZ)
    begin
    case(SW[3:0]) 
    4'b0000: digit = 7'b1110111;
    4'b0001: digit = 7'b0010010;
    4'b0010: digit = 7'b1011101;
    4'b0011: digit = 7'b1011011;
    4'b0100: digit = 7'b0111010;
    4'b0101: digit = 7'b1101011;
    4'b0110: digit = 7'b1101111;
    4'b0111: digit = 7'b1010010;
    4'b1000: digit = 7'b1111111;
    4'b1001: digit = 7'b1111011;
    endcase
    end
    
endmodule
