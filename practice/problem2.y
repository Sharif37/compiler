%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern int yylex();
void yyerror(char *s);
%}

%token BINARY 
%token PR EOL

%% 
expr : BINARY PR BINARY EOL {
        printf("Result = %lf first =%d second =%d \n", pow($1, $3),$1,$3);
    }
    ;
%%


void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(){
    yyparse();
    return 0 ;
}