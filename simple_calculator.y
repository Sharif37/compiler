%{
#include <stdio.h>
#include <stdlib.h>

int yylex();     
void yyerror(const char *s); 

%}

%token NUMBER ADD SUB MUL DIV LPAREN RPAREN EOL


%left ADD SUB
%left MUL DIV
%right POW  

/* The grammar rules  */
%%

calclist: /*empty*/ | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp:
    term                               { $$ = $1; }
    | exp ADD term                     { $$ = $1 + $3; }
    | exp SUB term                     { $$ = $1 - $3; }
    ;

term:
    factor                             { $$ = $1; }
    | term MUL factor                  { $$ = $1 * $3; }
    | term DIV factor                  {
                                          if ($3 == 0) {
                                              yyerror("Division by zero");
                                              YYABORT;
                                          } else {
                                              $$ = $1 / $3;
                                          }
                                      }
    ;

factor:
    NUMBER                             { $$ = $1; }
    | LPAREN exp RPAREN                { $$ = $2; }
    ;

%%


int main(void) {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}

/* for error handling */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
