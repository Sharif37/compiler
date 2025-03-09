%{

#include <stdlib.h>
#include <stdio.h>
#include "problem3.tab.h"

%}

%option noyywrap



%%
[a-z]+      {yylval.str = strdup(yytext) ; return A ;}
[0-9]+     {yylval.num = atoi(yytext) ; return NUMBER;}
"+"         {return PLUS ;}
"^"         { return POW ; }
\n          { return EOL ; }
[ \t]       { }
.           { printf("Unexpected character: %s\n", yytext); }

%%



