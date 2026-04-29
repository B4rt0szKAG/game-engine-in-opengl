# Kompilator
CC = g++

# Flagi kompilatora (dodajemy katalog include, by widział pliki nagłówkowe GLAD)
CFLAGS = -Wall -I./include

# Automatyczne wykrywanie systemu operacyjnego dla odpowiednich flag linkera
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Linux)
    # Flagi dla Linuxa
    LDFLAGS = -lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl -lm
else
    # Flagi dla Windowsa (MinGW)
    LDFLAGS = -lglfw3 -lgdi32 -lopengl32 -lm
endif

# Pliki źródłowe
SRC = src/main.c src/glad.c

# Nazwa pliku wykonywalnego
TARGET = app

# Domyślny cel
all: $(TARGET)

# Reguła budowania
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)
test:
	$(CC) src/main.cpp -o $(TARGET)

# Czyszczenie
clean:
	rm -f $(TARGET) $(TARGET).exe
