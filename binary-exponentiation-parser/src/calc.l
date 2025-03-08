%{
#include "calc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%option noyywrap  

%%
0b[01]+              { yylval.bin_value = strtol(yytext + 2, NULL, 2); return BINARY; }
"^"                 { return EXPONENTIATION; }
[ \t]               { /* ignore whitespace */ }
\n                  { return NEWLINE; }
.                   { return yytext[0]; }

%% 

int yywrap() {
    return 1;
}