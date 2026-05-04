%{
#include<stdio.h>
int lines,spaces,tab,ch=0;	
%}


%%
\n	{lines++;}
" "	{spaces++;}
\t	{tab++;}
.	{ch++;}
%%

int main()
{
printf("Enter sentence (End with ctrl+D)");
yylex();
printf("No of Lines :%d \n",lines);
printf("No of Spaces :%d \n",spaces);
printf("No of Tab :%d \n",tab);
printf("No of Other Characters :%d \n",ch);
return 0;
}

int yywrap()
{
return 1;
}
	