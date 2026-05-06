%{
    #include<stdio.h>
%}

%s q1 q2 q3
%%
<INITIAL>a { BEGIN q1; }
<INITIAL>b { BEGIN q2; }
<q1>a { BEGIN INITIAL; }
<q1>b { BEGIN q3; }
<q2>a { BEGIN q3; }
<q2>b { BEGIN INITIAL; }
<q3>a { BEGIN q2; }
<q3>b { BEGIN q1; }
\n {
 if(YY_START == INITIAL)
 printf("Accepted\n");
 else
 printf("Rejected\n");
 BEGIN INITIAL;
}
%%
int main()
{
 printf("Enter string:\n");
 yylex();
}
int yywrap()
{
 return 1;
}