`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2021 15:55:16
// Design Name: 
// Module Name: data_memory
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
`include "C:/Users/danil/Desktop/5_sem/APS/APS_5/APS_5.srcs/sources_1/new/miriscv_defines.v"

module data_memory(
            input        clk,
            input  [31:0] adr,
            input        req,
            input  [31:0] wd,
            input         we,
            input  [2:0]  size,
            output [31:0] rd
         );
         
         reg [31:0] RAM [0:255];
         initial begin $readmemb("C:/Users/danil/Desktop/5_sem/APS/APS_5/APS_5.srcs/sources_1/new/sort_data.txt", RAM);
         end
         
         reg [32:0] rd_reg;
         assign rd = rd_reg;
         
         always@(posedge clk)
         begin
             if (req) begin
                 if (we) begin
                     case(size)
                        `LDST_B : RAM[adr][7:0] <= wd[7:0];
                        `LDST_H : RAM[adr][15:0] <= wd[15:0];
                        `LDST_W : RAM[adr][31:0] <= wd[31:0];
                     endcase
                 end
             end 
         end       
            
         always@(*)
         begin
             if (req) begin
                 if (!we) begin
                     case(size)
                         `LDST_B : rd_reg[7:0] <= $signed(RAM[adr][7:0]);
                         `LDST_H : rd_reg[15:0] <= $signed(RAM[adr][15:0]);
                         `LDST_W : rd_reg[31:0] <= $signed(RAM[adr][31:0]);
                         `LDST_BU : rd_reg[7:0] <= RAM[adr][7:0];
                         `LDST_HU : rd_reg[15:0] <= RAM[adr][15:0];
                     endcase
                 end
             end
         end
endmodule
