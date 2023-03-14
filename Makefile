
sweeper:
	./halfvoid -g -C0 libs2 main.hv --vk vk.xml -o /tmp/out.ll
	clang -g /tmp/out.ll -o sweeper
.PHONY: sweeper
