%{
#include <stdio.h>
extern int yylex();
#include<string.h>
void yyerror(const char *s);
%}

%union {
    char str[100];  // Fixed-size char array for strings
    int num;
}

%token <str> LETTER  // Single letter (e.g., 'a', 'B')
%token <num> NUMBER
%left '*'
%left '^'

%type <str> expr

%%
start:
    expr '\n' { printf("Result = %s\n", $1); }
    | /* empty */
    ;

expr:
    LETTER { strcpy($$, $1); }  // Copy letter to result
    | expr '*' expr { 
        // Concatenate, ensure no overflow
        if (strlen($1) + strlen($3) >= 100 - 1) {
            yyerror("String too long");
        } else {
            strcpy($$, $1);
            strcat($$, $3);
        }
    }
    | expr '^' NUMBER { 
        // Repeat string, ensure no overflow
        $$[0] = '\0';  // Start with empty string
        if ($3 <= 0) {
            yyerror("Non-positive exponent not supported");
        } else if ($3 * strlen($1) >= 100 - 1) {
            yyerror("String too long");
        } else {
            for (int i = 0; i < $3; i++) {
                strcat($$, $1);
            }
        }
    }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter string expressions (e.g., a * B, C ^ 3), or press Ctrl+D/Ctrl+C to exit:\n");
    return yyparse();
}