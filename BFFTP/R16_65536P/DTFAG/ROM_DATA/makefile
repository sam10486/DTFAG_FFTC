
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
	$(BIN)/main 
	@echo "-----------generate completed----------------"

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
	