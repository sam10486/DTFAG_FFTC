set company  "VLSILAB"
set designer "Shi-Yong Wu"
set search_path      ". /opt/CIC/share/CBDK_TSMC90GUTM_Arm_f1.0/CIC/SynopsysDC/db ../Mem_lib $search_path"
set target_library   "typical.db SRAM_SP_2048_128.db ROM0_4096_64.db ROM1_4096_128.db ROM2_4096_128.db ROM3_4096_128.db ROM4_4096_128.db ROM5_4096_128.db ROM6_4096_128.db ROM7_4096_128.db IFFTR0_4096_64.db IFFTR1_4096_128.db IFFTR2_4096_128.db IFFTR3_4096_128.db IFFTR4_4096_128.db IFFTR5_4096_128.db IFFTR6_4096_128.db IFFTR7_4096_128.db reorderROM0.db reorderROM1.db reorderROM2.db reorderROM3.db ireorderROM0.db ireorderROM1.db ireorderROM2.db ireorderROM3.db H_b0ROM0.db H_b0ROM1.db H_b0ROM2.db H_b0ROM3.db H_b0ROM4.db H_b0ROM5.db  H_b0ROM6.db H_b0ROM7.db H_b1ROM0.db H_b1ROM1.db H_b1ROM2.db H_b1ROM3.db H_b1ROM4.db H_b1ROM5.db  H_b1ROM6.db H_b1ROM7.db"
#set target_library  "slow.db fast.db"
set link_library     "* $target_library dw_foundation.sldb"
set symbol_library   "tsmc090.sdb generic.sdb"
set synthetic_library "dw_foundation.sldb"

set case_analysis_with_logic_constants true

set hdlin_translate_off_skip_text "TRUE"
#set hdlin_enable_presto_for_vhdl "TRUE"
set edifout_netlist_only "TRUE"
set verilogout_no_tri true
set plot_command {lpr -Plp}
set hdlin_auto_save_templates "TRUE"


#define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
#define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
#define_name_rules name_rule -map {{"\*cell\*" "cell"}}
#define_name_rules name_rule -case_insensitive

set view_script_submenu_items [list {Avoid assign statement} {set_fix_multiple_p
ort_nets -all -buffer_constant} {Change Naming Rule} {change_names -rule verilog
 -hierarchy} {Write SDF} {write_sdf -version 2.1 -context verilog chip.sdf}]

set hdlin_while_loop_iterations 2000

analyze -format verilog ../vlog/FFTP.v              
analyze -format verilog ../vlog/CenCtrl.v           
analyze -format verilog ../vlog/CLA4.v              
analyze -format verilog ../vlog/CLA16.v             
analyze -format verilog ../vlog/CLA16clg.v          
analyze -format verilog ../vlog/CLA32.v             
analyze -format verilog ../vlog/CLA32clg.v          
analyze -format verilog ../vlog/CLA64clg_co.v       
analyze -format verilog ../vlog/CLA64_co.v          
analyze -format verilog ../vlog/CLA65.v             
analyze -format verilog ../vlog/CLA65clg.v          
analyze -format verilog ../vlog/Ctrl_PipeReg1.v     
analyze -format verilog ../vlog/Mod192.v            
analyze -format verilog ../vlog/Mod192PD.v          
analyze -format verilog ../vlog/ModMux.v            
analyze -format verilog ../vlog/Mul64.v             
analyze -format verilog ../vlog/MulMod128.v         
analyze -format verilog ../vlog/MulMod128PD.v       
analyze -format verilog ../vlog/Mux1.v              
analyze -format verilog ../vlog/Mux2.v              
analyze -format verilog ../vlog/Mux3.v              
analyze -format verilog ../vlog/Mux4.v              
analyze -format verilog ../vlog/R16_AGU.v           
analyze -format verilog ../vlog/R16_DC.v            
analyze -format verilog ../vlog/R16_NPipeReg2.v     
analyze -format verilog ../vlog/R16_NPipeReg3.v     
analyze -format verilog ../vlog/R16_PipeReg2.v      
analyze -format verilog ../vlog/R16_PipeReg4.v      
analyze -format verilog ../vlog/R16_PipeReg4_2.v    
analyze -format verilog ../vlog/R16_ROMPipeReg1.v   
analyze -format verilog ../vlog/R16_WAddr.v         
analyze -format verilog ../vlog/R16_WD_buf.v        
analyze -format verilog ../vlog/BU_S0.v             
analyze -format verilog ../vlog/BU.v                
analyze -format verilog ../vlog/Pipe.v              
analyze -format verilog ../vlog/Radix16_Pipe.v      
analyze -format verilog ../vlog/Mux5.v
analyze -format verilog ../vlog/Mux6.v
analyze -format verilog ../vlog/BR.v
analyze -format verilog ../vlog/R16_BU_outpipe.v
analyze -format verilog ../vlog/R16_orderROM_Pipe.v
analyze -format verilog ../vlog/IReorderMA_pip.v
analyze -format verilog ../vlog/Rectrl.v
analyze -format verilog ../vlog/R16_InpipeReg.v
analyze -format verilog ../vlog/MulMod.v
analyze -format verilog ../vlog/Mul.v
analyze -format verilog ../vlog/TWIpipe.v
analyze -format verilog ../vlog/TWIMux.v
                                                    
