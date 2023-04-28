DTFAG_dir 		:= ./DTFAG
ROMDATA_PATH 	:= ./$(DTFAG_dir)/ROM_DATA

#----------------ROM init---------------------
#include $(ROMDATA_PATH)/makefile
#export ROMDATA_PATH
ROM_data_init: 
	make -C $(ROMDATA_PATH) other-all

ROM_data_clean:
	make -C $(ROMDATA_PATH) other-clean

ROM_v:
	make -C $(ROMDATA_PATH) ROM0_all;
	make -C $(ROMDATA_PATH) ROM1_all;
	make -C $(ROMDATA_PATH) ROM2_all;

ROM_syn:
	make -C $(ROMDATA_PATH) ROM0_syn_all;
	make -C $(ROMDATA_PATH) ROM1_syn_all;
	make -C $(ROMDATA_PATH) ROM2_syn_all;
#--------------------------------------
rtl:
	irun test_FFTP.v +access+r +notimingchecks -loadpli1 debpli:novas_pli_boot

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