%{
#include "boolean.tab.h"
%}

%%
"true"         { return TRUE; }
"false"        { return FALSE; }
"and"          { return AND; }
"or"           { return OR; }
"not"          { return NOT; }
"("            { return '('; }
")"            { return ')'; }
[ \t\n]+       { /* Ignore whitespace */ }
.              { return yytext[0]; }

%%
int yywrap() {
    return 1;
}
