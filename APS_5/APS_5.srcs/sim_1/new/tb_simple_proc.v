`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2021 20:10:30
// Design Name: 
// Module Name: tb_simple_proc
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


module tb_simple_proc();

reg clk;
//reg [15:0] SW = 16'b0001100110010001;
reg [15:0] SW = 16'b00000011_00000011;
reg rst;

simple_proc dut (clk, SW, rst);

initial
begin
rst = 1;
clk = 0;
#15
rst = 0;
end

always #10 clk = !clk;

endmodule
