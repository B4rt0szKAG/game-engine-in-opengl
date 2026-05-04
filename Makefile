CXX = g++

CXXFLAGS = -I./include

LDFLAGS =  -lglfw -lGL -lm

SRC = src/main.cpp src/glad.c

TARGET = app

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(SRC) -o $(TARGET) $(CXXFLAGS) $(LDFLAGS)

clean:
	rm -f $(TARGET) $(TARGET).exe
