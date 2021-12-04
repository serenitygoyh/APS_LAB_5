`timescale 1ns / 1ps

module tb_miriscv_top();

  parameter     HF_CYCLE = 2.5;       // 200 MHz clock
  parameter     RST_WAIT = 10;         // 10 ns reset
  parameter     RAM_SIZE = 512;       // in bytes

  // clock, reset
  reg clk;
  reg rst_n;

  miriscv_top #(
    .RAM_SIZE       ( RAM_SIZE           ),
    .RAM_INIT_FILE  ( "C:/Users/danil/Desktop/5_sem/APS/APS_5/APS_5.srcs/sources_1/new/test_lsu.txt" )
  ) dut (
    .clk_i    ( clk   ),
    .rst_n_i  ( rst_n )
  );

  initial begin
    clk   = 1'b0;
    rst_n = 1'b0;
    #RST_WAIT;
    rst_n = 1'b1;
  end

  always begin
    #HF_CYCLE;
    clk = ~clk;
  end

endmodule
