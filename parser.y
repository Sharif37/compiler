%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%left PLUS MINUS    /* Lower precedence */
%left TIMES DIVIDE  /* Higher precedence */

%%

program:
    expression    { printf("Result: %d\n", $1); }
    ;

expression:
    expression PLUS term    { $$ = $1 + $3; }
    | expression MINUS term { $$ = $1 - $3; }
    | term                  { $$ = $1; }
    ;

term:
    term TIMES factor    { $$ = $1 * $3; }
    | term DIVIDE factor { $$ = $1 / $3; }
    | factor             { $$ = $1; }
    ;

factor:
    LPAREN expression RPAREN { $$ = $2; }
    | NUMBER                 { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("number") ;
    return 0;
}