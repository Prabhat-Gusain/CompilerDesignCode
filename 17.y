%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER ID PLUS MINUS MUL DIV LPAREN RPAREN
%left PLUS MINUS 
%left MUL DIV

%%
line:expr'\n'	{printf("valid expression\n");};

expr:	expr PLUS expr
	|expr MINUS expr
	|expr MUL expr
	|expr DIV expr 
	|LPAREN expr RPAREN
	|NUMBER
	|ID
	;
%%

void yyerror(const char *s)
{
	printf("invalid Expression\n");
}
int main()
{
	printf("Enter expression:");
	yyparse();
	return 0;
}