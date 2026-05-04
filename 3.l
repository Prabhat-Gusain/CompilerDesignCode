%{
#include<stdio.h>
%}

%%
[0-9]+	{ printf("%sThis is an integer number:\n",yytext);}
[0-9]+\.[0-9]+	{ printf("%sThis is a float number:\n",yytext);}
[a-zA-Z]+	{ printf("%sThis is not a valid number:\n",yytext);}
%%

int main()
{
printf("Enter number to check integer or float:\n");
yylex();
return 0;
}

int yywrap()
{
return 1;
}