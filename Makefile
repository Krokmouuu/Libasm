# Nom de la bibliothèque et programme principal
TARGET = libasm.a
EXEC = test_program

# Compilateur et assembleur
CC = gcc
ASM = nasm

# Options de compilation
CFLAGS = -Wall -Wextra -g
ASMFLAGS = -f elf64  # Pas besoin de -fPIC avec nasm

# Répertoires
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Fichiers sources et objets
ASM_SOURCES = $(wildcard $(SRC_DIR)/*.s)
ASM_OBJECTS = $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(ASM_SOURCES))

# Règles
all: $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(ASM_OBJECTS)
	mkdir -p $(BIN_DIR)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	mkdir -p $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

$(EXEC): $(BIN_DIR)/$(TARGET) main.c
	$(CC) $(CFLAGS) -o $@ main.c -L$(BIN_DIR) -lasm -no-pie

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(EXEC)

rebuild: clean all

run: $(EXEC)
	./$(EXEC)

.PHONY: all clean rebuild run
