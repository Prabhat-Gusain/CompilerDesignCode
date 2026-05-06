%{
    #include<stdio.h>    
%}

%s Q1 Q2 DEAD

%%
<INITIAL>a  {BEGIN Q1;}
<INITIAL>b  {BEGIN DEAD;}

<Q1>a   {BEGIN Q1;}
<Q1>b   {BEGIN Q2;}

<Q2>a   {BEGIN Q1;}
<Q2>b   {BEGIN Q2;}

<DEAD>a    {BEGIN DEAD;} 
<DEAD>b    {BEGIN DEAD;} 

\n      {
            if(YY_START==Q2)
                printf("expression valid\n");
            else
                printf("not valid\n");
            BEGIN INITIAL;
        }

%%

int main()
{
    printf("Enter String:");
    yylex();
    return 0;
}