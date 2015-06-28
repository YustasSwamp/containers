PREFIX =
BINDIR = ${PREFIX}/bin
DESTDIR =

CC = gcc
CFLAGS = -g -std=gnu99 -Os -Wall -Wextra

BINARIES = inject contain pseudo 

all: ${BINARIES}

contain: contain.o console.o map.o mount.o util.o

inject: inject.o map.o util.o

pseudo: pseudo.o map.o util.o

clean:
	rm -f -- ${BINARIES} tags *.o

install: ${BINARIES}
	mkdir -p ${DESTDIR}${BINDIR}
	install -s ${BINARIES} ${DESTDIR}${BINDIR}

uninstall:
	rm -f $(addprefix ${DESTDIR}${BINDIR}/, ${BINARIES})

tags:
	ctags -R

.PHONY: all clean install uninstall tags
