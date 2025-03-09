%{
#include <stdlib.h>
#include "problem4.tab.h"
%}

%option noyywrap  

%% 
a          {return A ;}
b          {return B ;}
[0-9]+     {yylval.ival =atoi(yytext); return NUMBER ;}
"+"        {return ADD ;}
"-"        {return SUB ;}
"*"        {return MUL ;}
"/"        {return DIV ;}
"("        {return LPAREN ;}
")"        {return RPAREN ;}
"^"        {return POW ;}
\n         {return EOL ;}
[ \t]      {printf("space or tab \n");}
.          { printf(" mystery character %c\n", yytext[0]) ; }


%%


