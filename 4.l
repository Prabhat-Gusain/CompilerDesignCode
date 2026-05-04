%{
#include<stdio.h>
%}

%%
"+"|"-"|"/"|"*"|"="	{printf("%s is an operator \n",yytext);}
","|";"	{printf("%s is a seperator \n",yytext);}
"int"|"for"|"while"|"char"|"bool"|"float"	{printf("%s is a keyword \n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]*	{printf("%s is a identifier \n",yytext);}
[0-9]+[0-9]+	{printf("%s is a constant\n",yytext);}
%%

int main()
{
printf("Write your C program for Tokenizing \n");
yylex();
return 0;
}

int yywrap()
{
return 1;
}