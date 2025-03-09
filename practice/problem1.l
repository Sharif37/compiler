%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylval;
%}

%option noyywrap

%%
0[xX][0-9A-Fa-f]+    {   
                         yylval = strtol(yytext, NULL, 16);
                         printf("Hex value = %s, equivalent decimal = %d\n", yytext, yylval);
                         
                     }
\n                   { /* Ignore newline characters */ }
.                    { printf("Not recognized: %c\n", *yytext); }
<<EOF>>              {return 0 ;}
%%

int main(int argc , char **argv) {
   FILE *input ,*output ;
   if(argc > 1){
   input = fopen(argv[1],"r");

   if(!input){
    fprintf(stderr, "Error : can't open file %s \n ", argv[1]);
    return 1 ;

   }
    yyin = input ;
}

yylex() ;

if(yyin != stdin){
    fclose(yyin) ;
}

return 0 ;

}