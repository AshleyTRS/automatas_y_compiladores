%{
	#include<stdio.h>
	int yylex(void);
	int yyerror(const char *s) {
		fprintf(stderr, "Error: %s\n", s);
		return 0;
	}
%}
 
/**DECLARACIONES/
%token NUM PLUS MINUS TIMES DIVIDE EOL
%start statements
/*REGLAS DE PRODUCCION*/
%%
statements : statement statements
	   | statement
	   ;

statement : expression EOL { printf("= %d\n", $1);}
	  ;

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           | expression PLUS expression { $$ = $1 + $3; printf("SUMA+: %d\n", $$);}
	   | expression MINUS expression {$$ = $1 - $3; printf("RESTA-: %d\n", $$);}
	   | expression TIMES expression {$$ = $1 * $3; printf("MULTIPLICACION*: %d\n");}
	   | expression DIVIDE expression {$$ = $1 / $3; printf("DIVIDE/: %d\n, $$");}
	   ;

%%

int main () {
yyparse();
return 0;
}