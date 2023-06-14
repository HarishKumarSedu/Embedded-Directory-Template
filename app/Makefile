
LIBAPP_OBJS := test.o \
			   test2.o
LIBAPP := libapp.a

all: $(LIBAPP)

$(LIBAPP): $(LIBAPP_OBJS)
	$(AR) rs $@ $+

clean:
	$(RM) *.o *.a