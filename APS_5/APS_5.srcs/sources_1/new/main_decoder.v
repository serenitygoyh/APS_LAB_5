`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2021 19:46:28
// Design Name: 
// Module Name: main_decoder
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

`define RESET_ADDR 32'h00000000

`define ALU_OP_WIDTH 5

`define ALU_ADD 5'b00000
`define ALU_SUB 5'b01000

`define ALU_XOR 5'b00100
`define ALU_OR  5'b00110
`define ALU_AND 5'b00111

// shifts
`define ALU_SRA 5'b01101
`define ALU_SRL 5'b00101
`define ALU_SLL 5'b00001

// comparisons
`define ALU_LTS 5'b11100
`define ALU_LTU 5'b11110
`define ALU_GES 5'b11101
`define ALU_GEU 5'b11111
`define ALU_EQ  5'b11000
`define ALU_NE  5'b11001

// set lower than operations
`define ALU_SLTS 5'b00010
`define ALU_SLTU 5'b00011

// opcodes
`define LOAD_OPCODE     5'b00_000
`define MISC_MEM_OPCODE 5'b00_011
`define OP_IMM_OPCODE   5'b00_100
`define AUIPC_OPCODE    5'b00_101
`define STORE_OPCODE    5'b01_000
`define OP_OPCODE       5'b01_100
`define LUI_OPCODE      5'b01_101
`define BRANCH_OPCODE   5'b11_000
`define JALR_OPCODE     5'b11_001
`define JAL_OPCODE      5'b11_011
`define SYSTEM_OPCODE   5'b11_100

// dmem type load store
`define LDST_B  3'b000
`define LDST_H  3'b001
`define LDST_W  3'b010
`define LDST_BU 3'b100
`define LDST_HU 3'b101

// operand a selection
`define OP_A_RS1     2'b00
`define OP_A_CURR_PC 2'b01
`define OP_A_ZERO    2'b10

// operand b selection
`define OP_B_RS2   3'b000
`define OP_B_IMM_I 3'b001
`define OP_B_IMM_U 3'b010
`define OP_B_IMM_S 3'b011
`define OP_B_INCR  3'b100

// writeback source selection
`define WB_EX_RESULT 1'b0
`define WB_LSU_DATA  1'b1



module main_decoder (   input   [31:0]               fetched_instr_i,
                        output  [1:0]                ex_op_a_sel_o,
                        output  [2:0]                ex_op_b_sel_o,
                        output  [`ALU_OP_WIDTH-1:0]  alu_op_o,
                        output                       mem_req_o,
                        output                       mem_we_o,
                        output  [2:0]                mem_size_o,
                        output                       gpr_we_a_o,
                        output                       wb_src_sel_o,
                        output                       illegal_instr_o,
                        output                       branch_o,
                        output                       jal_o,
                        output                       jalr_o );


