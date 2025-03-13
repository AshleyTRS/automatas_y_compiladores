%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[A-Z]{4,4}[0-9]{6,6}[0-9A-Z]{3,3}$ {printf("RECONOCIDO rfc");}
%%
int main()
{
	return yylex();
}