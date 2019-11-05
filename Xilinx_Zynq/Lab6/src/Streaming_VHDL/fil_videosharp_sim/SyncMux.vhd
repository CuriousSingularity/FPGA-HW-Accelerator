-- -------------------------------------------------------------
-- 
-- File Name: Streaming_VHDL\fil_videosharp_sim\SyncMux.vhd
-- Created: 2019-06-18 09:45:08
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SyncMux
-- Source Path: fil_videosharp_sim/Streaming 2-D FIR Filter/Line Memory/Line Memory Controller/Adjust Sync Signals/SyncMux
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SyncMux IS
  PORT( activePixel                       :   IN    std_logic;
        lineStart                         :   IN    std_logic;
        lineEnd                           :   IN    std_logic;
        FrameStart                        :   IN    std_logic;
        FrameEnd                          :   IN    std_logic;
        syncOut                           :   OUT   std_logic_vector(0 TO 4)  -- boolean [5]
        );
END SyncMux;


ARCHITECTURE rtl OF SyncMux IS

  -- Signals
  SIGNAL Mux_out1                         : std_logic_vector(0 TO 4);  -- boolean [5]

BEGIN
  Mux_out1(0) <= activePixel;
  Mux_out1(1) <= lineStart;
  Mux_out1(2) <= lineEnd;
  Mux_out1(3) <= FrameStart;
  Mux_out1(4) <= FrameEnd;

  syncOut <= Mux_out1;

END rtl;

