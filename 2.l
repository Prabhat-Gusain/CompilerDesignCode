%{
#include<stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf("%s -> This is a valid identifier\n", yytext); }
.                          { printf("%s -> This is not a valid identifier\n", yytext); }
%%

int main()
{
printf("Enter any identifier you want to check:\n");
yylex();
return 0;
}

int yywrap()
{
return 1;
}