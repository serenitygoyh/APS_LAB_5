`timescale 1ns / 1ps

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

module tb_ALU();

reg [4:0] ALUOp;
reg [31:0] A;
reg [31:0] B;
wire [31:0] result;
wire Flag;

ALU_RISC_V obj (ALUOp, A, B, result, Flag);

task go_add;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `ADD; A = A_op ; B = B_op ; #10;
    if ((result == (A_op+B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("it's not ok", $realtime);
    end
end
endtask

task go_sub;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `SUB; A = A_op ; B = B_op ; #10;
    if ((result == (A_op-B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_lft;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `LFT; A = A_op ; B = B_op ; #10;
    if ((result == (A_op<<B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_les;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `LES; A = A_op ; B = B_op ; #10;
    if ((result == ($signed(A_op)<$signed(B_op))) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_ules;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `ULES; A = A_op ; B = B_op ; #10;
    if ((result == ($unsigned(A_op)<$unsigned(B_op))) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_xor;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `XOR; A = A_op ; B = B_op ; #10;
    if ((result == (A_op^B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_rht;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `RHT; A = A_op ; B = B_op ; #10;
    if ((result == (A_op>>B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_arht;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `ARHT; A = A_op ; B = B_op ; #10;
    if ((result == (A_op>>>B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_or;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `OR; A = A_op ; B = B_op ; #10;
    if ((result == (A_op|B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_and;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `AND; A = A_op ; B = B_op ; #10;
    if ((result == (A_op&B_op)) & (Flag == 0)) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_eql_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `EQL_F ; A = A_op ; B = B_op ; #10;
    if ((result == (A_op==B_op)) & (Flag == (A == B))) begin
    $display("OK result");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_neql_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `NEQL_F ; A = A_op ; B = B_op ; #10;
    if ((result == (A_op!=B_op)) & (Flag == (A != B))) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_les_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `LES_F; A = A_op ; B = B_op ; #10;
    if ((result == ($signed(A_op)<$signed(B_op))) & (Flag == ($signed(A) < $signed(B)))) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_moreql_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `MOREQL_F; A = A_op ; B = B_op ; #10;
    if ((result == ($signed(A) >= $signed(B))) & (Flag == ($signed(A) >= $signed(B)))) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_ules_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `ULES_F; A = A_op ; B = B_op ; #10;
    if ((result == ($unsigned(A_op)<$unsigned(B_op))) & (Flag == ($unsigned(A) < $unsigned(B)))) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

task go_umoreql_f;
 input [31:0] A_op;
 input [31:0] B_op;
begin
    ALUOp = `UMOREQL_F; A = A_op ; B = B_op ; #10;
    if ((result == ($unsigned(A) >= $unsigned(B))) & (Flag == ($unsigned(A) >= $unsigned(B)))) begin
    $display("OK");
    end
    else begin
    $error("ERROR", $realtime);
    end
end
endtask

initial begin
//1. Сложение 
    go_add( 32'd100, 32'd10);
    go_add( 32'd1600, 32'd9);
    go_add( 32'd10, 32'd8);
    go_add( 32'd1040, 32'd7);
    go_add( 32'd518008, 32'd6);
    go_add( 32'd20, 32'd45);
    go_add( 32'd130, 32'd1430);
    go_add( 32'd134, 32'd140);
    
    go_sub( 32'd100, 32'd10);
    go_sub( 32'd1600, 32'd9);
    go_sub( 32'd10, 32'd8);
    go_sub( 32'd1040, 32'd7);
    go_sub( 32'd518008, 32'd6);
    go_sub( 32'd20, 32'd45);
    go_sub( 32'd130, 32'd1430);
    go_sub( 32'd134, 32'd140);
    
    go_lft( 32'd100, 32'd10);
    go_lft( 32'd1600, 32'd9);
    go_lft( 32'd10, 32'd8);
    go_lft( 32'd1040, 32'd7);
    go_lft( 32'd518008, 32'd6);
    go_lft( 32'd20, 32'd45);
    go_lft( 32'd130, 32'd1430);
    go_lft( 32'd134, 32'd140);
    
    go_les( 32'd100, 32'd10);
    go_les( 32'd1600, 32'd9);
    go_les( 32'd10, 32'd8);
    go_les( 32'd1040, 32'd7);
    go_les( 32'd518008, 32'd6);
    go_les( 32'd20, 32'd45);
    go_les( 32'd130, 32'd1430);
    go_les( 32'd134, 32'd140);  
    
    go_ules( 32'd100, 32'd10);
    go_ules( 32'd1600, 32'd9);
    go_ules( 32'd10, 32'd8);
    go_ules( 32'd1040, 32'd7);
    go_ules( 32'd518008, 32'd6);
    go_ules( 32'd20, 32'd45);
    go_ules( 32'd130, 32'd1430);
    go_ules( 32'd134, 32'd140);
    
    go_xor( 32'd100, 32'd10);
    go_xor( 32'd1600, 32'd9);
    go_xor( 32'd10, 32'd8);
    go_xor( 32'd1040, 32'd7);
    go_xor( 32'd518008, 32'd6);
    go_xor( 32'd20, 32'd45);
    go_xor( 32'd130, 32'd1430);
    go_xor( 32'd134, 32'd140);
    
    go_rht( 32'd100, 32'd10);
    go_rht( 32'd1600, 32'd9);
    go_rht( 32'd10, 32'd8);
    go_rht( 32'd1040, 32'd7);
    go_rht( 32'd518008, 32'd6);
    go_rht( 32'd20, 32'd45);
    go_rht( 32'd130, 32'd1430);
    go_rht( 32'd134, 32'd140);
    
    go_arht( 32'd100, 32'd10);
    go_arht( 32'd1600, 32'd9);
    go_arht( 32'd10, 32'd8);
    go_arht( 32'd1040, 32'd7);
    go_arht( 32'd518008, 32'd6);
    go_arht( 32'd20, 32'd45);
    go_arht( 32'd130, 32'd1430);
    go_arht( 32'd134, 32'd140);
        
    go_or( 32'd100, 32'd10);
    go_or( 32'd1600, 32'd9);
    go_or( 32'd10, 32'd8);
    go_or( 32'd1040, 32'd7);
    go_or( 32'd518008, 32'd6);
    go_or( 32'd20, 32'd45);
    go_or( 32'd130, 32'd1430);
    go_or( 32'd134, 32'd140);
    
    go_and( 32'd100, 32'd10);
    go_and( 32'd1600, 32'd9);
    go_and( 32'd10, 32'd8);
    go_and( 32'd1040, 32'd7);
    go_and( 32'd518008, 32'd6);
    go_and( 32'd20, 32'd45);
    go_and( 32'd130, 32'd1430);
    go_and( 32'd134, 32'd140); 
    
    go_eql_f( 32'd100, 32'd100);
    go_eql_f( 32'd1600, 32'd9);
    go_eql_f( 32'd10, 32'd8);
    go_eql_f( 32'd1040, 32'd7);
    go_eql_f( 32'd518008, 32'd6);
    go_eql_f( 32'd45, 32'd45);
    go_eql_f( 32'd130, 32'd1430);
    go_eql_f( 32'd134, 32'd140);     
        
    go_neql_f( 32'd100, 32'd100);
    go_neql_f( 32'd1600, 32'd1600);
    go_neql_f( 32'd10, 32'd8);
    go_neql_f( 32'd1040, 32'd7);
    go_neql_f( 32'd518008, 32'd6);
    go_neql_f( 32'd20, 32'd45);
    go_neql_f( 32'd130, 32'd1430);
    go_neql_f( 32'd134, 32'd140); 
    
    go_les_f( 32'd100, 32'd10);
    go_les_f( 32'd1600, 32'd9);
    go_les_f( 32'd10, 32'd8);
    go_les_f( 32'd1040, 32'd7);
    go_les_f( 32'd518008, 32'd6);
    go_les_f( 32'd20, 32'd45);
    go_les_f( 32'd130, 32'd1430);
    go_les_f( 32'd134, 32'd140); 
    
    go_moreql_f( 32'd100, 32'd10);
    go_moreql_f( 32'd1600, 32'd9);
    go_moreql_f( 32'd10, 32'd8);
    go_moreql_f( 32'd1040, 32'd7);
    go_moreql_f( 32'd518008, 32'd6);
    go_moreql_f( 32'd20, 32'd45);
    go_moreql_f( 32'd130, 32'd1430);
    go_moreql_f( 32'd134, 32'd140);
    
    go_ules_f( 32'd100, 32'd10);
    go_ules_f( 32'd1600, 32'd9);
    go_ules_f( 32'd10, 32'd8);
    go_ules_f( 32'd1040, 32'd7);
    go_ules_f( 32'd518008, 32'd6);
    go_ules_f( 32'd20, 32'd45);
    go_ules_f( 32'd130, 32'd1430);
    go_ules_f( 32'd134, 32'd140); 
    
    go_umoreql_f( 32'd100, 32'd10);
    go_umoreql_f( 32'd1600, 32'd9);
    go_umoreql_f( 32'd10, 32'd8);
    go_umoreql_f( 32'd1040, 32'd7);
    go_umoreql_f( 32'd518008, 32'd6);
    go_umoreql_f( 32'd20, 32'd45);
    go_umoreql_f( 32'd130, 32'd1430);
    go_umoreql_f( 32'd134, 32'd140);
 
 end
 endmodule
