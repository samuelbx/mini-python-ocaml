
all: minipython.exe
	./minipython.exe --debug test.py
	clang -no-pie -g test.s --target=x86_64-unknown-linux-gnu test.s -o ./a.out -v && ./a.out
# gcc -no-pie -g test.s && ./a.out

minipython.exe:
	dune build minipython.exe

clean:
	dune clean

.PHONY: all clean minipython.exe



