%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "y.tab.h"
	int yywrap();
	int yyerror(char *s);
%}
%%
[0-9]+	{yylval = atoi(yytext); return NUM; }
[*]	{return TIMES;}
\n	{return EOL;}
[ \t\r]	{}
%%

int yywrap(void){
    return 1;
}
