
all: parser
	./parser expression.txt exp.txt


parser:calc.l calc.y
	flex calc.l
	bison -d calc.y
	gcc lex.yy.c calc.tab.c -o parser -lm 
	

clean:
	rm -f parser lex.yy.c parser.tab.c parser.tab.h