all :
	 bison -d -v parser.y
	 flex lexer.lex
	 g++ lex.yy.c parser.tab.c -lfl

.PHONY: problem1
problem1 :
	 flex problem1.l
	 gcc lex.yy.c -o problem1 -lfl
	 ./problem1 input.txt

.PHONY: problem2
problem2 :
	 bison -d -v problem2.y	
	 flex problem2.l
	 gcc problem2.tab.c lex.yy.c -o problem2 -lm
	 ./problem2 
	 
.PHONY: problem3
problem3 :
	 bison -d -v problem3.y	
	 flex problem3.l
	 gcc problem3.tab.c lex.yy.c -o problem3 -lm
	 ./problem3
.PHONY: problem4
problem4 :
	 bison -d -v problem4.y	
	 flex problem4.l
	 gcc problem4.tab.c lex.yy.c -o problem4 -lm
	 ./problem4 input.txt input2.txt input1.txt
.PHONY: clean
clean :
	rm -f *.tab.c *.h *.output problem1 problem2 problem3 *.out *.o problem4 *.yy.c
