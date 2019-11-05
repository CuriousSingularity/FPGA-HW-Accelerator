-- -------------------------------------------------------------
-- 
-- File Name: Streaming_VHDL\fil_videosharp_sim\Bit_Set.vhd
-- Created: 2019-06-18 09:45:08
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Bit_Set
-- Source Path: fil_videosharp_sim/Streaming 2-D FIR Filter/Line Memory/Line Memory Controller/Read Control/Bit Set
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Bit_Set IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        set                               :   IN    std_logic;
        reset_1                           :   IN    std_logic;
        status                            :   OUT   std_logic
        );
END Bit_Set;


ARCHITECTURE rtl OF Bit_Set IS

  -- Signals
  SIGNAL status_reg                       : std_logic;
  SIGNAL status_reg_next                  : std_logic;

BEGIN
  Bit_Set_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      status_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        status_reg <= status_reg_next;
      END IF;
    END IF;
  END PROCESS Bit_Set_1_process;

  Bit_Set_1_output : PROCESS (reset_1, set, status_reg)
  BEGIN
    status_reg_next <= status_reg;
    status <= status_reg;
    IF set = '1' THEN 
      status_reg_next <= '1';
    ELSIF reset_1 = '1' THEN 
      status_reg_next <= '0';
    END IF;
  END PROCESS Bit_Set_1_output;


END rtl;

