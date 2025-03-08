all :
	 bison -d -v parser.y
	 flex lexer.lex
	 g++ lex.yy.c parser.tab.c -lfl

clean :
	rm -f lex.yy.c parser.tab.c parser.tab.h parser parser.output
