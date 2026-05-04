%{
#include<stdio.h>
%}

%s A B DEAD

%%
<INITIAL>a	{BEGIN(A);}
<INITIAL>b	{BEGIN(DEAD);}

<A>a	{BEGIN(A);}
<A>b	{BEGIN(B);}
<A>[^ab\n]	{BEGIN(DEAD);}
<A>\n	{printf("Not accepted");}

<B>a	{BEGIN(A);}
<B>b	{BEGIN(B);}
<B>[^ab\n]	{BEGIN(DEAD);}
<B>\n	{printf("accepted");}

<DEAD>a	{BEGIN(DEAD);}
<DEAD>b	{BEGIN(DEAD);}
%%

int main()
{
	printf("Enter the string:\n");
	yylex();
	return 0;
}
int yywrap()
{
	return 1;
}