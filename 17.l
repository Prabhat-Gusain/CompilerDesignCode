%{
#include"17.tab.h"
%}

%%
[0-9]+	{return NUMBER;}
[a-zA-Z]+	{return ID;}
"+"	{return PLUS;}
"-"	{return MINUS;}
"*"	{return MUL;}
"/"	{return DIV;}
"("	{return LPAREN;}
")"	{return RPAREN;}
[\t]	;
\n	{return '\n';}
.	{return yytext[0];}
%%

int yywrap()
{
	return 1;
}