IDRIS_DIR=$(shell echo ${HOME}/.cabal/share/idris-*/)

all: sum-hs sum-idr

sum-hs:
	ghc --make -O2 sum.hs -o sum-hs

sum-idr:
	idris sum.idr -o sum-idr

sum-gen-idr:
	idris sum-gen.idr -o sum-gen-idr

sum-idr-prof:
	cd rts_orig/ && make
	idris sum.idr -S -o sum-idr.c
	gcc -pg -O2 -c sum-idr.c -I${IDRIS_DIR}/rts
	gcc -o sum-idr-prof sum-idr.o rts_orig/libidris_rts.a -pthread -lgmp

clean:
	cd rts_orig/ && make clean
	rm -f sum-idr sum-hs sum.ibc sum-idr.c sum-idr.o
