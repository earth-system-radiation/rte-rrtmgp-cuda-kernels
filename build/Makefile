#!/usr/bin/env make
all:           librtecudakernels.a librrtmgpcudakernels.a

CUDAFLAGS ?= "-Xptxas -O3 -DNDEBUG -DRTE_RRTMGP_GPU_MEMPOOL_CUDA"
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
