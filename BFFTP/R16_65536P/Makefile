root_dir 		:= $(PWD)
DTFAG_dir 		:= ./DTFAG

ROMDATA_PATH 	:= ./$(DTFAG_dir)/ROM_DATA
ROMDATA_v_PATH	:= ./$(DTFAG_dir)/ROM_v
ROMDATA_LIB_PATH:= ./$(DTFAG_dir)/ROM_LIB
rodsd_path   	:= /usr/cad/synopsys/CBDK_TSMC90GUTM_Arm_f1.0/CIC/Memory/rodsd/bin/rodsd
rom_word_size 	:= 64
bit_size      	:= 64
double_bit_size := 128
MUX       		:= 8
Freq     		:= 200
instnamerom0 = DTFAG_ROM0.txt
instnamerom1 = DTFAG_ROM1.txt
instnamerom2 = DTFAG_ROM2.txt
instnamerom3 = DTFAG_ROM3.txt
instnamerom4 = DTFAG_ROM4.txt
instnamerom5 = DTFAG_ROM5.txt
instnamerom6 = DTFAG_ROM6.txt
instnamerom7 = DTFAG_ROM7.txt

#----------------ROM init---------------------
#include $(ROMDATA_PATH)/makefile
#export ROMDATA_PATH
ROM_data_init: 
	make -C $(ROMDATA_PATH) other-all

ROM_data_clean:
	make -C $(ROMDATA_PATH) other-clean
#--------------------------------------
rtl:
	irun test_FFTP.v +access+r +notimingchecks -loadpli1 debpli:novas_pli_boot

# ROM generate
# RTL simulation
ROM_all: clean ROM0_gen ROM1_gen ROM2_gen ROM3_gen \
		ROM4_gen ROM5_gen ROM6_gen ROM7_gen

ROM0_gen:
	cd $(ROMDATA_PATH); \
	$(rodsd_path) verilog  -instname ROM0_$(rom_word_size)_$(bit_size) \
	-code_file $(instnamerom0) -mux $(MUX) -words $(rom_word_size) \
	-bits $(bit_size) -frequency $(Freq); \
	mv *.rcf $(ROMDATA_v_PATH);\
	mv *.v $(ROMDATA_v_PATH); 

nWave: 
	nWave &

clean:
	rm -rf INCA_libs \
	rm -rf nWaveLog \
	rm -rf novas.*
	rm -rf BSSLib.lib++
	rm -rf H_*.*
	rm -rf IFFTR0_*.*
	rm -rf IFFTR1_*.*
	rm -rf IFFTR2_*.*
	rm -rf IFFTR3_*.*
	rm -rf IFFTR4_*.*
	rm -rf IFFTR5_*.*
	rm -rf IFFTR6_*.*
	rm -rf IFFTR7_*.*
	rm -rf ireorderROM0_*.*
	rm -rf ireorderROM1_*.*
	rm -rf ireorderROM2_*.*
	rm -rf ireorderROM3_*.*
	rm -rf ireorderROM0.*
	rm -rf ireorderROM1.*
	rm -rf ireorderROM2.*
	rm -rf ireorderROM3.*
	rm -rf reorderROM0_*.*
	rm -rf reorderROM1_*.*
	rm -rf reorderROM2_*.*
	rm -rf reorderROM3_*.*
	rm -rf reorderROM0.*
	rm -rf reorderROM1.*
	rm -rf reorderROM2.*
	rm -rf reorderROM3.*
	rm -rf TWIpipe.v
	rm -rf TWIMux.v
	rm -rf Mux5.v 
	rm -rf Mux6.v 
	rm -rf BR.v
	rm -rf R16_BU_outpipe.v 
	rm -rf R16_orderROM_Pipe.v 
	rm -rf IReorderMA_pip.v
	rm -rf Rectrl.v
	rm -rf R16_InpipeReg.v 
	rm -rf MulMod.v
	rm -rf Mul.v
	rm -rf *.log
	rm -rf *.history
	rm -rf *.key