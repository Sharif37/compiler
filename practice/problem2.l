%{
#include<stdio.h>
#include "problem2.tab.h"
%}

%option noyywrap

%%
[+-]?[01]+ {
    if (yytext[0] == '-') {
        yylval = -1;
        yylval *= strtol(yytext + 1, NULL, 2);
    } else if (yytext[0] == '+') {
        yylval = 1;
        yylval *= strtol(yytext + 1, NULL, 2);
    } else {
        yylval = strtol(yytext, NULL, 2);
    }
    
    return BINARY;
}
"PR"    { return PR; }
\n      { return EOL; }
[ \t]+  { /* Ignore whitespace characters */ }
.       { printf("Not recognized: %c\n", *yytext); }


%%
