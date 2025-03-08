%{
#include <stdio.h>
#include "stringex.tab.h"  // Include Yacc/Bison token definitions
#define MAX_STR 100  // Maximum string length
%}

%option noyywrap  

%%
[a-zA-Z] { 
    // Match a single letter and store it in yylval.str
    yylval.str[0] = yytext[0];
    yylval.str[1] = '\0';  // Null-terminate
    return LETTER; 
}

[0-9]+ { 
    // Convert number to int and store in yylval.num
    yylval.num = atoi(yytext);
    return NUMBER; 
}

[\t\n ]  { /* Ignore whitespace and newlines */ }
"*"      { return '*'; }
"^"      { return '^'; }
.        { return yytext[0]; }  // Return any other character for error handling
%%