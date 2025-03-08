%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern int yylex();
void yyerror(char *s);
extern FILE *yyin;
extern FILE *yyout;
%}

%union{
    int ival ;
    double dval ; 
}


/* Declare tokens */
%token A 
%token B
%token <ival> NUMBER
%token ADD SUB MUL DIV LPAREN RPAREN EOL POW

%left ADD SUB
%left MUL DIV 
%right POW

%type <dval> exp term factor 

%start calclist
%%
calclist :
    | calclist exp EOL {fprintf(yyout,"value= %.2f\n",$2);}
    ;
exp         :
    term                        {$$ = $1 ;}
    | exp ADD term              {$$ = $1 + $3;}
    | exp SUB term              {$$ = $1 - $3;}
    ;

term        :
    factor                      {$$ = $1 ;}
    | term MUL factor           {$$ = $1 * $3 ;}
    | term DIV factor           {
                            if($3==0){
                                yyerror("Division by zerro");
                                YYABORT ;
                            }else
                            {
                                $$ = $1/$3 ;
                            }
                         }
    | term POW factor          {$$ = pow($1,$3);}
    ;

factor:
    NUMBER                      {$$ = $1 ;}
    | LPAREN exp RPAREN         {$$ = $2 ;}
    ;

%%

int main(int argc, char **argv) {
    FILE *file,*output ;
    
    output= fopen("output.txt","w");
    if(!output){
        fprintf(stderr,"Error: can't open output.txt file\n");
        fclose(file);
        exit(1);
    }
    yyout=output ;


    if(argc >1 ){
        for(int i=1 ;i<argc ;i++){
        file = fopen(argv[i],"r");
        if(!file)
        {
            fprintf(stderr, "Error: can't open file %s\n",argv[1]);
            exit(1);
        }

        yyin=file ;
        yyrestart(file);
        yyparse();
        fclose(file);
    }
    
    fclose(output);
    return 0;
    }
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
      // Exit on error for simplicity
}