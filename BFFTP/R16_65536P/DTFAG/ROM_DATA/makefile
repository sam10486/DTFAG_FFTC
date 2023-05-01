include mkflags_ROM.mk

SRC 	:= ./$(ROMDATA_PATH)/src
OBJ 	:= ./$(ROMDATA_PATH)/obj
INC 	:= ./$(ROMDATA_PATH)/include
UTIL	:= $(SRC)/behavior_code
BIN		:= ./$(ROMDATA_PATH)/bin

SOURCE 		:= $(wildcard $(SRC)/*.cc)
OBJS 		:= $(patsubst %.cc, $(OBJ)/%.o, $(notdir $(SOURCE)))
MAIN_SOURCE	:= $(wildcard $(UTIL)/*.cc)
MAIN_OBJS	:= $(patsubst %.cc, $(OBJ)/%.o, $(notdir $(MAIN_SOURCE)))

CC = g++
CFLAGS = -g -Wall

LIBS	:= -lntl -lgmp -lm -pthread
INCLUDE	:= -I $(INC)
TARGET	:= $(BIN)/main

other-all: main #$(TARGET)

$(MAIN_OBJS):$(OBJ)/%.o: $(UTIL)/%.cc
	$(CC) -c $< -o $@ $(INCLUDE)

$(OBJS):$(OBJ)/%.o: $(SRC)/%.cc
	$(CC) -c $< -o $@ $(INCLUDE)


$(TARGET): $(MAIN_OBJS) $(OBJS) 
	$(CC) -o $@ $(MAIN_OBJS) $(OBJS) $(LIBS)

main: $(TARGET)
	@echo "------generate ROM test and golden data------"
	./$(BIN)/main 
	@echo "-----------generate completed----------------"



#-------------ROM v code generate---------------------

## ROM0 gen
ROM0_all: ROM0_clean ROM0_B0_gen ROM0_B1_gen 

ROM0_clean:
	rm -rf $(ROM0_PATH)/$(ROM0_DATA_v_PATH)/*.*

ROM0_B0_gen:
	cd $(ROM0_PATH); \
	$(rodsd_path) verilog  -instname ROM0_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM0_B0) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM0_DATA_v_PATH); \
	mv *.v $(ROM0_DATA_v_PATH); 

ROM0_B1_gen:
	cd $(ROM0_PATH); \
	$(rodsd_path) verilog  -instname ROM0_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM0_B1) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM0_DATA_v_PATH); \
	mv *.v $(ROM0_DATA_v_PATH); 


## ROM1 gen
ROM1_all: ROM1_clean ROM1_B0_gen ROM1_B1_gen 

ROM1_clean:
	rm -rf $(ROM1_PATH)/$(ROM1_DATA_v_PATH)/*.*

ROM1_B0_gen:
	cd $(ROM1_PATH); \
	$(rodsd_path) verilog  -instname ROM1_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM1_B0) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM1_DATA_v_PATH); \
	mv *.v $(ROM1_DATA_v_PATH); 

ROM1_B1_gen:
	cd $(ROM1_PATH); \
	$(rodsd_path) verilog  -instname ROM1_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM1_B1) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM1_DATA_v_PATH); \
	mv *.v $(ROM1_DATA_v_PATH); 

	
## ROM2 gen
ROM2_all: ROM2_clean ROM2_B0_gen ROM2_B1_gen 

ROM2_clean:
	rm -rf $(ROM2_PATH)/$(ROM2_DATA_v_PATH)/*.*

ROM2_B0_gen:
	cd $(ROM2_PATH); \
	$(rodsd_path) verilog  -instname ROM2_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM2_B0) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM2_DATA_v_PATH); \
	mv *.v $(ROM2_DATA_v_PATH); 

ROM2_B1_gen:
	cd $(ROM2_PATH); \
	$(rodsd_path) verilog  -instname ROM2_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM2_B1) -mux $(MUX) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq); \
	mv *.rcf $(ROM2_DATA_v_PATH); \
	mv *.v $(ROM2_DATA_v_PATH); 

#-----------------------------------------------------

#--------------------ROM syn------------------
# ROM0
ROM0_syn_all: ROM0_syn_clean ROM0_B0_syn ROM0_B1_syn 

ROM0_syn_clean:
	rm -rf $(ROM0_PATH)/$(ROM0_DATA_LIB_PATH)/*.*

ROM0_B0_syn:
	cd $(ROM0_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM0_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM0_B0) -mux $(MUX) -libname ROM0_B0_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM0_DATA_LIB_PATH); \
	cd $(ROM0_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 

ROM0_B1_syn:
	cd $(ROM0_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM0_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM0_B1) -mux $(MUX) -libname ROM0_B1_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM0_DATA_LIB_PATH); \
	cd $(ROM0_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 


# ROM1
ROM1_syn_all: ROM1_syn_clean ROM1_B0_syn ROM1_B1_syn 

ROM1_syn_clean:
	rm -rf $(ROM1_PATH)/$(ROM1_DATA_LIB_PATH)/*.*

ROM1_B0_syn:
	cd $(ROM1_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM1_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM1_B0) -mux $(MUX) -libname ROM1_B0_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM1_DATA_LIB_PATH); \
	cd $(ROM1_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 

ROM1_B1_syn:
	cd $(ROM1_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM1_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM1_B1) -mux $(MUX) -libname ROM1_B1_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM1_DATA_LIB_PATH); \
	cd $(ROM1_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 


# ROM2
ROM2_syn_all: ROM2_syn_clean ROM2_B0_syn ROM2_B1_syn 

ROM2_syn_clean:
	rm -rf $(ROM2_PATH)/$(ROM2_DATA_LIB_PATH)/*.*

ROM2_B0_syn:
	cd $(ROM2_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM2_B0_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM2_B0) -mux $(MUX) -libname ROM2_B0_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM2_DATA_LIB_PATH); \
	cd $(ROM2_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 

ROM2_B1_syn:
	cd $(ROM2_PATH) ; \
	$(rodsd_path) synopsys  -instname ROM2_B1_$(rom_word_size)_$(double_bit_size) \
	-code_file $(instnamerom_ROM2_B1) -mux $(MUX) -libname ROM2_B1_$(rom_word_size)_$(double_bit_size) -words $(rom_word_size) \
	-bits $(double_bit_size) -frequency $(Freq);\
	mv *.lib $(ROM2_DATA_LIB_PATH); \
	cd $(ROM2_DATA_LIB_PATH); \
	rm -rf *_ss_*.lib; \
	rm -rf *_ff_*.lib; 

#-----------------------------------------------------------
.PHONY: other-clean


other-clean:
	rm -rf $(TARGET)
	rm -rf $(OBJ)/*.o
	rm -rf $(BIN)/*.exe
	rm -rf $(BIN)/main
	rm -rf *.txt
	rm -rf ./$(ROMDATA_PATH)/ROM0/*.txt
	rm -rf ./$(ROMDATA_PATH)/ROM1/*.txt
	rm -rf ./$(ROMDATA_PATH)/ROM2/*.txt
	rm -rf ./$(ROMDATA_PATH)/ROM_golden/*.txt
	rm -rf $(ROM0_PATH)/$(ROM0_DATA_v_PATH)/*.*
	rm -rf $(ROM1_PATH)/$(ROM1_DATA_v_PATH)/*.*
	rm -rf $(ROM2_PATH)/$(ROM2_DATA_v_PATH)/*.*
	rm -rf $(ROM0_PATH)/$(ROM0_DATA_LIB_PATH)/*.*
	rm -rf $(ROM1_PATH)/$(ROM1_DATA_LIB_PATH)/*.*
	rm -rf $(ROM2_PATH)/$(ROM2_DATA_LIB_PATH)/*.*