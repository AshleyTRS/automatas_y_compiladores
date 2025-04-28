%{
	#include <stdio.h>
	#include "y.tab.h"
	int yywrap();
	int yyerror(char *s);
	extern int yylval;
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUM; }
"+" {return PLUS; }
"-" {return MINUS; }
"*" {return TIMES;}
\n { return EOL; }
[ \t\r] { /*ignora espacios en blanco*/ }
%%

int yywrap(void) {
    return 1;
}