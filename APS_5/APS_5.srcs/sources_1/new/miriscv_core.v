`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

`include "C:/Users/danil/Desktop/5_sem/APS/APS_5/APS_5.srcs/sources_1/new/miriscv_defines.v"

module miriscv_core(
                     input clk_i,
                     input arstn_i,

                     input [31:0] instr_rdata_i,
                     output [31:0] instr_addr_o,

                     input [31:0] data_rdata_i,
                     output data_req_o,
                     output data_we_o,
                     output [3:0] data_be_o,
                     output [31:0] data_addr_o,
                     output [31:0] data_wdata_o
                   );
    
    
    reg [31:0] PC;
    initial PC <= 32'b0;
    reg [31:0] to_PC;
    
    always@(posedge clk_i)
    begin
        if (!arstn_i)
        begin
            PC <= 32'b0;
            to_PC <= 4;
        end
        else if (PC_wait)
        begin
            PC <= PC;
        end
        else begin
        PC <= PC + $signed(to_PC);
        end
    end
    
    
    
    wire [31:0] Instr = instr_rdata_i;
    assign instr_addr_o = PC;
    
    

    wire [1:0] op_a;
    wire [2:0] op_b;
    wire [4:0] ALU_op;
    wire mem_req;
    wire mem_we;
    wire [2:0] mem_size;
    wire rf_we;
    wire rf_ws;
    wire illegal_instr;
    wire branch;
    wire jal;
    wire jalr;
    main_decoder DC (.fetched_instr_i(Instr), .ex_op_a_sel_o(op_a), .ex_op_b_sel_o(op_b), .alu_op_o(ALU_op),
                     .mem_req_o(mem_req), .mem_we_o(mem_we), .mem_size_o(mem_size), .gpr_we_a_o(rf_we), 
                     .wb_src_sel_o(rf_ws), .illegal_instr_o(illegal_instr), .branch_o(branch), .jal_o(jal), .jalr_o(jalr)); 
    
    
    
    reg [31:0] WD_rf;
    wire [31:0] RD_rf_1, RD_rf_2;
    rf RF (.clk(clk_i), .A1(Instr[19:15]), .A2(Instr[24:20]), .A3(Instr[11:7]), .WD3(WD_rf), .WE3(rf_we), .RD1(RD_rf_1), .RD2(RD_rf_2));
    
    
    
    reg [31:0] to_ALU_1, to_ALU_2;
    always@(*)
    begin
        case(op_a)
        `OP_A_RS1 : to_ALU_1 <= RD_rf_1;
        `OP_A_CURR_PC : to_ALU_1 <= PC;
        `OP_A_ZERO : to_ALU_1 <= 32'd0;
        endcase
        
        case(op_b)
        `OP_B_RS2 : to_ALU_2 <= RD_rf_2;
        `OP_B_IMM_I : to_ALU_2 <= {{20{Instr[31]}}, Instr[31:20]};              //Imm_I
        `OP_B_IMM_U : to_ALU_2 <= {Instr[31:12], 12'd0};                        //Imm_U
        `OP_B_IMM_S : to_ALU_2 <= {{20{Instr[31]}}, Instr[31:25], Instr[11:7]}; //Imm_S
        `OP_B_INCR : to_ALU_2 <= 32'd4;
        endcase       
    end
    
    wire [31:0] ALU_result;
    wire ALU_Flag;
    ALU_RISC_V ALU1 (.ALUOp(ALU_op), .A(to_ALU_1), .B(to_ALU_2), .result(ALU_result), .Flag(ALU_Flag));
    
    
    
    wire [31:0] RD_dm;
    wire PC_wait;
    miriscv_lsu LSU (.clk_i(clk_i), .arstn_i(arstn_i), .lsu_addr_i(ALU_result), .lsu_we_i(mem_we), 
                     .lsu_size_i(mem_size), .lsu_data_i(RD_rf_2), .lsu_req_i(mem_req), .lsu_stall_req_o(PC_wait),
                     .lsu_data_o(RD_dm), .data_rdata_i(data_rdata_i), .data_req_o(data_req_o), .data_we_o(data_we_o),
                     .data_be_o(data_be_o), .data_addr_o(data_addr_o), .data_wdata_o(data_wdata_o));
    
    
    
    always@(*)
    begin
        case(rf_ws)
        `WB_EX_RESULT : WD_rf <= ALU_result;
        `WB_LSU_DATA : WD_rf <= RD_dm;
        endcase
    end   
    
    
    
    wire perehod = branch & ALU_Flag | jal;
    reg [31:0] summand;
    reg [31:0] to_adder;
    
    initial to_adder <= 4;

    always@(*)
    begin
        case (branch)
            1'b0 : summand <= {{11{Instr[31]}}, Instr[31], Instr[19:12], Instr[20], Instr[30:21], 1'b0}; //Imm_J
            1'b1 : summand <= {{19{Instr[31]}}, Instr[31], Instr[7], Instr[30:25], Instr[11:8], 1'b0};   //Imm_B
        endcase
        
        case (perehod)
            1'b0 : to_adder <= 32'd4;
            1'b1 : to_adder <= summand;
        endcase
    end
    
    
    
    always@(*)
    begin
        case (jalr)
            1'b0 : to_PC <= to_adder;
            1'b1 : to_PC <= RD_rf_1;
        endcase
    end
endmodule