elaborate FFTP -architecture verilog                
                                                    
current_design FFTP                                 
link                                                
uniquify                                            
set_operating_conditions -max typical -max_library typical -min typical -min_library typical    
#set_operating_conditions -max slow -max_library slow -min fast -min_library fast               
set_wire_load_mode segmented                                                                    
set_wire_load_model -name tsmc090_wl10 -library typical                                         
#set_wire_load_model -name tsmc090_wl10 -library slow                                           
create_clock -period 5 -waveform {0 2.5} [get_ports clk]
set_dont_touch_network [get_ports clk]                                                          
set_ideal_network [get_ports clk]                                                             
set_ideal_network [get_ports rst_n]                                                             
#set_dont_touch_network [get_ports rst_n]                                                       
                                                                                                
set_clock_uncertainty -setup 0.1 [get_clocks clk]                                               
set_drive [drive_of typical/DFFX2/Q] [remove_from_collection [all_inputs] [get_ports {clk}]]    
set_load [load_of typical/DFFX2/D] [all_outputs]                                                
#set_drive [drive_of slow/DFFX2/Q] [remove_from_collection [all_inputs] [get_ports {clk}]]      
#set_load [load_of slow/DFFX2/D] [all_outputs]                                                  
set_input_delay 0.2 -clock clk [remove_from_collection [all_inputs] [get_ports {clk}]]          
set_output_delay 0.2 -max -clock clk [all_outputs]                                              
set_fix_multiple_port_nets -all -buffer_constants                                               
#set_case_analysis 1 [get_ports rst_n]                                                          
#set_max_area 0                                                                                 
                                                                                                
#set_clock_gating_style -sequential_cell latch -max_fanout 3 -num_stage 1 -setup 0.3            
#-control_point before -control_signal se                                                       
#propagate_constraints -gate_clock                                                              
#insert_clock_gating -module                                                                    
#replace_clock_gates                                                                            
                                                                                                
#compile                                                                                        
                                                                                                
#compile -inc -map_effort high                                                                  
#compile -map_effort medium                                                                     
#compile -incremental_mapping -map_effort high -area_effort high -boundary_optimization         
#compile -incremental_mapping -map_effort high -area_effort high -boundary_optimization         
#compile -incremental_mapping -map_effort high -boundary_optimization                           
#compile_ultra -timing_high_effort_script                                                       
#compile_ultra -area_high_effort_script                                                         
#compile_ultra -no_autoungroup -timing_high_effort_script                                       
compile_ultra -no_autoungroup -area_high_effort_script                                          
                                                                                                
                                                                                                
remove_unconnected_ports -blast_buses [get_cells * -hier]                                       
change_names -rule verilog -hierarchy                                                           
#set bus_inference_style {%s[%d]}                                                               
#set bus_naming_style {%s[%d]}                                                                  
#set hdlout_internal_busses true                                                                
#change_names -hierarchy -rule verilog                                                          
#define_name_rules name_rule -allowed "A-Z a-z 0-9 _"-max_length 255 -type cell
#define_name_rules name_rule -allowed "A-Z a-z 0-9 _[]"-max_length 255 -type net
#define_name_rules name_rule -map {{"\*cell\*" "cell"}}
#define_name_rules name_rule -case_insensitive                                                  
#change_names -hierarchy -rule name_rule                                                        
                                                                                                
                                                                                                
write -format verilog -hierarchy -output ../gate_netlist/FFTP_pipe_syn.v                        
write_sdf -version 2.1 -context verilog ../gate_netlist/FFTP_pipe.sdf                           
write -format ddc -hierarchy -output ../gate_netlist/FFTP_pipe.ddc                              
write_sdc -version 1.7 ../gate_netlist/FFTP_pipe.sdc                                            
write_parasitics -output ../gate_netlist/FFTP_pipe.spef                                         
                                                                                                
                                                                                                
report_timing -max_paths 20  > ../reports/FFTP_pipe_timing.rpt                                  
report_area > ../reports/FFTP_pipe_area.rpt                                                     
report_power > ../reports/FFTP_pipe_power.rpt                                                   
report_area -hier > ../reports/FFTP_pipe_area_hier.rpt                                          
                                                                                                
exit                                                                                            
