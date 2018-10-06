all: chip_z80 chip_6502

chip_6502:
	pypy translate.py

chip_z80:
	pypy translate_z80.py

clean:
	rm -f *~ *.pyc
