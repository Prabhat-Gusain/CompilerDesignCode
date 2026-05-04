%{
    #include<stdio.h>
%}

%s Q1 Q2 Q3 Q4

%%
<INITIAL>a  {BEGIN(Q1);}
<INITIAL>b  {BEGIN(Q3);}

<Q1>a   {BEGIN(Q1);}
<Q1>b   {BEGIN(Q2);}

<Q2>a   {BEGIN(Q1);}
<Q2>b   {BEGIN(Q2);}

<Q3>a   {BEGIN(Q4);}
<Q3>b   {BEGIN(Q3);}

<Q4>a   {BEGIN(Q4);}
<Q4>b   {BEGIN(Q3);}

\n      {
            if(YY_START==Q1 || YY_START==Q3)
                printf("Accepted\n");
                
            else{
                printf("not accepted\n");
            }
            BEGIN INITIAL;
        }
%%

int main()
{
    printf("enter string\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}