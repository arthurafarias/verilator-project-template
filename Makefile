mkfile_path	:= $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir	:= $(dir $(mkfile_path))

.PHONY: prebuild build test clean

all: build

test:
	build/Vmain

build: prebuild
	make -C build -f Vmain.mk Vmain
prebuild:
	cd $(mkfile_dir)/third-party/verilator && autoconf && ./configure
	make -C $(mkfile_dir)/third-party/verilator
	VERILATOR_ROOT=$(mkfile_dir)/third-party/verilator verilator --Mdir $(mkfile_dir)/build --cc -Wall $(mkfile_dir)/src/main.v --exe $(mkfile_dir)/test/main.cpp
clean:
	rm -rf $(mkfile_dir)/build