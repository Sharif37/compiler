%{
#include "simple_calculator.tab.h"  
%}

%%

"+"       { return ADD; }
"-"       { return SUB; }
"*"       { return MUL; }
"/"       { return DIV; }
"("       { return LPAREN; }
")"       { return RPAREN; }
[0-9]+    { yylval = atoi(yytext); return NUMBER; }
\n        { return EOL; }
[ \t]     { /* ignore whitespace */ }
.         { printf("Mystery character %s\n", yytext); return 0; }

%%


/*https://www.oreilly.com/library/view/flex-bison/9780596805418/ch01.html*/

