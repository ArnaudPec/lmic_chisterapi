TARGET=OTAA_JoinAndTransmit

CC=g++
RM=rm -f
CFLAGS=-I lib/lmic
LDFLAGS=-lwiringPi

SRC=$(wildcard src/*.c)
OBJ=$(SRC:%.c=%.o)

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJ)
	cd lib/lmic && $(MAKE)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) lib/lmic/*.o $(LDFLAGS)

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJ)
	cd lib/lmic && make clean
