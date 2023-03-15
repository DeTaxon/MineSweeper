
sweeper:
	./halfvoid -g -C0 libs2 main.hv --vk vk.xml -o /tmp/out.ll
	clang -g /tmp/out.ll -o sweeper
win.exe:
	./halfvoid -win32 -g -C0 libs2 main.hv --vk vk.xml -o /tmp/out.ll
	clang  --target=x86_64-w64-mingw32-gnu -g /tmp/out.ll -o win.exe
.PHONY: sweeper win.exe
