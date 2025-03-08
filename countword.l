%{
#include "calc.tab.h"
#include <stdlib.h>
%}

%option noyywrap  

%% 


"+"       {return ADD ;}
"-"       {return MINUS;}
"*"       {return MUL ;}
"/"       {return DIV ;}
"|"       {return ABS ;}
"("       {return OP  ;}
")"       {return CP  ;}
"&"       {return AND ;}
"||"      {return OR ;}
[0-9]+ {  yylval = atoi(yytext) ; return NUMBER ;  }
0x[a-fA-F0-9]+ { yylval = strtol(yytext,NULL,0) ; return NUMBER ;}
"//".*\n  { return EOL; }  /* Ignore comment, return EOL */
\n        { return EOL;}
[ \t]     { }
.         { printf(" mystery character %c\n", *yytext) ; }



%% 
/*
void main(int argc , char **argv){
    int tok ;
    while(tok = yylex()){
        printf("%d", tok);
        if(tok == NUMBER)
            printf(" = %d\n", yylval);
        else 
            printf("\n");

    }
}
*/