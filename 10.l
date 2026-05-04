%{
#include<stdio.h>
FILE*fout;
%}

%%
[0-9]*[02468]	{fprintf(fout,"%s is even number:\n",yytext);}
[0-9]*[13579]	{fprintf(fout,"%s is an odd number:\n",yytext);}
[ \t\n]		{}
.	{}
%%

int main(){
FILE*fp;

fp=fopen("input4.txt","r");
if(!fp)
{
printf("error\n");
return 1;
}

fout=fopen("output3.txt","w");
if(!fout)
{
printf("Error output file\n");
return 1;
}

yyin=fp;
yylex();


fclose(fp);
fclose(fout);
return 0;
}