.PHONY: all clean run quisp/%

ifneq (${VIRTUAL_ENV},quisp)
$(error Get inside the QUISP virtual environment with `source setenv`)
endif

MODE?=release

all clean: quisp/Makefile
	make -C quisp MODE=${MODE} $@

quisp/quisp: quisp/Makefile
	make -C quisp MODE=release all

quisp/quisp_dbg: quisp/Makefile
	make -C quisp MODE=debug all

quisp/Makefile: quisp/makemakefiles
	make -C quisp -f makemakefiles all

run: quisp/quisp
	cd quisp && \
		./quisp -m -u Qtenv -n . networks/omnetpp.ini