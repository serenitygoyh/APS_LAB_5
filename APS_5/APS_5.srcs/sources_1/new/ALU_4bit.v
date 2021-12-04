`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 20:50:22
// Design Name: 
// Module Name: ALU_4bit
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


      `define ADD 4'd0
      `define SUB 4'd1
      `define LFT 4'd2
      `define LES 4'd3
     `define ULES 4'd4
      `define XOR 4'd5
      `define RHT 4'd6
     `define ARHT 4'd7
       `define OR 4'd8
      `define AND 4'd9
    `define EQL_F 4'd10
   `define NEQL_F 4'd11
    `define LES_F 4'd12
 `define MOREQL_F 4'd13
   `define ULES_F 4'd14
`define UMOREQL_F 4'd15

module ALU_4bit(
                    input [3:0] ALUOp,
                    input [31:0] A,
                    input [31:0] B,
                    output reg [31:0] result,
                    output reg Flag
    );
    
    always@(*)
    begin
        case(ALUOp)
        `ADD: begin
            result <= A + B;
            Flag <= 0;
            end         
        `SUB: begin
            result <= A - B;
            Flag <= 0;
            end   
        `LFT: begin
            result <= A << B[4:0];
            Flag <= 0;
            end
        `LES: begin
            result <= ($signed(A) < $signed(B)) ? 1 : 0;
            Flag <= 0;
            end
        `ULES: begin
            result <= ($unsigned(A) < $unsigned(B)) ? 1 : 0;
            Flag <= 0;
            end
        `XOR: begin
            result <= A ^ B;
            Flag <= 0;
            end
        `RHT: begin
            result <= A >> B[4:0];
            Flag <= 0;
            end
        `ARHT: begin
            result <= A >>> B[4:0];
            Flag <= 0;
            end
        `OR: begin
            result <= A | B;
            Flag <= 0;
            end
        `AND: begin
            result <= A & B;
            Flag <= 0;
            end
        `EQL_F: begin
            result <= (A == B) ? 1 : 0;
            Flag <= (A == B);
            end
        `NEQL_F: begin
            result <= (~(A == B)) ? 1 : 0;
            Flag <= (~(A == B));
            end
        `LES_F: begin
            result <= ($signed(A) < $signed(B)) ? 1 : 0;
            Flag <= ($signed(A) < $signed(B));
            end
        `MOREQL_F: begin
            result <= ($signed(A) >= $signed(B)) ? 1 : 0;
            Flag <= ($signed(A) >= $signed(B));
            end
        `ULES_F: begin
            result <= ($unsigned(A) < $unsigned(B)) ? 1 : 0;
            Flag <= ($unsigned(A) < $unsigned(B));
            end
        `UMOREQL_F: begin
            result <= ($unsigned(A) >= $unsigned(B)) ? 1 : 0;
            Flag <= ($unsigned(A) >= $unsigned(B));
            end            
        endcase
    end
    
    
endmodule