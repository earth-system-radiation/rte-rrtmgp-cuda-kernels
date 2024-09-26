#!/usr/bin/env make

#
# Compiler variables FC, FCFLAGS must be set in the environment
#
# Make all the libraries though we'll only use the interface + kernels
all:           librtecudakernels.a librrtmgpcudakernels.a

COMPILE = $(FC) $(FCFLAGS) $(FCINCLUDE) -c
%.o: %.F90
	$(COMPILE) $<

COMPILE_CU = $(CXX) -c -std=c++17 -O3 -gopt -DRTE_RRTMGP_GPU_MEMPOOL_CUDA -acc -cuda

%.o: %.cu
	$(COMPILE_CU) $<

include ../src/Make.depends

VPATH = ../src

librtecudakernels.a: $(RTE_CUDA_KERNELS)
	ar -rvs librtecudakernels.a $(RTE_CUDA_KERNELS)

librrtmgpcudakernels.a: $(RRTMGP_CUDA_KERNELS)
	ar -rvs librrtmgpcudakernels.a $(RRTMGP_CUDA_KERNELS)

clean:
	rm -f *.optrpt *.mod *.o lib*.a
