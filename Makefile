
sweeper:
	./halfvoid -g -C0 libs2 -C1 Source --vk vk.xml -o /tmp/out.ll
	clang -g /tmp/out.ll -o sweeper
win.exe:
	./halfvoid -win32 -g -C0 libs2 -C1 Source --vk vk.xml -o /tmp/out.ll
	clang  --target=x86_64-w64-mingw32-gnu -g /tmp/out.ll -mwindows -o win.exe
win2.exe:
	./halfvoid_win.exe -g -C0 libs2 main.hv --vk vk.xml -o out.ll
	clang -mwindows -static -O2 -g out.ll -o win.exe
SizeCheck:
	nm --print-size --size-sort --radix=d ./sweeper  | less
.PHONY: sweeper win.exe
