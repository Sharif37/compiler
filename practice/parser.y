%{

#include<stdio.h>

int yylex() ;
void yyerror(const char *s); 
%}

%token IDENTIFIER 
%token NUMBER
%start program


%%
program: IDENTIFIER NUMBER IDENTIFIER NUMBER {printf("program -> IDENTIFIER NUMBER IDENTIFIER NUMBER \n ") ; }	
%%

int main(void) {
	// sharif 123 omar 1331 
	yyparse() ;

}


void yyerror(const char *s) {
printf("Error: %s\n",s ) ;
}

