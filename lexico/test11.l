%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%%
\/\/.* { printf("comentario RECONOCIDO: %s\n", yytext); }
\/\*[^*]*\*+([^/*][^*]*\*+)*\/ { printf("comentario RECONOCIDO: %s\n", yytext); }
\"([^\"\\]|\\.)*\" { printf("Texto en pantalla RECONOCIDO: %s\n", yytext); }
. { }
%%
int main() {
    char filename[] = "comentarios";
    yyin = fopen(filename, "r");
    if (!yyin) { perror("Error abriendo archivo"); return 1; }
    yylex();
    fclose(yyin);
    return 0;
}
