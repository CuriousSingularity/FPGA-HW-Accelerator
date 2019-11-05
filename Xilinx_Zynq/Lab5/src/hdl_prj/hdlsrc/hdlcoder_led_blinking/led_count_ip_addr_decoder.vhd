-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\hdlcoder_led_blinking\led_count_ip_addr_decoder.vhd
-- Created: 2019-05-28 10:43:42
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: led_count_ip_addr_decoder
-- Source Path: led_count_ip/led_count_ip_axi_lite/led_count_ip_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY led_count_ip_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_Read_back                    :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_Blink_frequency             :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        write_Blink_direction             :   OUT   std_logic;  -- ufix1
        write_In1                         :   OUT   std_logic  -- ufix1
        );
END led_count_ip_addr_decoder;


ARCHITECTURE rtl OF led_count_ip_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_ip_timestamp          : std_logic;  -- ufix1
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_Read_back_unsigned          : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL decode_sel_Read_back             : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Read_back               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL data_in_Read_back                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Read_back              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL decode_sel_Blink_frequency       : std_logic;  -- ufix1
  SIGNAL reg_enb_Blink_frequency          : std_logic;  -- ufix1
  SIGNAL data_in_Blink_frequency          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL write_reg_Blink_frequency        : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL decode_sel_Blink_direction       : std_logic;  -- ufix1
  SIGNAL reg_enb_Blink_direction          : std_logic;  -- ufix1
  SIGNAL data_in_Blink_direction          : std_logic;  -- ufix1
  SIGNAL write_reg_Blink_direction        : std_logic;  -- ufix1
  SIGNAL decode_sel_In1                   : std_logic;  -- ufix1
  SIGNAL reg_enb_In1                      : std_logic;  -- ufix1
  SIGNAL data_in_In1                      : std_logic;  -- ufix1
  SIGNAL write_reg_In1                    : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_ip_timestamp <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  const_1 <= '1';

  enb <= const_1;

  read_Read_back_unsigned <= unsigned(read_Read_back);

  
  decode_sel_Read_back <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_ip_timestamp_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_ip_timestamp <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp <= const_0 WHEN decode_sel_ip_timestamp = '0' ELSE
      read_reg_ip_timestamp;

  reg_Read_back_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        read_reg_Read_back <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        read_reg_Read_back <= read_Read_back_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Read_back_process;


  data_in_Read_back <= resize(read_reg_Read_back, 32);

  
  decode_rd_Read_back <= decode_rd_ip_timestamp WHEN decode_sel_Read_back = '0' ELSE
      data_in_Read_back;

  data_read <= std_logic_vector(decode_rd_Read_back);

  
  decode_sel_axi_enable <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable <= decode_sel_axi_enable AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  reg_axi_enable_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_axi_enable <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable = '1' THEN
        write_reg_axi_enable <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_process;


  write_axi_enable <= write_reg_axi_enable;

  
  decode_sel_Blink_frequency <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_Blink_frequency <= decode_sel_Blink_frequency AND wr_enb;

  data_in_Blink_frequency <= data_write_unsigned(3 DOWNTO 0);

  reg_Blink_frequency_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_Blink_frequency <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' AND reg_enb_Blink_frequency = '1' THEN
        write_reg_Blink_frequency <= data_in_Blink_frequency;
      END IF;
    END IF;
  END PROCESS reg_Blink_frequency_process;


  write_Blink_frequency <= std_logic_vector(write_reg_Blink_frequency);

  
  decode_sel_Blink_direction <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_Blink_direction <= decode_sel_Blink_direction AND wr_enb;

  data_in_Blink_direction <= data_write_unsigned(0);

  reg_Blink_direction_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_Blink_direction <= '0';
      ELSIF enb = '1' AND reg_enb_Blink_direction = '1' THEN
        write_reg_Blink_direction <= data_in_Blink_direction;
      END IF;
    END IF;
  END PROCESS reg_Blink_direction_process;


  write_Blink_direction <= write_reg_Blink_direction;

  
  decode_sel_In1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  reg_enb_In1 <= decode_sel_In1 AND wr_enb;

  data_in_In1 <= data_write_unsigned(0);

  reg_In1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        write_reg_In1 <= '0';
      ELSIF enb = '1' AND reg_enb_In1 = '1' THEN
        write_reg_In1 <= data_in_In1;
      END IF;
    END IF;
  END PROCESS reg_In1_process;


  write_In1 <= write_reg_In1;

END rtl;
