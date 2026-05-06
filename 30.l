%{
    #include<stdio.h>
%}

%s Q1 Q2 Q3 Q4 DEAD

%%
<INITIAL>[0-9]+     {BEGIN Q1;}
<INITIAL>[a-zA-Z]   {BEGIN Q4;}
<INITIAL>"."    {BEGIN DEAD;}


<Q1>"."     {BEGIN Q2;}
<Q1>[0-9]   {BEGIN Q1;}
<Q1>[a-zA-Z]    {BEGIN DEAD;}


<Q2>[0-9]+  {BEGIN Q3;}
<Q2>[^0-9]  {BEGIN DEAD;}

