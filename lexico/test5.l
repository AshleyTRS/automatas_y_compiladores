%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z][AEIOU][A-Z]{2}[0-9]{2}([0][1-9]|[1][0-2])([0][1-9]|[1-2][0-9]|[3][0-1])[HM][A-Z]{2}[B-DF-HJ-NP-TV-Z]{3}[A-Z0-9]{2}$ {printf("RECONOCIDO curp");}
%%
int main()
{

	return yylex();
}