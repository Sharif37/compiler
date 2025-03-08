CC = gcc
CFLAGS = -Wall -g
LEX = flex
YACC = bison

all: binary_exponentiation_parser

binary_exponentiation_parser: src/main.o src/calc.tab.o src/calc.yy.o
	$(CC) $(CFLAGS) -o binary_exponentiation_parser src/main.o src/calc.tab.o src/calc.yy.o

src/calc.tab.c: src/calc.y
	$(YACC) -d src/calc.y

src/calc.yy.c: src/calc.l
	$(LEX) src/calc.l

clean:
	rm -f src/*.o src/calc.tab.c src/calc.tab.h src/calc.yy.c binary_exponentiation_parser

.PHONY: all clean