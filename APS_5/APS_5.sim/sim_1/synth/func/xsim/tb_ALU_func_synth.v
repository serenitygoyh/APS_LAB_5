// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Oct  4 19:20:19 2021
// Host        : 4328_COMP-25 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/8190894/ALU/ALU.sim/sim_1/synth/func/xsim/tb_ALU_func_synth.v
// Design      : ALU_RISC_V
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module ALU_RISC_V
   (SW,
    CLK100MHZ,
    LED,
    LED16_R);
  input [14:0]SW;
  input CLK100MHZ;
  output [4:0]LED;
  output LED16_R;

  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire CLK100MHZ_IBUF_BUFG;
  wire Flag_i_1_n_0;
  wire [4:0]LED;
  wire LED16_R;
  wire LED16_R_OBUF;
  wire [4:0]LED_OBUF;
  wire [14:0]SW;
  wire [14:0]SW_IBUF;
  wire \result[0]_i_10_n_0 ;
  wire \result[0]_i_11_n_0 ;
  wire \result[0]_i_12_n_0 ;
  wire \result[0]_i_13_n_0 ;
  wire \result[0]_i_14_n_0 ;
  wire \result[0]_i_1_n_0 ;
  wire \result[0]_i_2_n_0 ;
  wire \result[0]_i_3_n_0 ;
  wire \result[0]_i_4_n_0 ;
  wire \result[0]_i_5_n_0 ;
  wire \result[0]_i_6_n_0 ;
  wire \result[0]_i_7_n_0 ;
  wire \result[0]_i_8_n_0 ;
  wire \result[0]_i_9_n_0 ;
  wire \result[1]_i_1_n_0 ;
  wire \result[1]_i_2_n_0 ;
  wire \result[1]_i_3_n_0 ;
  wire \result[1]_i_4_n_0 ;
  wire \result[1]_i_5_n_0 ;
  wire \result[1]_i_6_n_0 ;
  wire \result[1]_i_7_n_0 ;
  wire \result[1]_i_8_n_0 ;
  wire \result[1]_i_9_n_0 ;
  wire \result[2]_i_1_n_0 ;
  wire \result[2]_i_2_n_0 ;
  wire \result[2]_i_3_n_0 ;
  wire \result[2]_i_4_n_0 ;
  wire \result[2]_i_5_n_0 ;
  wire \result[2]_i_6_n_0 ;
  wire \result[2]_i_7_n_0 ;
  wire \result[2]_i_8_n_0 ;
  wire \result[3]_i_10_n_0 ;
  wire \result[3]_i_1_n_0 ;
  wire \result[3]_i_2_n_0 ;
  wire \result[3]_i_3_n_0 ;
  wire \result[3]_i_4_n_0 ;
  wire \result[3]_i_5_n_0 ;
  wire \result[3]_i_6_n_0 ;
  wire \result[3]_i_7_n_0 ;
  wire \result[3]_i_8_n_0 ;
  wire \result[3]_i_9_n_0 ;
  wire \result[4]_i_10_n_0 ;
  wire \result[4]_i_11_n_0 ;
  wire \result[4]_i_12_n_0 ;
  wire \result[4]_i_13_n_0 ;
  wire \result[4]_i_14_n_0 ;
  wire \result[4]_i_15_n_0 ;
  wire \result[4]_i_16_n_0 ;
  wire \result[4]_i_1_n_0 ;
  wire \result[4]_i_2_n_0 ;
  wire \result[4]_i_3_n_0 ;
  wire \result[4]_i_4_n_0 ;
  wire \result[4]_i_5_n_0 ;
  wire \result[4]_i_6_n_0 ;
  wire \result[4]_i_7_n_0 ;
  wire \result[4]_i_8_n_0 ;
  wire \result[4]_i_9_n_0 ;
  wire \result_reg_n_0_[0] ;
  wire \result_reg_n_0_[1] ;
  wire \result_reg_n_0_[2] ;
  wire \result_reg_n_0_[3] ;
  wire \result_reg_n_0_[4] ;

  BUFG CLK100MHZ_IBUF_BUFG_inst
       (.I(CLK100MHZ_IBUF),
        .O(CLK100MHZ_IBUF_BUFG));
  IBUF CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  LUT2 #(
    .INIT(4'h8)) 
    Flag_i_1
       (.I0(\result[0]_i_2_n_0 ),
        .I1(SW_IBUF[14]),
        .O(Flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Flag_reg
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(\result[4]_i_2_n_0 ),
        .D(Flag_i_1_n_0),
        .Q(LED16_R_OBUF),
        .R(1'b0));
  OBUF LED16_R_OBUF_inst
       (.I(LED16_R_OBUF),
        .O(LED16_R));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF[0]),
        .O(LED[0]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF[1]),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF[2]),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF[3]),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(LED_OBUF[4]),
        .O(LED[4]));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[0] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result_reg_n_0_[0] ),
        .Q(LED_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[1] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result_reg_n_0_[1] ),
        .Q(LED_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[2] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result_reg_n_0_[2] ),
        .Q(LED_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[3] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result_reg_n_0_[3] ),
        .Q(LED_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[4] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result_reg_n_0_[4] ),
        .Q(LED_OBUF[4]),
        .R(1'b0));
  IBUF \SW_IBUF[0]_inst 
       (.I(SW[0]),
        .O(SW_IBUF[0]));
  IBUF \SW_IBUF[10]_inst 
       (.I(SW[10]),
        .O(SW_IBUF[10]));
  IBUF \SW_IBUF[11]_inst 
       (.I(SW[11]),
        .O(SW_IBUF[11]));
  IBUF \SW_IBUF[12]_inst 
       (.I(SW[12]),
        .O(SW_IBUF[12]));
  IBUF \SW_IBUF[13]_inst 
       (.I(SW[13]),
        .O(SW_IBUF[13]));
  IBUF \SW_IBUF[14]_inst 
       (.I(SW[14]),
        .O(SW_IBUF[14]));
  IBUF \SW_IBUF[1]_inst 
       (.I(SW[1]),
        .O(SW_IBUF[1]));
  IBUF \SW_IBUF[2]_inst 
       (.I(SW[2]),
        .O(SW_IBUF[2]));
  IBUF \SW_IBUF[3]_inst 
       (.I(SW[3]),
        .O(SW_IBUF[3]));
  IBUF \SW_IBUF[4]_inst 
       (.I(SW[4]),
        .O(SW_IBUF[4]));
  IBUF \SW_IBUF[5]_inst 
       (.I(SW[5]),
        .O(SW_IBUF[5]));
  IBUF \SW_IBUF[6]_inst 
       (.I(SW[6]),
        .O(SW_IBUF[6]));
  IBUF \SW_IBUF[7]_inst 
       (.I(SW[7]),
        .O(SW_IBUF[7]));
  IBUF \SW_IBUF[8]_inst 
       (.I(SW[8]),
        .O(SW_IBUF[8]));
  IBUF \SW_IBUF[9]_inst 
       (.I(SW[9]),
        .O(SW_IBUF[9]));
  LUT6 #(
    .INIT(64'hBBB8FFFFBBB80000)) 
    \result[0]_i_1 
       (.I0(\result[0]_i_2_n_0 ),
        .I1(SW_IBUF[14]),
        .I2(\result[0]_i_3_n_0 ),
        .I3(\result[0]_i_4_n_0 ),
        .I4(\result[4]_i_2_n_0 ),
        .I5(\result_reg_n_0_[0] ),
        .O(\result[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20200020)) 
    \result[0]_i_10 
       (.I0(\result[0]_i_14_n_0 ),
        .I1(\result[4]_i_9_n_0 ),
        .I2(SW_IBUF[12]),
        .I3(SW_IBUF[5]),
        .I4(\result[1]_i_8_n_0 ),
        .O(\result[0]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \result[0]_i_11 
       (.I0(SW_IBUF[0]),
        .I1(SW_IBUF[5]),
        .O(\result[0]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[0]_i_12 
       (.I0(SW_IBUF[2]),
        .I1(SW_IBUF[7]),
        .O(\result[0]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \result[0]_i_13 
       (.I0(SW_IBUF[7]),
        .I1(SW_IBUF[0]),
        .I2(SW_IBUF[6]),
        .O(\result[0]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hCCEEFCFFCCEEFCCC)) 
    \result[0]_i_14 
       (.I0(SW_IBUF[2]),
        .I1(SW_IBUF[5]),
        .I2(SW_IBUF[4]),
        .I3(SW_IBUF[7]),
        .I4(SW_IBUF[6]),
        .I5(SW_IBUF[0]),
        .O(\result[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hB8884777B8BB4744)) 
    \result[0]_i_2 
       (.I0(\result[0]_i_5_n_0 ),
        .I1(SW_IBUF[11]),
        .I2(\result[0]_i_6_n_0 ),
        .I3(SW_IBUF[12]),
        .I4(SW_IBUF[10]),
        .I5(\result[0]_i_7_n_0 ),
        .O(\result[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0040404404004404)) 
    \result[0]_i_3 
       (.I0(SW_IBUF[12]),
        .I1(SW_IBUF[11]),
        .I2(SW_IBUF[9]),
        .I3(SW_IBUF[4]),
        .I4(\result[4]_i_16_n_0 ),
        .I5(SW_IBUF[10]),
        .O(\result[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBB8BBB8BBB8)) 
    \result[0]_i_4 
       (.I0(\result[0]_i_8_n_0 ),
        .I1(SW_IBUF[11]),
        .I2(\result[0]_i_9_n_0 ),
        .I3(\result[0]_i_10_n_0 ),
        .I4(\result[0]_i_11_n_0 ),
        .I5(\result[4]_i_11_n_0 ),
        .O(\result[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB200FFB2)) 
    \result[0]_i_5 
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[8]),
        .I2(\result[3]_i_9_n_0 ),
        .I3(SW_IBUF[4]),
        .I4(SW_IBUF[9]),
        .O(\result[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB2FF00B2)) 
    \result[0]_i_6 
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[8]),
        .I2(\result[3]_i_9_n_0 ),
        .I3(SW_IBUF[4]),
        .I4(SW_IBUF[9]),
        .O(\result[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000041)) 
    \result[0]_i_7 
       (.I0(\result[0]_i_12_n_0 ),
        .I1(SW_IBUF[0]),
        .I2(SW_IBUF[5]),
        .I3(\result[1]_i_6_n_0 ),
        .I4(\result[3]_i_8_n_0 ),
        .I5(\result[4]_i_10_n_0 ),
        .O(\result[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hC440)) 
    \result[0]_i_8 
       (.I0(SW_IBUF[10]),
        .I1(SW_IBUF[12]),
        .I2(SW_IBUF[0]),
        .I3(SW_IBUF[5]),
        .O(\result[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0055004055400040)) 
    \result[0]_i_9 
       (.I0(SW_IBUF[12]),
        .I1(\result[4]_i_14_n_0 ),
        .I2(\result[0]_i_13_n_0 ),
        .I3(SW_IBUF[5]),
        .I4(SW_IBUF[13]),
        .I5(SW_IBUF[0]),
        .O(\result[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h001DFF1D)) 
    \result[1]_i_1 
       (.I0(\result[1]_i_2_n_0 ),
        .I1(SW_IBUF[12]),
        .I2(\result[1]_i_3_n_0 ),
        .I3(SW_IBUF[11]),
        .I4(\result[1]_i_4_n_0 ),
        .O(\result[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F0FF0F74444777)) 
    \result[1]_i_2 
       (.I0(\result[1]_i_5_n_0 ),
        .I1(SW_IBUF[10]),
        .I2(SW_IBUF[5]),
        .I3(SW_IBUF[0]),
        .I4(\result[1]_i_6_n_0 ),
        .I5(SW_IBUF[13]),
        .O(\result[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000AEBFAEBFAEBF)) 
    \result[1]_i_3 
       (.I0(\result[4]_i_9_n_0 ),
        .I1(SW_IBUF[5]),
        .I2(\result[1]_i_7_n_0 ),
        .I3(\result[1]_i_8_n_0 ),
        .I4(\result[4]_i_11_n_0 ),
        .I5(\result[1]_i_6_n_0 ),
        .O(\result[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2BFF)) 
    \result[1]_i_4 
       (.I0(SW_IBUF[10]),
        .I1(SW_IBUF[6]),
        .I2(SW_IBUF[1]),
        .I3(SW_IBUF[12]),
        .O(\result[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000005040004)) 
    \result[1]_i_5 
       (.I0(SW_IBUF[6]),
        .I1(SW_IBUF[1]),
        .I2(SW_IBUF[7]),
        .I3(SW_IBUF[5]),
        .I4(SW_IBUF[0]),
        .I5(\result[1]_i_9_n_0 ),
        .O(\result[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \result[1]_i_6 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[6]),
        .O(\result[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \result[1]_i_7 
       (.I0(SW_IBUF[4]),
        .I1(SW_IBUF[6]),
        .I2(SW_IBUF[2]),
        .I3(SW_IBUF[7]),
        .O(\result[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h3022)) 
    \result[1]_i_8 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[7]),
        .I2(SW_IBUF[3]),
        .I3(SW_IBUF[6]),
        .O(\result[1]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[1]_i_9 
       (.I0(SW_IBUF[9]),
        .I1(SW_IBUF[8]),
        .O(\result[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h405440544054FFFF)) 
    \result[2]_i_1 
       (.I0(\result[3]_i_2_n_0 ),
        .I1(SW_IBUF[7]),
        .I2(SW_IBUF[2]),
        .I3(SW_IBUF[10]),
        .I4(\result[2]_i_2_n_0 ),
        .I5(\result[2]_i_3_n_0 ),
        .O(\result[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBBFAAAAAAAAAAAA)) 
    \result[2]_i_2 
       (.I0(SW_IBUF[11]),
        .I1(\result[4]_i_11_n_0 ),
        .I2(SW_IBUF[2]),
        .I3(SW_IBUF[7]),
        .I4(SW_IBUF[12]),
        .I5(\result[2]_i_4_n_0 ),
        .O(\result[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A22A2AA2)) 
    \result[2]_i_3 
       (.I0(\result[2]_i_5_n_0 ),
        .I1(\result[4]_i_11_n_0 ),
        .I2(\result[2]_i_6_n_0 ),
        .I3(SW_IBUF[2]),
        .I4(SW_IBUF[7]),
        .I5(SW_IBUF[12]),
        .O(\result[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFEFAAAAFFFF)) 
    \result[2]_i_4 
       (.I0(\result[4]_i_9_n_0 ),
        .I1(SW_IBUF[7]),
        .I2(SW_IBUF[3]),
        .I3(SW_IBUF[6]),
        .I4(\result[1]_i_7_n_0 ),
        .I5(SW_IBUF[5]),
        .O(\result[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0D00DDDD0DDDDDDD)) 
    \result[2]_i_5 
       (.I0(SW_IBUF[13]),
        .I1(\result[2]_i_7_n_0 ),
        .I2(\result[2]_i_8_n_0 ),
        .I3(SW_IBUF[5]),
        .I4(\result[4]_i_14_n_0 ),
        .I5(\result[3]_i_10_n_0 ),
        .O(\result[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1777)) 
    \result[2]_i_6 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[6]),
        .I2(SW_IBUF[0]),
        .I3(SW_IBUF[5]),
        .O(\result[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hDD4D22B222B2DD4D)) 
    \result[2]_i_7 
       (.I0(SW_IBUF[6]),
        .I1(SW_IBUF[1]),
        .I2(SW_IBUF[5]),
        .I3(SW_IBUF[0]),
        .I4(SW_IBUF[7]),
        .I5(SW_IBUF[2]),
        .O(\result[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \result[2]_i_8 
       (.I0(SW_IBUF[7]),
        .I1(SW_IBUF[1]),
        .I2(SW_IBUF[6]),
        .O(\result[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h080E080E080EFFFF)) 
    \result[3]_i_1 
       (.I0(SW_IBUF[8]),
        .I1(SW_IBUF[3]),
        .I2(\result[3]_i_2_n_0 ),
        .I3(SW_IBUF[10]),
        .I4(\result[3]_i_3_n_0 ),
        .I5(\result[3]_i_4_n_0 ),
        .O(\result[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \result[3]_i_10 
       (.I0(SW_IBUF[0]),
        .I1(SW_IBUF[6]),
        .I2(SW_IBUF[2]),
        .I3(SW_IBUF[7]),
        .O(\result[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \result[3]_i_2 
       (.I0(SW_IBUF[12]),
        .I1(SW_IBUF[11]),
        .O(\result[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBBFAAAAAAAAAAAA)) 
    \result[3]_i_3 
       (.I0(SW_IBUF[11]),
        .I1(\result[4]_i_11_n_0 ),
        .I2(SW_IBUF[3]),
        .I3(SW_IBUF[8]),
        .I4(SW_IBUF[12]),
        .I5(\result[3]_i_5_n_0 ),
        .O(\result[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000B0F0E0F0B000E)) 
    \result[3]_i_4 
       (.I0(SW_IBUF[10]),
        .I1(\result[3]_i_6_n_0 ),
        .I2(\result[3]_i_7_n_0 ),
        .I3(SW_IBUF[13]),
        .I4(\result[3]_i_8_n_0 ),
        .I5(\result[3]_i_9_n_0 ),
        .O(\result[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFDFDFFFFFCFF)) 
    \result[3]_i_5 
       (.I0(SW_IBUF[4]),
        .I1(\result[4]_i_9_n_0 ),
        .I2(SW_IBUF[6]),
        .I3(SW_IBUF[3]),
        .I4(SW_IBUF[7]),
        .I5(SW_IBUF[5]),
        .O(\result[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000017771777FFFF)) 
    \result[3]_i_6 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[6]),
        .I2(SW_IBUF[0]),
        .I3(SW_IBUF[5]),
        .I4(SW_IBUF[2]),
        .I5(SW_IBUF[7]),
        .O(\result[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEFAAEAAA)) 
    \result[3]_i_7 
       (.I0(SW_IBUF[12]),
        .I1(\result[3]_i_10_n_0 ),
        .I2(SW_IBUF[5]),
        .I3(\result[4]_i_14_n_0 ),
        .I4(\result[4]_i_13_n_0 ),
        .O(\result[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_8 
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[8]),
        .O(\result[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hB2BB2222BBBBB2BB)) 
    \result[3]_i_9 
       (.I0(SW_IBUF[2]),
        .I1(SW_IBUF[7]),
        .I2(SW_IBUF[0]),
        .I3(SW_IBUF[5]),
        .I4(SW_IBUF[1]),
        .I5(SW_IBUF[6]),
        .O(\result[3]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hA200)) 
    \result[4]_i_1 
       (.I0(SW_IBUF[13]),
        .I1(SW_IBUF[11]),
        .I2(SW_IBUF[12]),
        .I3(SW_IBUF[14]),
        .O(\result[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \result[4]_i_10 
       (.I0(SW_IBUF[4]),
        .I1(SW_IBUF[9]),
        .O(\result[4]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[4]_i_11 
       (.I0(SW_IBUF[10]),
        .I1(SW_IBUF[13]),
        .O(\result[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h2BD4D42BFFFFFFFF)) 
    \result[4]_i_12 
       (.I0(\result[3]_i_6_n_0 ),
        .I1(SW_IBUF[8]),
        .I2(SW_IBUF[3]),
        .I3(SW_IBUF[4]),
        .I4(SW_IBUF[9]),
        .I5(\result[4]_i_11_n_0 ),
        .O(\result[4]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2230)) 
    \result[4]_i_13 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[7]),
        .I2(SW_IBUF[3]),
        .I3(SW_IBUF[6]),
        .O(\result[4]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \result[4]_i_14 
       (.I0(SW_IBUF[8]),
        .I1(SW_IBUF[9]),
        .I2(SW_IBUF[10]),
        .I3(SW_IBUF[13]),
        .O(\result[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0F00ACAC)) 
    \result[4]_i_15 
       (.I0(SW_IBUF[0]),
        .I1(SW_IBUF[4]),
        .I2(SW_IBUF[7]),
        .I3(SW_IBUF[2]),
        .I4(SW_IBUF[6]),
        .I5(SW_IBUF[5]),
        .O(\result[4]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    \result[4]_i_16 
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[8]),
        .I2(\result[3]_i_9_n_0 ),
        .O(\result[4]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hA0EB5555)) 
    \result[4]_i_2 
       (.I0(SW_IBUF[14]),
        .I1(SW_IBUF[10]),
        .I2(SW_IBUF[12]),
        .I3(SW_IBUF[11]),
        .I4(SW_IBUF[13]),
        .O(\result[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hABABAAAB)) 
    \result[4]_i_3 
       (.I0(\result[4]_i_4_n_0 ),
        .I1(SW_IBUF[11]),
        .I2(\result[4]_i_5_n_0 ),
        .I3(\result[4]_i_6_n_0 ),
        .I4(\result[4]_i_7_n_0 ),
        .O(\result[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hC0404000)) 
    \result[4]_i_4 
       (.I0(SW_IBUF[10]),
        .I1(SW_IBUF[12]),
        .I2(SW_IBUF[11]),
        .I3(SW_IBUF[4]),
        .I4(SW_IBUF[9]),
        .O(\result[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000FD00FD00FD00)) 
    \result[4]_i_5 
       (.I0(\result[4]_i_8_n_0 ),
        .I1(SW_IBUF[5]),
        .I2(\result[4]_i_9_n_0 ),
        .I3(SW_IBUF[12]),
        .I4(\result[4]_i_10_n_0 ),
        .I5(\result[4]_i_11_n_0 ),
        .O(\result[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h20AAAAAA)) 
    \result[4]_i_6 
       (.I0(\result[4]_i_12_n_0 ),
        .I1(\result[4]_i_13_n_0 ),
        .I2(SW_IBUF[5]),
        .I3(\result[4]_i_14_n_0 ),
        .I4(\result[4]_i_15_n_0 ),
        .O(\result[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hBEEBAAAA)) 
    \result[4]_i_7 
       (.I0(SW_IBUF[12]),
        .I1(SW_IBUF[9]),
        .I2(SW_IBUF[4]),
        .I3(\result[4]_i_16_n_0 ),
        .I4(SW_IBUF[13]),
        .O(\result[4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \result[4]_i_8 
       (.I0(SW_IBUF[7]),
        .I1(SW_IBUF[4]),
        .I2(SW_IBUF[6]),
        .O(\result[4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFF1)) 
    \result[4]_i_9 
       (.I0(SW_IBUF[13]),
        .I1(SW_IBUF[10]),
        .I2(SW_IBUF[8]),
        .I3(SW_IBUF[9]),
        .O(\result[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[0] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\result[0]_i_1_n_0 ),
        .Q(\result_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[1] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(\result[4]_i_2_n_0 ),
        .D(\result[1]_i_1_n_0 ),
        .Q(\result_reg_n_0_[1] ),
        .R(\result[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[2] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(\result[4]_i_2_n_0 ),
        .D(\result[2]_i_1_n_0 ),
        .Q(\result_reg_n_0_[2] ),
        .R(\result[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[3] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(\result[4]_i_2_n_0 ),
        .D(\result[3]_i_1_n_0 ),
        .Q(\result_reg_n_0_[3] ),
        .R(\result[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[4] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(\result[4]_i_2_n_0 ),
        .D(\result[4]_i_3_n_0 ),
        .Q(\result_reg_n_0_[4] ),
        .R(\result[4]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
