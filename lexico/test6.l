%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[a-z]{2,2}[0-9]+\@[a-z]+.[a-z]+.[a-z]+$ {printf("RECONOCIDO correo institucional");}
%%
int main()
{

	return yylex();
}