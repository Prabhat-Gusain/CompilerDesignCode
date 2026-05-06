%{
    #include"27.tab.h"    
%}

%%
[0-9]+  {yylval=atoi(yytext);return NUMBER;}
"+"     {return PLUS;}
"-"     {return MINUS;}
"*"     {return MUL;}
"/"     {return DIV;}
[a-zA-z]    {return ID;}
"("     {return LPAREN;}
")"     {return RPAREN;}
[ \t]   ;
\n      {return '\n';}
%%

int yywrap()
{
    return 1;
}