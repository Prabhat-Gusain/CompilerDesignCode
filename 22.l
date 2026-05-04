%{
    #include"22.tab.h"
%}

%%
[0-9]+  {yylval=atoi(yytext);return NUMBER;}
"+"     {return PLUS;}
[ \t]   ;
\n      {return '\n';}
.       {return yytext[0];}
%%

int yywrap()
{
    return 1;
}