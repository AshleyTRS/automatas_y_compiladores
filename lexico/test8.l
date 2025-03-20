%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%%
^(aplicar|calcular|construir|demostrar|emplear|ejecutar|experimentar|modificar|resolver|utilizar)$
 { printf("RECONOCIOD verbo de aplicacion: %s\n", yytext); }
. { }
%%
int main() {
    char filename[] = "verbos.txt";
    yyin = fopen(filename, "r");
    if (!yyin) { perror("Error abriendo archivo"); return 1; }
    yylex();
    fclose(yyin);
    return 0;
}