//reg [31:0] fetched_instr_reg = fetched_instr_i;
reg [1:0]  ex_op_a_sel_reg;
assign     ex_op_a_sel_o = ex_op_a_sel_reg;
reg [2:0]  ex_op_b_sel_reg;
assign     ex_op_b_sel_o = ex_op_b_sel_reg;
reg [`ALU_OP_WIDTH-1:0] alu_op_reg;
assign     alu_op_o = alu_op_reg;
reg        mem_req_reg;
assign     mem_req_o = mem_req_reg;
reg        mem_we_reg ;
assign     mem_we_o = mem_we_reg;
reg [2:0]  mem_size_reg;
assign     mem_size_o = mem_size_reg;
reg        gpr_we_a_reg;
assign     gpr_we_a_o = gpr_we_a_reg;
reg        wb_src_sel_reg;
assign     wb_src_sel_o = wb_src_sel_reg;
reg        illegal_instr_reg;
assign     illegal_instr_o = illegal_instr_reg;
reg        branch_reg;
assign     branch_o = branch_reg;
reg        jal_reg;
assign     jal_o = jal_reg;
reg        jalr_reg;
assign     jalr_o = jalr_reg;


reg [6:0] opcode;
reg [6:0] funct7;
reg [2:0] funct3;
always@(*)
begin
    opcode <= fetched_instr_i[6:0];
    funct7 <= fetched_instr_i[31:25];
    funct3 <= fetched_instr_i[14:12];
end



always@(*)
    begin
    if(opcode[1:0] != 2'b11) begin
        illegal_instr_reg <= 1'b1;
        end
    else begin
        case (opcode[6:2])
        `OP_OPCODE: begin
                        gpr_we_a_reg <= 1'b1;
                        ex_op_a_sel_reg <= `OP_A_RS1;
                        ex_op_b_sel_reg <= `OP_B_RS2;
                        wb_src_sel_reg <= `WB_EX_RESULT;
                        mem_req_reg <= 1'b0;
                        mem_we_reg <= 1'b0;
                        branch_reg <= 1'b0;
                        jal_reg <= 1'b0;
                        jalr_reg <= 1'b0;
                        
                        case(funct7)
                        7'h00: begin
                                   case(funct3)
                                   3'h0: begin
                                       alu_op_reg <= `ALU_ADD;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h4: begin
                                       alu_op_reg <= `ALU_XOR;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h6: begin
                                       alu_op_reg <= `ALU_OR;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h7: begin
                                       alu_op_reg <= `ALU_AND;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h1: begin
                                       alu_op_reg <= `ALU_SLL;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h5: begin
                                       alu_op_reg <= `ALU_SRL;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h2: begin
                                       alu_op_reg <= `ALU_SLTS;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h3: begin
                                       alu_op_reg <= `ALU_SLTU;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   default: illegal_instr_reg <= 1'b1; 
                                   endcase
                               end
                        7'h20: begin
                                   case(funct3)
                                   3'h0: begin
                                       alu_op_reg <= `ALU_SUB;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   3'h5: begin
                                       alu_op_reg <= `ALU_SRA;
                                       illegal_instr_reg <= 1'b0;
                                   end
                                   default: illegal_instr_reg <= 1'b1;
                                   endcase
                               end
                        default: illegal_instr_reg <= 1'b1;
                        endcase  
                    end


        `OP_IMM_OPCODE: begin
                            gpr_we_a_reg <= 1'b1;
                            ex_op_a_sel_reg <= `OP_A_RS1;
                            ex_op_b_sel_reg <= `OP_B_IMM_I;
                            wb_src_sel_reg <= `WB_EX_RESULT;
                            mem_req_reg <= 1'b0;
                            mem_we_reg <= 1'b0;
                            branch_reg <= 1'b0;
                            jal_reg <= 1'b0;
                            jalr_reg <= 1'b0;
                            
                            case(funct3)
                            3'h0: begin
                                alu_op_reg <= `ALU_ADD;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h4: begin
                                alu_op_reg <= `ALU_XOR;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h6: begin
                                alu_op_reg <= `ALU_OR;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h7: begin
                                alu_op_reg <= `ALU_AND;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h1: begin
                                if (funct7 == 7'h0) begin
                                    alu_op_reg <= `ALU_SLL;
                                    illegal_instr_reg <= 1'b0;
                                end
                                else begin
                                    illegal_instr_reg <= 1'b1;
                                end
                                end
                            3'h5: begin
                                if (funct7 == 7'h0) begin
                                    alu_op_reg <= `ALU_SRL;
                                    illegal_instr_reg <= 1'b0;
                                end
                                else if (funct7 == 7'h20) begin
                                    alu_op_reg <= `ALU_SRA;
                                    illegal_instr_reg <= 1'b0;
                                end
                                else begin
                                    illegal_instr_reg <= 1'b1;
                                end
                                end
                            3'h2: begin
                                alu_op_reg <= `ALU_SLTS;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h3: begin
                                alu_op_reg <= `ALU_SLTU;
                                illegal_instr_reg <= 1'b0;
                            end
                            default: illegal_instr_reg <= 1'b1;
                            endcase
                        end
           
                        
        `LOAD_OPCODE: begin
                          gpr_we_a_reg <= 1'b1;
                          ex_op_a_sel_reg <= `OP_A_RS1;
                          ex_op_b_sel_reg <= `OP_B_IMM_I;
                          alu_op_reg <= `ALU_ADD;
                          mem_req_reg <= 1'b1;
                          mem_we_reg <= 1'b0;
                          wb_src_sel_reg <= `WB_LSU_DATA;
                          branch_reg <= 1'b0;
                          jal_reg <= 1'b0;
                          jalr_reg <= 1'b0;
                          
                          case(funct3)
                          3'h0: begin
                              mem_size_reg <= `LDST_B;
                              illegal_instr_reg <= 1'b0;
                          end
                          3'h1: begin
                              mem_size_reg <= `LDST_H;
                              illegal_instr_reg <= 1'b0;
                          end
                          3'h2: begin
                              mem_size_reg <= `LDST_W;
                              illegal_instr_reg <= 1'b0;
                          end
                          3'h4: begin
                              mem_size_reg <= `LDST_BU;
                              illegal_instr_reg <= 1'b0;
                          end
                          3'h5: begin
                              mem_size_reg <= `LDST_HU;
                              illegal_instr_reg <= 1'b0;
                          end
                          default: illegal_instr_reg <= 1'b1;
                          endcase
                      end
          
                      
        `STORE_OPCODE: begin
                           gpr_we_a_reg <= 1'b0;
                           ex_op_a_sel_reg <= `OP_A_RS1;
                           ex_op_b_sel_reg <= `OP_B_IMM_S;
                           alu_op_reg <= `ALU_ADD;
                           mem_req_reg <= 1'b1;
                           mem_we_reg <= 1'b1;
                           wb_src_sel_reg <= `WB_LSU_DATA;
                           branch_reg <= 1'b0;
                           jal_reg <= 1'b0;
                           jalr_reg <= 1'b0;
                           
                           case(funct3)
                           3'h0: begin
                               mem_size_reg <= `LDST_B;
                               illegal_instr_reg <= 1'b0;
                           end
                           3'h1: begin
                               mem_size_reg <= `LDST_H;
                               illegal_instr_reg <= 1'b0;
                           end
                           3'h2: begin
                               mem_size_reg <= `LDST_W;
                               illegal_instr_reg <= 1'b0;
                           end
                           default: illegal_instr_reg <= 1'b1;
                           endcase
                       end
            
                       
        `BRANCH_OPCODE: begin
                            gpr_we_a_reg <= 1'b0;
                            ex_op_a_sel_reg <= `OP_A_RS1;
                            ex_op_b_sel_reg <= `OP_B_RS2;
                            mem_req_reg <= 1'b0;
                            mem_we_reg <= 1'b0;
                            wb_src_sel_reg <= `WB_EX_RESULT;
                            branch_reg <= 1'b1;
                            jal_reg <= 1'b0;
                            jalr_reg <= 1'b0;
                            
                            case(funct3)
                            3'h0: begin
                                alu_op_reg <= `ALU_EQ;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h1: begin
                                alu_op_reg <= `ALU_NE;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h4: begin
                                alu_op_reg <= `ALU_LTS;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h5: begin
                                alu_op_reg <= `ALU_GES;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h6: begin
                                alu_op_reg <= `ALU_LTU;
                                illegal_instr_reg <= 1'b0;
                            end
                            3'h7: begin
                                alu_op_reg <= `ALU_GEU;
                                illegal_instr_reg <= 1'b0;
                            end
                            default: illegal_instr_reg <= 1'b1;
                            endcase
                        end
            
                        
        `JAL_OPCODE: begin
                         gpr_we_a_reg <= 1'b1;
                         ex_op_a_sel_reg <= `OP_A_CURR_PC;
                         ex_op_b_sel_reg <= `OP_B_INCR;
                         alu_op_reg <= `ALU_ADD;
                         mem_req_reg <= 1'b0;
                         mem_we_reg <= 1'b0;
                         wb_src_sel_reg <= `WB_EX_RESULT;
                         branch_reg <= 1'b0;
                         jal_reg <= 1'b1;
                         jalr_reg <= 1'b0;
                         illegal_instr_reg <= 1'b0;
                     end
            
                     
        `JALR_OPCODE: begin
                          gpr_we_a_reg <= 1'b1;
                          ex_op_a_sel_reg <= `OP_A_CURR_PC;
                          ex_op_b_sel_reg <= `OP_B_INCR;
                          alu_op_reg <= `ALU_ADD;
                          mem_req_reg <= 1'b0;
                          mem_we_reg <= 1'b0;
                          wb_src_sel_reg <= `WB_EX_RESULT;
                          branch_reg <= 1'b0;
                          jal_reg <= 1'b0;
                          jalr_reg <= 1'b1;
                          
                          case(funct3)
                          3'b0: illegal_instr_reg <= 1'b0;
                          default: illegal_instr_reg <= 1'b1;
                          endcase
                      end
            
                      
        `LUI_OPCODE: begin
                         gpr_we_a_reg <= 1'b1;
                         ex_op_a_sel_reg <= `OP_A_ZERO;
                         ex_op_b_sel_reg <= `OP_B_IMM_U;
                         alu_op_reg <= `ALU_ADD;
                         mem_req_reg <= 1'b0;
                         mem_we_reg <= 1'b0;
                         wb_src_sel_reg <= `WB_EX_RESULT;
                         branch_reg <= 1'b0;
                         jal_reg <= 1'b0;
                         jalr_reg <= 1'b0;
                         illegal_instr_reg <= 1'b0;
                     end
           
                     
        `AUIPC_OPCODE: begin
                           gpr_we_a_reg <= 1'b1;
                           ex_op_a_sel_reg <= `OP_A_RS1;
                           ex_op_b_sel_reg <= `OP_B_IMM_U;
                           alu_op_reg <= `ALU_ADD;
                           mem_req_reg <= 1'b0;
                           mem_we_reg <= 1'b0;
                           wb_src_sel_reg <= `WB_EX_RESULT;
                           branch_reg <= 1'b0;
                           jal_reg <= 1'b0;
                           jalr_reg <= 1'b0; 
                           illegal_instr_reg <= 1'b0; 
                       end
           
                       
        `SYSTEM_OPCODE: begin // NO OPERATION
                            gpr_we_a_reg <= 1'b0;
                            ex_op_a_sel_reg <= `OP_A_RS1;
                            ex_op_b_sel_reg <= `OP_B_RS2;
                            alu_op_reg <= `ALU_ADD;
                            mem_req_reg <= 1'b0;
                            mem_we_reg <= 1'b0;
                            wb_src_sel_reg <= `WB_EX_RESULT;
                            branch_reg <= 1'b0;
                            jal_reg <= 1'b0;
                            jalr_reg <= 1'b0;
                            illegal_instr_reg <= 1'b0;
                        end
                
                        
        default: illegal_instr_reg <= 1'b1;
        endcase
    end
    end

endmodule
                        
                        
                        
                        
                        
                        
                        