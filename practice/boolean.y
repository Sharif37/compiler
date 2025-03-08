%{
#include <stdio.h>
#include <stdlib.h>

/* Function prototypes */
void yyerror(const char *s);
int yylex();
int result; // To store the result of the evaluated expression
%}

/* Token declarations */
%token TRUE FALSE AND OR NOT
%left OR
%left AND
%right NOT

/* Grammar rules */
%%
bexpr   : bexpr OR bterm       { $$ = $1 || $3; }
        | bterm                { $$ = $1; }
        ;

bterm   : bterm AND bfactor    { $$ = $1 && $3; }
        | bfactor              { $$ = $1; }
        ;

bfactor : NOT bfactor          { $$ = !$2; }
        | '(' bexpr ')'        { $$ = $2; }
        | TRUE                 { $$ = 1; }
        | FALSE                { $$ = 0; }
        ;

%%
/* Error handler */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

/* Main function */
int main() {
    printf("Enter a boolean expression kaka:\n");
    if (yyparse() == 0) { // If parsing is successful
        printf("Result: %s\n", result ? "true" : "false");
    } else {
        printf("Invalid expression.\n");
    }
    return 0;
}
