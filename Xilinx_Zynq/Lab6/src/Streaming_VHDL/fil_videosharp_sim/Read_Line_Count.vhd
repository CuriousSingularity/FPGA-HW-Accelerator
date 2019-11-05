-- -------------------------------------------------------------
-- 
-- File Name: Streaming_VHDL\fil_videosharp_sim\Read_Line_Count.vhd
-- Created: 2019-06-18 09:45:08
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Read_Line_Count
-- Source Path: fil_videosharp_sim/Streaming 2-D FIR Filter/Line Memory/Line Memory Controller/Read Line Count
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Read_Line_Count IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        enable                            :   IN    std_logic;
        delayedReload                     :   IN    std_logic;
        loadVal                           :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        count                             :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END Read_Line_Count;


ARCHITECTURE rtl OF Read_Line_Count IS

  -- Component Declarations
  COMPONENT Read_Line_Counter1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enable                          :   IN    std_logic;
          reload                          :   IN    std_logic;
          loadVal                         :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          count                           :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Read_Line_Counter1
    USE ENTITY work.Read_Line_Counter1(rtl);

  -- Signals
  SIGNAL Unit_Delay8_out1                 : std_logic;
  SIGNAL Read_Line_Counter1_out1          : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL Read_Line_Counter1_out1_unsigned : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL loadVal_unsigned                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Multiport_Switch_out1            : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  u_Read_Line_Counter1 : Read_Line_Counter1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enable => enable,
              reload => Unit_Delay8_out1,
              loadVal => loadVal,  -- ufix2
              count => Read_Line_Counter1_out1  -- ufix2
              );

  Unit_Delay8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay8_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay8_out1 <= delayedReload;
      END IF;
    END IF;
  END PROCESS Unit_Delay8_process;


  Read_Line_Counter1_out1_unsigned <= unsigned(Read_Line_Counter1_out1);

  loadVal_unsigned <= unsigned(loadVal);

  
  Multiport_Switch_out1 <= Read_Line_Counter1_out1_unsigned WHEN Unit_Delay8_out1 = '0' ELSE
      loadVal_unsigned;

  count <= std_logic_vector(Multiport_Switch_out1);

END rtl;

