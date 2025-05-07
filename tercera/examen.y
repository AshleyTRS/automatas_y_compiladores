%{
	#include<stdio.h>
	int yylex(void);
	int yyerror(const char *s) {
		fprintf(stderr, "Error: %s\n", s);
		return 0;
	}
%}
 
%token NUM TIMES EOL
%start statements

%%
statements : statement statements
	   | statement
	   ;

statement : expression EOL { printf("= %d\n", $1);}
	  ;

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           | expression TIMES expression { $$ = $1 * $3; printf("MUTLIPLICACION*: %d\n", $$);}
	   ;

%%

int main () {
yyparse();
}
