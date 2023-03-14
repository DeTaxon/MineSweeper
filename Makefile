
sweeper:
	./halfvoid -C0 libs2 -C1 Source main.hv -o /tmp/out.ll
	clang -g /tmp/out.ll -o sweeper
.PHONY: sweeper
