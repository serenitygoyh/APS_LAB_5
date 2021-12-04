`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 19:17:28
// Design Name: 
// Module Name: im
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


module im(
            input        clk,
            input  [31:0] adr,
            input  [31:0] wd,
            input         we,
            output [31:0] rd
         );
         
         reg [31:0] RAM [0:63];
         
         initial begin $readmemb("C:/Users/danil/Desktop/5_sem/APS/APS_5/APS_5.srcs/sources_1/new/sort.txt", RAM);
         end
         
         assign rd = RAM[adr[9:2]];
         
         always@(posedge clk)
         begin
            if (we)
                RAM[adr[9:2]] <= wd;
         end       
            
endmodule
