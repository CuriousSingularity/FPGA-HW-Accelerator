# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.cache/wt} [current_project]
set_property parent.project_path {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:0.9 [current_project]
set_property ip_cache_permissions disable [current_project]
read_vhdl -library xil_defaultlib {
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/Camera_Clock_Generator.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/HDMI.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/Img_Generator.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/Pixel_Generator.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/sources_1/new/capture_logic.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/sources_1/imports/src/frame_buffer.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/i2c_sender.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/sources_1/imports/src/i2c_sender_cam.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/sources_1/imports/src/ov7670_controller.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/sources_1/imports/src/ov7670_registers.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/vga_controller.vhd}
  {H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/imports/src/Camera_Emulator.vhd}
}
read_ip -quiet {{H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/ip/Dual_Port_BRAM_1/Dual_Port_BRAM_1.xci}}
set_property used_in_implementation false [get_files -all {{h:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/ip/Dual_Port_BRAM_1/Dual_Port_BRAM_1_ooc.xdc}}]

read_ip -quiet {{H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/ip/Dual_Port_BRAM/Dual_Port_BRAM.xci}}
set_property used_in_implementation false [get_files -all {{h:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/sources_1/ip/Dual_Port_BRAM/Dual_Port_BRAM_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/constrs_1/imports/Camera_Emulator/video_project_constraints.xdc}}
set_property used_in_implementation false [get_files {{H:/student job/Lab work/lab3/Camera_Emulation_Project_v2_lab3/Camera_Emulation_Project_v2_lab3.srcs/constrs_1/imports/Camera_Emulator/video_project_constraints.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Camera_Emulator -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Camera_Emulator.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Camera_Emulator_utilization_synth.rpt -pb Camera_Emulator_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
