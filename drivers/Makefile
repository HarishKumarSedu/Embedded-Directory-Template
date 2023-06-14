DRIVERS_OBJS := test1.o
DRIVERS := libdrivers.a

all: $(DRIVERS)

$(DRIVERS): $(DRIVERS_OBJS)
	$(AR) rs $@ $+

clean:
	$(RM) *.o *.a