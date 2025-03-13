%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[-|\+]?[0-9]+[.][0-9]*$ {printf("RECONOCIDO decimal");}

%%
int main()
{
	return yylex();
}