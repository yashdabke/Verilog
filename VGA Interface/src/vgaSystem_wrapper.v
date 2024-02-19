//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Mon Feb 19 10:33:10 2024
//Host        : pc-vivado running 64-bit Ubuntu 22.04.3 LTS
//Command     : generate_target vgaSystem_wrapper.bd
//Design      : vgaSystem_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module vgaSystem_wrapper
   (VGA_B,
    VGA_G,
    VGA_R,
    reset_rtl,
    sys_clock,
    vid_hsync_0,
    vid_vsync_0);
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output [3:0]VGA_R;
  input reset_rtl;
  input sys_clock;
  output vid_hsync_0;
  output vid_vsync_0;

  wire [3:0]VGA_B;
  wire [3:0]VGA_G;
  wire [3:0]VGA_R;
  wire reset_rtl;
  wire sys_clock;
  wire vid_hsync_0;
  wire vid_vsync_0;

  vgaSystem vgaSystem_i
       (.VGA_B(VGA_B),
        .VGA_G(VGA_G),
        .VGA_R(VGA_R),
        .reset_rtl(reset_rtl),
        .sys_clock(sys_clock),
        .vid_hsync_0(vid_hsync_0),
        .vid_vsync_0(vid_vsync_0));
endmodule
