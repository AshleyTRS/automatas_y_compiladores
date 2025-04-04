%option noyywrap
%option yylineno
%{
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
FILE *yyin;
int COUNT_PALABRA=0;
int COUNT_CHAR=0;
int COUNT_ACC = 0;
int COUNT_NL = 0;
int COUNT_NI = 0;
int COUNT_NUM = 0;
int COUNT_BTO = 0;
int COUNT_JO = 0;
int COUNT_DIGITS = 0;
%}

DIGITS [0-9]+
CHARACTERS [:¡,.!" ]
NI [Nn][Ii][áéíóúüñÁÉÍÓÚÜÑa-zA-Z]*
NUM [Nn][úÚ][mM][a-zA-Z]*
BTO [bB][áéíóúüñÁÉÍÓÚÜÑa-zA-Z]*[Tt][OoóÓ]
JO [áéíóúüñÁÉÍÓÚÜÑa-zA-Z]*[Jj][OoóÓ]
WORDS [áéíóúüñÁÉÍÓÚÜÑa-zA-Z0-9]+
%%
\n {COUNT_NL++;}
"números" {COUNT_NUM++; COUNT_CHAR+= yyleng;}
{NI} {COUNT_NI++; COUNT_CHAR+= yyleng;}
{BTO} {COUNT_BTO++; COUNT_CHAR+= yyleng;}
{JO} {COUNT_JO++; COUNT_CHAR+= yyleng;}
{DIGITS} {COUNT_DIGITS++; COUNT_CHAR+= yyleng;}
{WORDS} {COUNT_PALABRA++; COUNT_CHAR+= yyleng;}
{CHARACTERS} {COUNT_CHAR++;}
%%
int main()
{
FILE *file_7;
char nameFile[]="test.txt";
file_7 = fopen(nameFile, "r");

if(!file_7){
printf("THERE WAS AN ERROR IN OPENING YOUR FILE");
return 1;
}
yyin = file_7;
yylex();
fclose(file_7);
printf("TOTAL DE LINEAS: %d\n", COUNT_NL);
printf("TOTAL DE PALABRAS: %d\n", COUNT_PALABRA+COUNT_NI+COUNT_NUM+COUNT_BTO+COUNT_JO+COUNT_DIGITS);
printf("TOTAL DE CARACTERES: %d\n", COUNT_CHAR);
printf("TOTAL DE PALABRAS NI...: %d\n", COUNT_NI);
printf("TOTAL DE PALABRAS NUM...: %d\n", COUNT_NUM);
printf("TOTAL DE PALABRAS B...TO: %d\n", COUNT_BTO);
printf("TOTAL DE PALABRAS ...JO: %d\n", COUNT_JO);
printf("TOTAL DE DIGITOS: %d\n", COUNT_DIGITS);
return 0;
}
