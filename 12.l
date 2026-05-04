%{
#include<stdio.h>
FILE*fout;
%}

%%
[a-zA-Z_]+[a-zA-Z0-9]*"@"["gmail"|"outlook"]+"."["com"|"in"|"org"]	{fprintf(fout,"It is a valid email address:%s\n",yytext);}
[^ \t\n]	{fprintf(fout,"Invaild email address:%s",yytext);}
[ \t\n]		{}
%%

int main()
{
FILE*fp;

fp=fopen("input6.txt","r");
fout=fopen("result4.txt","w");

yyin=fp;
yylex();

fclose(fp);
fclose(fout);
return 0;
}

int yywrap()
{
return 1;
}