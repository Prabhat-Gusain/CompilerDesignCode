%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER ADD SUB MUL DIV
%left ADD SUB
%left MUL DIV

%%
line	:expr '\n'	{printf("Result=%d\n",$1);};

expr	:expr ADD expr	{$$=$1+$3;}
	|expr SUB expr	{$$=$1-$3;}
	|expr MUL expr 	{$$=$1*$3;}
	|expr DIV expr	{$$=$1/$3;}
	|NUMBER		{$$=$1;}
	;
%%
void yyerror(const char*s)
{
	printf("invalid expression\n");
}

int main()
{
	printf("Enter Expression");
	yyparse();
	return 0;
}