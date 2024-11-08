#!/usr/bin/env make
all:           librtecudakernels.a librrtmgpcudakernels.a

CUDAFLAGS ?= "-O3 -gopt -DRTE_RRTMGP_GPU_MEMPOOL_CUDA -acc -cuda"
COMPILE_CU = $(CUDACXX) -c $(CUDAFLAGS)


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
