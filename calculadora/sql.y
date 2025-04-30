%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
int yylex();
int yyerror();
symbtbl *ptr;
%}
%union
{
struct{
	int numerorighe;
	symbtbl *Mystr;
};
};
%token <numerorighe> NL
%token <Mystr> IDENTIFIER CONST '<' '>' '=' '*' '(' ')'
%token SELECT FROM WHERE AND OR DELETE INSERT INTO VALUES
%type <Mystr> identifiers cond compare op tablename
%type <Mystr> valuelist
%%

lines: line
	| lines line
	| lines error
	;

line: select identifiers FROM identifiers WHERE cond NL {
/*printf("Line %d \n",$7);
printf("columns: %s\n",$2);
printf("tables: %s\n\n",$4);*/
ptr=putsymb($2,$4,$7,NULL);
};

line: delete FROM tablename WHERE cond NL {
/*printf("Line %d \n",$6);
printf("table: %s\n", $3);*/
ptr=putsymb(NULL,$3,$6,NULL);
}
| delete FROM tablename NL {
ptr=putsymb(NULL, $3, $4,NULL);
}
;

line: insert into tablename open identifiers close values open valuelist close NL {
/*printf("Row %d is correct\n",$11);
printf("INSERT query detected\n");
printf("table name: %s\n", $3);
printf("columns: %s\n", $5);
printf("values: %s\n", $9);*/
ptr=putsymb($5, $3, $11, $9);
}; 

valuelist: CONST {$$=strdup($1);}
	| IDENTIFIER {$$=strdup($1);}
	| CONST ',' valuelist { char *s = malloc(strlen($1)+strlen($3)+3);
				sprintf(s, "%s, %s", $1, $3);
				$$ = s;
				}
	|IDENTIFIER ',' valuelist{ char *s = malloc(strlen($1)+strlen($3)+3);
				sprintf(s, "%s, %s", $1, $3);
				$$ = s;
				}
	;

identifiers:    '*' {$$=strdup("ALL");}
		| IDENTIFIER {$$=strdup($1);}
		| IDENTIFIER','identifiers{
			char *s = malloc(strlen($1) + strlen($3)+3);
			sprintf(s, "%s, %s", $1, $3);
			$$=s;
};

tablename: IDENTIFIER {$$=$1;};

select: SELECT;

delete: DELETE;

insert: INSERT;

into: INTO;

values: VALUES;

cond:	  IDENTIFIER op compare
	| IDENTIFIER op compare conn cond;

compare: IDENTIFIER
	| CONST;

op:	 '<'
	|'='
	|'>';

conn: 	  AND
	| OR;

open: '(';

close: ')';
%%
int yyerror(char *s){
  printf("  --ERROR--  %s\n\n",s);
  /*printf("\tERROR IN LINE %4d\n", yylval+1);
  */
	return *s;
}
int main() {
FILE* del;
char filename[] = "results.txt";
del = fopen(filename,"a");
remove(filename);
yyparse();
return 0;
}
