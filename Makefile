CC=mipsel-gcc
CFLAGS=-static

all:
	mkdir tmp/
	$(CC) src/clear.c -o bin/clear $(CFLAGS)
	$(CC) src/texor.c -o bin/texor $(CFLAGS)
	$(CC) src/xxd.c -o bin/xxd $(CFLAGS)
	$(CC) src/TinyBASIC.c -o bin/TinyBASIC -lm $(CFLAGS)
	$(CC) -DPOSIX -O  -c src/gproto.c -o tmp/gproto.o $(CFLAGS)
	$(CC) -DPOSIX -O  -c src/gkermit.c -o tmp/gkermit.o $(CFLAGS)
	$(CC) -DPOSIX -O  -c src/gunixio.c -o tmp/gunixio.o $(CFLAGS)
	$(CC) -DPOSIX -O  -c src/gcmdline.c -o tmp/gcmdline.o $(CFLAGS)
	$(CC) -o bin/gkermit tmp/gproto.o tmp/gkermit.o tmp/gunixio.o tmp/gcmdline.o $(CFLAGS)
	rm -r tmp/

clean:
	rm -f bin/*
	rm -fr tmp/
