%{
#include<stdio.h>
int ch,words,spaces=0;
%}

%%
[a-zA-z0-9]+	{words++; ch+=yyleng;}
[\t]	{spaces++;ch++;}
" "	{spaces++;ch++;}
\n	{ch++;}
.	{ch++;}
%%

int main()
{
FILE*fp;
fp=fopen("input.txt","r");
if(fp==NULL)
{
printf("File not found");
return 1;
}
yyin=fp;
yylex();
fclose(fp);

printf("Total Characters:%d\n",ch);
printf("Total words:%d\n",words);
printf("Total Spaces:%d\n",spaces);

return 0;
}

int yywrap()
{
return 1;
}
