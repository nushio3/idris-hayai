all: sum-hs sum-idr

sum-hs:
	ghc --make -O2 sum.hs -o sum-hs

sum-idr:
	idris sum.idr -o sum-idr

clean:
	rm -f sum-idr sum-hs sum.ibc
