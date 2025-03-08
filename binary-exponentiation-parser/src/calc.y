%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(const char *s);

%}

%token BINARY
%token EXPONENTIATION

%% 

expression:
    BINARY EXPONENTIATION BINARY {
        long base = strtol(yytext, NULL, 2);
        long exponent = strtol(yytext + 2, NULL, 2);
        long result = pow(base, exponent);
        printf("Result: %ld\n", result);
    }
    | BINARY {
        long value = strtol(yytext, NULL, 2);
        printf("Value: %ld\n", value);
    }
    ;

%% 

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter binary exponentiation expressions (e.g., 0b10 ^ 0b11):\n");
    yyparse();
    return 0;
}