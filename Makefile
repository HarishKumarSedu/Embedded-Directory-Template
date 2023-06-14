
BASE := $(CURDIR)

SUBDIRS := app 

CFLAGS := -I$(BASE)/inc -Wall

CROSS_COMPILE:=arm-none-eabi-

CC=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)gcc
AR=$(CROSS_COMPILE)ar
OBJCOPY=$(CROSS_COMPILE)objcopy

ifeq ($(OS),Windows_NT)
  RM = cmd /C del /Q /F
else
  RM = rm -f
endif

LDFLAGS += -march=armv7-m -mabi=aapcs
LDFLAGS += -nostartfiles -nostdlib -lgcc
LDFLAGS += -Tlinker.ld
LDFLAGS += -lapp -Lapp/ 
# LDFLAGS += -ldrivers -Ldrivers/
HEX := test.hex
EXE := test

OBJS := main.o startup.o
LIBS := $(LIBAPP) -Lapp

export CC LD AR RM LDFLAGS CFLAGS

all: $(foreach s,$(SUBDIRS),all-$(s)) $(HEX)

all-%:
	make -C $* all

clean-%:
	make -C $* clean

%.hex: %
	$(OBJCOPY) -Ielf32-littlearm -Oihex $< $@

$(EXE): $(OBJS)
	$(LD) -Wl,--start-group $(LDFLAGS) -o $@ $+ -Wl,--end-group

clean: subdirs-clean
	$(RM) $(EXE) main.o startup.o

subdirs-clean: $(foreach s,$(SUBDIRS),clean-$(s))

clean-%:
	make -C $* clean