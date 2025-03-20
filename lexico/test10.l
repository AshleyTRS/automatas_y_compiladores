%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%%
(main|auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while) { printf("Palabra reservada de C: %s\n", yytext); }
[_a-zA-Z][_a-zA-Z0-9]* { printf("Variable o identificador: %s\n", yytext); }
. { }
%%
int main() {
    char filename[] = "c_lang.txt";
    yyin = fopen(filename, "r");
    if (!yyin) { perror("Error abriendo archivo"); return 1; }
    yylex();
    fclose(yyin);
    return 0;
}