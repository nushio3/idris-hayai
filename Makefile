all: sum-hs sum-idr

sum-hs:
	ghc --make -O2 sum.hs -o sum-hs

sum-idr:
	idris sum.idr -o sum-idr

sum-idr-prof:
	cd rts_orig/ && make
	idris sum.idr -S -o sum-idr.c
	gcc -pg -O2 -o sum-idr-prof sum-idr.c ./rts_orig/idris_main.c -I./rts_orig -pthread -lgmp

clean:
	cd rts_orig/ && make clean
	rm -f sum-idr sum-hs sum.ibc sum-idr.c sum-idr.o
