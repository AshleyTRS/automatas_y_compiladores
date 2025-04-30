%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
#include "y.tab.h"
int numerorighe=0;
%}
%option noyywrap
%%
select			return SELECT;
from			return FROM;
where			return WHERE;
and			return AND;
or			return OR;
delete			return DELETE;
insert			return INSERT;
into			return INTO;
values			return VALUES;
[()]			{return yytext[0]; }
[,]			{return yytext[0]; }
[=<>]			{return yytext[0]; }
[*]			{return  '*'; }
\'[^\']*\'		{yylval.Mystr = strdup(yytext); return IDENTIFIER;}
[a-zA-Z][a-zA-Z0-9_]*	{yylval.Mystr=strdup(yytext);
			return IDENTIFIER;}
[0-9]+			{yylval.Mystr=strdup(yytext); return CONST;}
\n			{++yylval.numerorighe; return NL;}
[ \t]+			/* ignore whitespace */

%%
