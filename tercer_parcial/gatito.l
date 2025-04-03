%option noyywrap
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <fcntl.h>
	#include <unistd.h>
	#include <string.h>
	#define TOKEN_PALABRA 1
	#define TOKEN_CHAR 2
	#define TOKEN_NEWLINE 3
	#define TOKEN_ACC 4
	FILE *yyin;
	int COUNT_PALABRA=0;
	int COUNT_CHAR=0;
	int COUNT_ACC = 0;
	int COUNT_NL = 0;
%}
ACCENTS [\xe1\xe9\xed\xf3\xfa\xfc\xf1\xc1\xc9\xcd\xd3\xda\xdc\xd1]
WORDS [\xe1\xe9\xed\xf3\xfa\xfc\xf1\xfc\xc1\xc9\xcd\xd3\xda\xdc\xd1a-zA-Z0-9]+
CHARACTERS [\xe1\xe9\xed\xf3\xfa\xfc\xf1\xfc\xc1\xc9\xcd\xd3\xda\xdc\xd1a-zA-Z0-9:¡,.!"\n ]
%%
{ACCENTS} {COUNT_ACC++; return TOKEN_ACC;}
{WORDS} {COUNT_PALABRA++; return TOKEN_PALABRA;}
\n {COUNT_NL++; return TOKEN_NEWLINE;}
{CHARACTERS} {COUNT_CHAR++; return TOKEN_CHAR;}

%%
int main()
{
	FILE *file_7;
	char nameFile[]="elbrutodelasmates.txt";
	//char nameFile[]="ok.txt";
	file_7 = fopen(nameFile, "rb");

	if(!file_7){
		printf("THERE WAS AN ERROR IN OPENING YOUR FILE");
		return 1;
	}
	yyin = file_7;
	yylex();
	int token;
	while((token = yylex()) != 0){
		token = yylex();
	}
	printf("\nTOTAL DE LINEAS: %d", COUNT_NL);
	printf("\nTOTAL DE PALABRAS: %d", COUNT_PALABRA);
	printf("\nTOTAL DE CARACTERES: %d", COUNT_CHAR);
	printf("\nTOTAL DE ACENTOS: %d", COUNT_ACC);
	COUNT_PALABRA = 0;
	COUNT_CHAR=0;
	COUNT_NL=0;
	COUNT_ACC=0;
	fclose(file_7);
	return 0;
}