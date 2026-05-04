%{
#include<stdio.h>
FILE*fout;
%}

%%
[ \t]+	{fprintf(fout," ");}
\n	{fprintf(fout,"\n");}
.	{fprintf(fout,"%s",yytext);}	
%%

int main()
{
	FILE*fp;

	fp=fopen("input2.txt","r");
	fout=fopen("result.txt","w");

	if(fp==NULL)
	{
		printf("file not found\n");
		return 1;
	}
	if(fout==NULL)
	{
		printf("File not found output file\n");
		return 1;
	}
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