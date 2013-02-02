all:
	ghc --make -O2 sum.hs -o sum-hs
	idris sum.idr -o sum-idr
