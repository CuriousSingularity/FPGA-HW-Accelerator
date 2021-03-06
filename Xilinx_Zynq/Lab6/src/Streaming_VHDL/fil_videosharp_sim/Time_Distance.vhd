-- -------------------------------------------------------------
-- 
-- File Name: Streaming_VHDL\fil_videosharp_sim\Time_Distance.vhd
-- Created: 2019-06-18 09:45:08
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Time_Distance
-- Source Path: fil_videosharp_sim/Streaming 2-D FIR Filter/Line Memory/Line Memory Controller/Read Control/Time 
-- Distance/Time Distanc
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Time_Distance IS
  PORT( inputPulse                        :   IN    std_logic;
        repeatPulse                       :   IN    std_logic;
        fromDistCounter                   :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        fromLastDist                      :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        toDistCounter                     :   OUT   std_logic_vector(8 DOWNTO 0);  -- ufix9
        toLastDist                        :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9
        );
END Time_Distance;


ARCHITECTURE rtl OF Time_Distance IS

  -- Signals
  SIGNAL fromDistCounter_unsigned         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL fromLastDist_unsigned            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL toDistCounter_tmp                : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL toLastDist_tmp                   : unsigned(8 DOWNTO 0);  -- ufix9

BEGIN
  fromDistCounter_unsigned <= unsigned(fromDistCounter);

  fromLastDist_unsigned <= unsigned(fromLastDist);

  Time_Distance_1_output : PROCESS (fromDistCounter_unsigned, fromLastDist_unsigned, inputPulse, repeatPulse)
    VARIABLE add_cast : signed(31 DOWNTO 0);
    VARIABLE add_temp : signed(31 DOWNTO 0);
    VARIABLE cast : unsigned(15 DOWNTO 0);
  BEGIN
    --WL = 8;
    IF (inputPulse OR repeatPulse) = '1' THEN 
      IF inputPulse = '1' THEN 
        toLastDist_tmp <= fromDistCounter_unsigned;
      ELSE 
        toLastDist_tmp <= fromLastDist_unsigned;
      END IF;
      toDistCounter_tmp <= to_unsigned(16#001#, 9);
    ELSE 
      IF fromDistCounter_unsigned < to_unsigned(16#000001E0#, 9) THEN 
        add_cast := signed(resize(fromDistCounter_unsigned, 32));
        add_temp := add_cast + 1;
        cast := unsigned(add_temp(15 DOWNTO 0));
        IF cast(15 DOWNTO 9) /= "0000000" THEN 
          toDistCounter_tmp <= "111111111";
        ELSE 
          toDistCounter_tmp <= cast(8 DOWNTO 0);
        END IF;
      ELSE 
        toDistCounter_tmp <= fromDistCounter_unsigned;
      END IF;
      toLastDist_tmp <= fromLastDist_unsigned;
    END IF;
  END PROCESS Time_Distance_1_output;


  toDistCounter <= std_logic_vector(toDistCounter_tmp);

  toLastDist <= std_logic_vector(toLastDist_tmp);

END rtl;

