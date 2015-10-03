TARGET = psp2shell
OBJS   = main.o draw.o font_data.o ftp.o

LIBS = -lSceDisplay_stub -lSceGxm_stub -lSceCtrl_stub -lSceNet_stub -lSceNetCtl_stub

PREFIX = arm-vita-eabi
CC = $(PREFIX)-gcc
READELF = $(PREFIX)-readelf
OBJDUMP = $(PREFIX)-objdump
CFLAGS = -Wall -O2 -mcpu=cortex-a9 -mthumb
ASFLAGS = $(CFLAGS)

all: clean $(TARGET)

.PHONY: $(TARGET)
$(TARGET): out/$(TARGET).elf
	$(PREFIX)-strip -g $<
	vita-elf-create out/$(TARGET).elf out/$(TARGET).velf

out/$(TARGET).elf: $(OBJS)
	mkdir -p out
	$(CC) -Wl,-q $(OBJS) $(LIBS) -o $@

bin/%.o: src/%.c
	mkdir -p bin
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf out/$(TARGET).elf out/$(TARGET).velf $(OBJS)
