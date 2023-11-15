

ifeq ($(tracy),yes)
	trc := -tracy
endif

sweeper:
	./halfvoid -g $(trc) -C0 libs2 -C1 Source --vk vk.xml -o /tmp/out.ll -cache /tmp/MSCache.zip
	clang -g /tmp/out.ll -lm -o sweeper
sweeper_release:
	./halfvoid $(trc) -C0 libs2 -C1 Source --vk vk.xml -o /tmp/out.ll -cache /tmp/MSCache.zip
	clang -s -Os /tmp/out.ll -lm -o sweeper
win.exe:
	./halfvoid -win32 -emulate-tls -g -C0 libs2 -C1 Source --vk vk.xml -o /tmp/out.ll
	clang  --target=x86_64-w64-mingw32-gnu -s /tmp/out.ll -mwindows -o win.exe
win2.exe:
	./halfvoid.exe -C0 libs2 -C1 Source/ --vk vk.xml -o out.ll
	clang -mwindows -femulated-tls -static -O2 -g out.ll -o win.exe
SizeCheck:
	nm --print-size --size-sort --radix=d --reverse-sort ./sweeper  | less
.PHONY: sweeper win.exe win2.exe
