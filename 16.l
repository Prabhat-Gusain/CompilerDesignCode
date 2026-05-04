%{
#include<stdio.h>
%}

%s A B DEAD

%%
<INITIAL>a	{BEGIN(A);}
<INITIAL>b	{BEGIN(DEAD);}
<INITIAL>[^ab\n]	{printf("invalid \n");}

<A>a	{BEGIN(A);}
<A>b	{BEGIN(B);}
<A>[^ab\n]	{BEGIN(DEAD);}

<B>a	{BEGIN(A);}
<B>b	{BEGIN(B);}
<B>[^ab\n]	{BEGIN(DEAD);}

<DEAD>[ab]	{BEGIN(DEAD);}
<DEAD>[^ab\n]	{BEGIN(DEAD);}

\n	{
		if(YY_START==B)
			printf("accepted!!\n");
		else
			printf("not accepted!!\n");
		BEGIN INITIAL;
	}
%%

int main()
{
	printf("Enter String:\n");
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}