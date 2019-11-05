#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/Installations/Xilinx/SDK/2018.2/bin;D:/Installations/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/nt64;D:/Installations/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/nt64:D:/Installations/Xilinx/Vivado/2018.2/bin
else
  PATH=D:/Installations/Xilinx/SDK/2018.2/bin;D:/Installations/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/nt64;D:/Installations/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/nt64:D:/Installations/Xilinx/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='D:/HDA/2_sem/DesignAndTestOfMicroelectronics/Lab/Lab3/Streaming_2_D_FIR_Filter_fil/fpgaproj/Streaming_2_D_FIR_Filter_fil.runs/jtag_mac_fifo_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log jtag_mac_fifo.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source jtag_mac_fifo.tcl