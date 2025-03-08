#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"

extern int yyparse();

int main(int argc, char **argv) {
    printf("Enter a binary exponentiation expression (e.g., 0b10 ^ 0b11):\n");
    yyparse();
    return 0;
}