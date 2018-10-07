VSRC = ../../verilog/test_z80.v\
       ../../verilog/chip_z80.v\
       ../../verilog/clocks_6502.v\
       ../../verilog/ram_6502.v\
       ../../verilog/models.v

VFLAGS = -Wall

test_allasm:
	iverilog $(VFLAGS) -DW=6 -DMAXTICKS=10000000 -DHALFCYCLE=25 -DDISPLAY_WRITES -DCODE=\"nop.bin\" -DCODE_START=0 -DRESET=4000 -I../../verilog $(VSRC)

clean:
	rm -f a.out *.lxt
