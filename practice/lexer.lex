%{

#include<stdio.h>
#include "parser.tab.h"

%}

%%

[0-9]+   { return NUMBER ; }
[a-z]+   { return IDENTIFIER;}
[ \t\n]  {}

%%

int yywrap(void) {
    return 1;
}


