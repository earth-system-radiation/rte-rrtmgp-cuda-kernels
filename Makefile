#
# Top-level Makefile
#
.PHONY: libs tests check docs
all: libs tests check docs

libs:
	make -C build -j

clean:
	make -C build clean
