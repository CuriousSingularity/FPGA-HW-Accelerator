-- -------------------------------------------------------------
-- 
-- File Name: Streaming_VHDL\fil_videosharp_sim\Streaming_2_D_FIR_Filter_pkg.vhd
-- Created: 2019-06-18 09:45:08
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE Streaming_2_D_FIR_Filter_pkg IS
  TYPE vector_of_std_logic_vector8 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(7 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed64 IS ARRAY (NATURAL RANGE <>) OF signed(63 DOWNTO 0);
  TYPE vector_of_signed33 IS ARRAY (NATURAL RANGE <>) OF signed(32 DOWNTO 0);
  TYPE vector_of_signed8 IS ARRAY (NATURAL RANGE <>) OF signed(7 DOWNTO 0);
  TYPE vector_of_std_logic_vector16 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(15 DOWNTO 0);
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
  TYPE vector_of_unsigned5 IS ARRAY (NATURAL RANGE <>) OF unsigned(4 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_signed9 IS ARRAY (NATURAL RANGE <>) OF signed(8 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
END Streaming_2_D_FIR_Filter_pkg;
