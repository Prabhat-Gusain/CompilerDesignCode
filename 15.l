%{
#include<stdio.h>
%}

%s INT FLOAT ID DEAD Q1

%%
<INITIAL>[0-9]	{BEGIN(INT);}
<INITIAL>[a-zA-Z_]	{BEGIN(ID);}
<INITIAL>"."	{BEGIN(DEAD);}

<INT>[0-9]	{BEGIN(INT);}
<INT>"."	{BEGIN(Q1);}
<INT>[a-zA-Z]	{BEGIN(DEAD);}

<Q1>[a-zA-Z]	{BEGIN(DEAD);}
<Q1>[0-9]	{BEGIN(FLOAT);}
<Q1>"."		{BEGIN(DEAD);}

<FLOAT>[0-9]	{BEGIN(FLOAT);}
<FLOAT>[a-zA-Z]	{BEGIN(DEAD);}
<FLOAT>"."	{BEGIN(DEAD);}

<ID>[a-zA-Z_0-9]	{BEGIN(ID);}
<ID>"."		{BEGIN(DEAD);}

<DEAD>[a-zA-Z0-9_"."]	{BEGIN(DEAD);}

\n	{
		if(YY_START==INT)
			printf("Integer\n");
		else if(YY_START==FLOAT)
			printf("Float\n");
		else if(YY_START==ID)
			printf("Idenitifier\n");
		else
			printf("Invalid \n");
		BEGIN INITIAL;
	}
%%

int main()
{
	printf("Enter string: \n");
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}