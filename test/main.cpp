#include <iostream>

#include "Vmain.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {

	Verilated::commandArgs(argc,argv);
	Vmain * top = new Vmain;

	while(!Verilated::gotFinish()) {
		top->eval();
	}

	delete top;

	return 0;
}
