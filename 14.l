%{
#include<stdio.h>
%}

%s Q1 Q2 Q3 

%%
<INITIAL>a	{BEGIN(Q1);}
<INITIAL>b	{BEGIN(Q2);}

<Q1>a	{BEGIN(INITIAL);}
<Q1>b	{BEGIN(Q3);}

<Q2>a	{BEGIN(Q3);}
<Q2>b	{BEGIN(INITIAL);}

<Q3>a	{BEGIN(Q2);}
<Q3>b	{BEGIN(Q1);}

\n	{
		if(YY_START==INITIAL)
		{
			printf("accepted \n");
		}
		else
		{
			printf("not accepted \n");
			BEGIN INITIAL;
		}
	}	
%%

int main()
{
	printf("Enter string:\n");
	yylex();
	return 0;
}
int yywrap()
{
	return 1;
}