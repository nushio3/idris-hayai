all: sum-hs sum-idr

sum-hs:
	ghc --make -O2 sum.hs -o sum-hs

sum-idr:
	idris sum.idr -o sum-idr

sum-idr-prof:
	cd rts_orig/ && make
	idris sum.idr -S -o sum-idr.c
	cat sum-idr.c ./rts_orig/idris_main.c > sum-idr-main.c
	gcc -pg -O2 -o sum-idr-prof sum-idr-main.c ./rts_orig/libidris_rts.a -I./rts_orig -pthread -lgmp

clean:
	cd rts_orig/ && make clean
	rm -f sum-idr sum-idr-prof sum-hs
	rm -f sum.ibc sum-idr.c sum-idr.o sum-idr-main.c
	rm -f gmon.out
