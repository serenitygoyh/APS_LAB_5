`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2021 20:26:49
// Design Name: 
// Module Name: ALU_RISC_V
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

      `define ADD 5'b00000
      `define SUB 5'b01000
      `define LFT 5'b00001
      `define LES 5'b00010
     `define ULES 5'b00011
      `define XOR 5'b00100
      `define RHT 5'b00101
     `define ARHT 5'b01101
       `define OR 5'b00110
      `define AND 5'b00111
    `define EQL_F 5'b11000
   `define NEQL_F 5'b11001
    `define LES_F 5'b11100
 `define MOREQL_F 5'b11101
   `define ULES_F 5'b11110
`define UMOREQL_F 5'b11111

module ALU_RISC_V(
                    input [4:0] ALUOp,
                    input [31:0] A,
                    input [31:0] B,
                    output reg [31:0] result,
                    output reg Flag
    );
    
    always@(*)
    begin
        case(ALUOp)
        `ADD: begin
            result = A + B;
            Flag = 0;
            end         
        `SUB: begin
            result = A - B;
            Flag = 0;
            end   
        `LFT: begin
            result = A << B[4:0];
            Flag = 0;
            end
        `LES: begin
            result = ($signed(A) < $signed(B)) ? 1 : 0;
            Flag = 0;
            end
        `ULES: begin
            result = ($unsigned(A) < $unsigned(B)) ? 1 : 0;
            Flag = 0;
            end
        `XOR: begin
            result = A ^ B;
            Flag = 0;
            end
        `RHT: begin
            result = A >> B[4:0];
            Flag = 0;
            end
        `ARHT: begin
            result = A >>> B[4:0];
            Flag = 0;
            end
        `OR: begin
            result = A | B;
            Flag = 0;
            end
        `AND: begin
            result = A & B;
            Flag = 0;
            end
        `EQL_F: begin
            result = (A == B) ? 1 : 0;
            Flag = (A == B);
            end
        `NEQL_F: begin
            result = (~(A == B)) ? 1 : 0;
            Flag = (~(A == B));
            end
        `LES_F: begin
            result = ($signed(A) < $signed(B)) ? 1 : 0;
            Flag = ($signed(A) < $signed(B));
            end
        `MOREQL_F: begin
            result = ($signed(A) >= $signed(B)) ? 1 : 0;
            Flag = ($signed(A) >= $signed(B));
            end
        `ULES_F: begin
            result = ($unsigned(A) < $unsigned(B)) ? 1 : 0;
            Flag = ($unsigned(A) < $unsigned(B));
            end
        `UMOREQL_F: begin
            result = ($unsigned(A) >= $unsigned(B)) ? 1 : 0;
            Flag = ($unsigned(A) >= $unsigned(B));
            end            
        endcase
    end
    
    
endmodule
