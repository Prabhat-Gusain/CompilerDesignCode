%{
#include"18.tab.h"
#include<stdlib.h>
%}

%%
[0-9]+	{yylval=atoi(yytext);return NUMBER;}
"+"	{return ADD;}
"-"	{return SUB;}
"*"	{return MUL;}
"/"	{return DIV;}
[\t]	;
\n	{return '\n';}
.	{return yytext[0];}
%%

int yywrap()
{
	return 1;
}