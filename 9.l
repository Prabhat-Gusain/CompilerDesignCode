%{
#include<stdio.h>
FILE*fout;
%}

%%
\"[a-zA-Z0-9]+\"	{fprintf(fout,"%s is a string\n",yytext);}
"int"|"float"|"char"|"double"|"if"|"else"	{fprintf(fout,"%s is a keyword\n",yytext);}
[0-9]+\.[0-9]+	{fprintf(fout,"%s is a constant",yytext);}
[ \t\n]		{ }
%%

int main()
{
FILE*fp;

fp=fopen("input3.txt","r");
fout=fopen("result2.txt","w");

if(fp==NULL)
{
printf("FIle opening error");
}

if(fout==NULL)
{
printf("file output error");
return 1;
}


yyin=fp;
yylex();
return 0;
}

int yywrap()
{
return 1;
}