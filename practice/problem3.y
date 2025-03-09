%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
extern int yylex();
void yyerror(const char *s);
char * concanate(char * , char *);
char* repeat(char* , int );
%}
%union {
    int num ;
    char *str ;
}

%left PLUS 
%left POW

%token <str> A 
%token <num> NUMBER
%token POW EOL PLUS 
%type <str> sentence word1 input 
%%
input: 
    /* empty */ { $$ = NULL; } | input sentence EOL {
          printf("result = %s \n" ,$2 ) ;
     }
     ;

sentence: 
    word1 {$$ = strdup($1) ;}
    | sentence PLUS sentence {
        $$ = concanate($1, $3);
    } 
    | sentence POW NUMBER {
        $$ = repeat($1,$3) ;
    }
    ;

word1:
    A { $$ = $1; }
    ;

%% 

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

char * concanate(char* a, char* b){
    char* c;

    c = malloc(strlen(a) + strlen(b) + 1);
    if(c==NULL){
        fprintf(stderr , "memory allocation error \n");
        exit(1);
    }
   
    strcpy(c, a);
    strcat(c, b);
    return c;
}

char * repeat(char * a , int n){
    int length = n * strlen(a) + 1;
    char * c = malloc (length);

    if(c==NULL){
        fprintf(stderr , "memory allocation error \n");
        exit(1);
    }
    c[0] = '\0';
    for(int i = 0; i < n; i++){
        strcat(c, a);
    }
    return c;
}

int main() {
    return yyparse();
}
