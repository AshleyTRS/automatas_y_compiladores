%{
	#include <stdio.h>
	#include "y.tab.h"
	int yywrap();
	int yyerror(char *s);
	extern int yylval;
%}
%option noyywrap
%%
[0-9]+	{yylval = atoi(yytext); return NUM; }
[*]	{return TIMES;}
\n	{return EOL;}
[ \t\r]	{}
%%

int yywrap(){
    return 1;
}