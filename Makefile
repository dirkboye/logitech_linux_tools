##################################################
## General configuration
## =====================

# Every Makefile should contain this line:
SHELL=/bin/sh

# Program for compiling C programs.
CC=gcc

# Extra flags to give to the C preprocessor and programs that use it (the C and
# Fortran compilers). 
CPPFLAGS=

# Extra flags to give to the C compiler (both at compiling and linking)
# Notice: `make CFLAGS='-g -O' will replace the value of CFLAGS given below
CFLAGS=-Wall -Wextra

# Add any custom flags required for this build before $(CFLAGS) below.
all_cflags=-lusb-1.0 --std=c99 $(CFLAGS)

# Extra flags to give compilers when invoking the linker, `ld'. 
LDFLAGS=-lusb-1.0


obj_mx=performance_mx_dpi.o

obj_unifying=unifying_pair.o

all: performance_mx_dpi unifying_pair ltunify

ltunify: ltunify.o
	$(CC) $^ -o $@

performance_mx_dpi: $(obj_mx)
	$(CC) $^ -o $@ $(LDFLAGS)

unifying_pair: $(obj_unifying)
	$(CC) $^ -o $@

performance_mx_dpi.o : performance_mx_dpi.c
	$(CC) -c $(CPPFLAGS) $(all_cflags) $< -o $@

unifying_pair.o: unifying_pair.c
	$(CC) -c $(CPPFLAGS) $< -o $@

ltunify.o: ltunify.c
	$(CC) -c $(CPPFLAGS) $< -o $@

clean:
	-rm -f *.o unifying_pair performance_mx_dpi ltunify
